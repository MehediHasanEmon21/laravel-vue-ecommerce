<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Model\Order;
use App\Model\OrderItem;

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
}
