<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    protected $with = ['order'];
    public function order()
    {
        return $this->belongsTo(Order::class);
    }
}
