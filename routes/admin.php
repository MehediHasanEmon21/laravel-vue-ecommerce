<?php

use Illuminate\Support\Facades\Route;


Route::get('/login', 'Admin\LoginController@showLoginForm')->name('admin.login');
Route::post('/login', 'Admin\LoginController@login')->name('admin.login.post');

Route::group(['middleware' => 'auth:admin'], function () {

    Route::get('/', function () {
        return view('admin.admin_master');
    })->name('admin.dashboard');
    Route::get('/user', function () {
        return response()->json([
            'admin' => \Auth::guard('admin')->user()
        ], 200);
    });
    Route::get('/logout', 'Admin\LoginController@logout')->name('admin.logout');

    //category route
    Route::resource('category', 'CategoryController');
    Route::post('/category/multi/delete', 'CategoryController@multiDelete');
    Route::get('/all-category', 'CategoryController@allCategory')->name('admin.all.category');

    //brand route
    Route::resource('brand', 'BrandController');
    Route::post('/brand/multi/delete', 'BrandController@multiDelete')->name('admin.brand.multidelete');
    Route::get('/all-brand', 'BrandController@allBrand')->name('admin.all,brand');

    Route::get('/user-list', 'HomeController@userList')->name('admin.user.list');
    Route::get('/search-user/{query}', 'HomeController@serachUser')->name('admin.user.list');

    //product route
    Route::resource('product', 'ProductController');

    Route::get('/order-list', 'OrderController@index');
    Route::get('/order-detail/{id}', 'OrderController@detail');
    Route::get('/order-success/{id}', 'OrderController@success');

    Route::post('/product/multi/delete', 'ProductController@multiDelete');
    Route::post('/product-update/{id}', 'ProductController@updateProduct');

    Route::get('/admin-dashboard-info', 'HomeController@dashboard_info');
});



Route::get('/{path}', function () {
    return view('admin.admin_master');
});

Route::get('/{path}/{id}', function () {
    return view('admin.admin_master');
});
