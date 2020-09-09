<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = ['category_id', 'brand_id', 'name', 'price', 'discount_price', 'description', 'image', 'color', 'size', 'quantity'];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'color' => 'json',
        'size' => 'json',
    ];
    protected $with = ['category', 'brand'];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }
    public function brand()
    {
        return $this->belongsTo('\App\Brand');
    }
}
