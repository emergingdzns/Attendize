<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddOrganiserUserPivot extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('organiser_user', function (Blueprint $table) {
            $table->integer('user_id')->unsigned()->index();
            $table->integer('organiser_id')->unsigned()->index();

            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('organiser_id')->references('id')->on('organisers');

            $table->index(['user_id','organiser_id']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        Schema::drop('organiser_user');
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');
    }
}
