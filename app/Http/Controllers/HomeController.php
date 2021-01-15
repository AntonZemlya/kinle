<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\UserInfo;
use App\User;
use Auth;
use Illuminate\Support\Facades\Redis;

//use Carbon\Carbon;
//use Validator;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home', [
            'dates' => $this->getDates()
        ]);
    }

    public function product()
    {
        return view('index-4', "PR_TEST");
    }

    public function getDates()
    {
        $users = User::orderBy('id', 'asc')->where('admin_rights', '0')->get();

        foreach($users as $user)
        {
            $UserInfo = UserInfo::find($user['id']);
            $user['start_date'] = $UserInfo['start_date'];
            $user['end_date'] = $UserInfo['end_date'];
            $user['fixed'] = $UserInfo['fixed'];
        }

        return $users;
    }

    public function addDates(Request $request)
    {
        // получаем параметры запроса (от - до) через валидацию
        $this->validateCalendarRequest($request);

        $UserInfo = UserInfo::find($request->userId);
        $UserInfo->start_date = $request->startDate;
        $UserInfo->end_date = $request->endDate;
        $UserInfo->save();

        return redirect('/home')
            ->withInput();
    }

    /**
     *
     * Валидация параметров запроса событий
     *
     * @param Request $request
     * @return mixed
     */
    protected function validateCalendarRequest(Request $request)
    {
        return $request->validate([
            'startDate' => 'required|date',
            'endDate' => [
                'required',
                'date',
                'after_or_equal:startDate',
            ],
        ]);
    }

    public function fixDates(Request $request)
    {
        if (Auth::user('admin_rights'))
        {
            $UserInfo = UserInfo::find($request->userId);
            $UserInfo->fixed = ($UserInfo->fixed == 0) ? 1 : 0;
            $UserInfo->save();
        }

        return redirect('home');
    }
}
