<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pages', function (Blueprint $table) {
            $table->increments('id');
            $table->string('template_type');
            $table->integer('template_page_id');

            //$table->morphs('template');

            $table->string('name');
            $table->string('h1')->nullable();
            $table->string('title')->nullable();
            $table->text('description')->nullable();
            //@ToDo: реализовать интерфейс slug
            $table->string('slug')->unique();
            $table->text('full_text')->nullable();
            $table->integer('counter')->unsigned()->default(0);
            $table->string('thumb_image')->nullable();
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
        Schema::dropIfExists('pages');
    }
}
