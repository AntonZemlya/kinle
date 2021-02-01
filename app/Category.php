<?php

namespace App;

// use Illuminate\Database\Eloquent\Model;

class Category extends Page
{
    public function products()
    {
        return $this->hasMany(Product::class);
    }

    /**
     * Get the page data.
     */
    public function page()
    {
        return $this->morphOne('App\Page', 'pageable');
    }
}
