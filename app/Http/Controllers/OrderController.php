<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Cart;
use Auth;
use App\Model\Order;
use App\Model\OrderItem;

class OrderController extends Controller
{

    public function index($number = 10)
    {

        $orders = Order::with(['order_items', 'user'])->paginate($number);
        return response()->json([
            'orders' => $orders

        ], 200);
    }

    public function detail($id)
    {

        $order = Order::with(['order_items', 'user'])->where('id', $id)->first();
        return response()->json([
            'order' => $order

        ], 200);
    }

    public function checkout(Request $request)
    {
        $user = Auth::user();

        $shipping_address = '';
        if ($request->shippind_address) {

            $shipping_address = $request->shipping;
        } else {
            $shipping_address = $user;
        }

        $total = Cart::getTotal();
        $sub_total = Cart::getTotal();

        $payment_type = $request->payment_type;

        $order = new Order();

        $order->user_id = $user->id;
        $order->shipping_address = json_encode($shipping_address);
        $order->payment_type = $payment_type;
        $order->total = $total;
        $order->sub_total = $sub_total;
        $order->save();

        $items = Cart::getContent();

        foreach ($items as $key => $item) {
            $order_item = new OrderItem();
            $order_item->order_id = $order->id;
            $order_item->item_name = $item->name;
            $order_item->item_price = $item->price;
            $order_item->item_quantity = $item->quantity;
            $order_item->save();
        }

        return response()->json('ok');
    }
}
