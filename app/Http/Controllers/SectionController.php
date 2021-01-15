<?php
/**
 * Created by PhpStorm.
 * User: antonzemlya
 * Date: 08.01.2021
 * Time: 21:58
 */

namespace App\Http\Controllers;
use Illuminate\Http\Request;

use App\Section;
use App\Product;

class SectionController extends Controller
{

    public function __construct()
    {
        //$pages = Section::where('id', '7')->get();
        $page_title = Section::find(7)['title'];

    }

    public function index()
    {
        return view('single-1');
    }

    public function getPageData(Request $request)
    {
        $page = Section::where('virtual_name', $request->section)->get();

        if (sizeof($page)>0) {
            $page_data = $page[0];
            $template_id = $page_data['template_id'];

            switch ($template_id){
                case 3:
                    $template_view = 'shop-grid-left-sidebar';
                    $products = $this->getProducts($page_data['id']);
                    break;
                case 4:
                    $template_view = 'single-1';
                    $products = null;
                    break;
            }

            return view(
                $template_view, [
                'page_data' => $page_data,
                'products' => $products
            ]);

        } else {
            return '404';
        }
    }

    public function getProducts($id)
    {
        return Section::where('parent_id', $id)->get();
    }
}