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

    public function allCart()
    {
        $carts = Cart::getContent();

        return response()->json([
            'carts' => $carts,
            'total' => Cart::getTotal(),
            'count' => Cart::getContent()->count(),
        ]);
    }
}
