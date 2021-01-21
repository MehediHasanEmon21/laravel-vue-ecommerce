<?php

namespace App\Http\Controllers;

use Cart;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function addCart(Request $request)
    {

        $cart = Cart::add(
            [
                'id' => $request->id,
                'name' => $request->name,
                'price' => $request->price,
                'quantity' => 1,
                'attributes' => [
                    'image' => $request->image,
                    'size' => $request->size[0],
                    'color' => $request->color[0]
                ]
            ]
        );

        return response()->json($cart);
    }

    public function addCartModal(Request $request)
    {
        $cart = Cart::add(
            [
                'id' => $request->product['id'],
                'name' => $request->product['name'],
                'price' => $request->product['price'],
                'quantity' => $request->qty,
                'attributes' => [
                    'image' => $request->product['image'],
                    'size' => $request->size,
                    'color' => $request->color
                ]
            ]
        );

        return response()->json($cart);
    }

    public function allCart()
    {
        $carts = Cart::getContent();

        return response()->json([
            'carts' => $carts,
            'total' => Cart::getTotal(),
            'count' => Cart::getContent()->count(),
        ]);
    }

    public function remove_cart($id)
    {
        Cart::remove($id);
    }

    public function update_cart(Request $request)
    {
        Cart::update($request->id, array(
            'quantity' => array(
                'relative' => false,
                'value' => $request->qty
            ),
        ));
    }
}
