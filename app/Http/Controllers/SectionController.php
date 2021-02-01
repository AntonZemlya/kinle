<?php
/**
 * Created by PhpStorm.
 * User: antonzemlya
 * Date: 08.01.2021
 * Time: 21:58
 */

namespace App\Http\Controllers;
use App\Template;
use Illuminate\Http\Request;

use App\Section;
use App\Page;
use App\Product;

class SectionController extends Controller
{

    public function __construct()
    {

    }

    public function index()
    {
        // return view('single-1');
    }

    public function getPageData(Request $request)
    {
        $page = Page::where('virtual_name', $request->virtual_name)->get();
        $page[0]->view->model;

        if (sizeof($page)>0) {
            $page_data = $page[0];
            $template_id = $page_data['template_id'];
            $template_view = $page[0]->view->model;

            switch ($template_id){
                case 3:
                    //$products = $page[0]->products;
                    //echo $products;die;
                    $products = $this->getProducts($page_data['id']);
                    break;
                case 4:
                    $products = null;
                    print_r($page[0]->pageable);//die;
                    //print_r($product);die;
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