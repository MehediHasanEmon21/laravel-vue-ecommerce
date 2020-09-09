<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Brand;
use App\Model\Category;
use App\Model\Product;
use Faker\Generator as Faker;

$factory->define(Product::class, function (Faker $faker) {
    return [
        'category_id' => function () {
            return Category::all()->random();
        },
        'brand_id' => function () {
            return Brand::all()->random();
        },
        'name' => $faker->name,
        'price' => function () {
            return rand(10, 100);
        },
        'discount_price' => function () {
            return rand(10, 50);
        },
        'description' => $faker->text(),
        'image' => $faker->imageUrl($width = 640, $height = 480),
        'color' => $faker->hexcolor,
        'size' => function () {
            $colors = ['sm', 'xs', 'md', 'lg'];
            return $colors[rand(0, 3)];
        },
        'quantity' => function () {
            return rand(1, 10);
        }

    ];
});
