<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->string('comment')->nullable();
            $table->string('shipping_address');
            $table->float('discount', 8, 2)->nullable();
            $table->string('status')->default('pending');
            $table->string('payment_type');
            $table->float('total', 8, 2);
            $table->float('charges', 8, 2)->nullable()->default(0);
            $table->float('sub_total', 8, 2);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
}
