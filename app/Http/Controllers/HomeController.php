<?php

namespace App\Http\Controllers;

use App\User;
use App\Brand;
use App\Model\Order;
use App\Model\Product;
use App\Model\Category;
use App\Model\OrderItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */


    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('public.public_master');
    }

    public function authUser()
    {
        $user = Auth::user();
        return response()->json([
            'user' => $user
        ], 200);
    }

    public function userList()
    {
        $users = User::latest()->paginate(10);
        return response()->json([
            'user_list' => $users
        ], 200);
    }

    public function serachUser($query)
    {
        $users = User::where('name', 'like', '%' . $query . '%')->paginate(5);
        return response()->json([
            'search_users' => $users

        ], 200);
    }

    public function orderList($number = 10)
    {

        $orders = Order::with(['order_items', 'user'])->where('user_id', Auth::user()->id)->orderBy('id', 'DESC')->paginate($number);
        return response()->json([
            'orders' => $orders

        ], 200);
    }

    public function dashboard_info()
    {

        $category_count = Category::get()->count();
        $product_count = Product::get()->count();
        $brand_count = Brand::get()->count();
        $user_count = User::get()->count();
        $order_count = Order::get()->count();
        $pending_order_count = Order::where('status', 'pending')->get()->count();
        $success_order_count = Order::where('status', 'success')->get()->count();

        return response()->json([
            'category' => $category_count,
            'product' => $product_count,
            'brand' => $brand_count,
            'user' => $user_count,
            'order' => $order_count,
            'pending_order' => $pending_order_count,
            'success_order' => $success_order_count,
        ]);
    }
}
