<?php

use Illuminate\Support\Facades\Route;

Route::group(['middleware' => 'auth'], function () {

    Route::get('user-dashboard', 'HomeController@index');
    Route::get('/', 'HomeController@authUser');

    //wishlisht

    Route::resource('/wishlist', 'WishListController');
});


Route::get('/{path}', 'HomeController@index');
