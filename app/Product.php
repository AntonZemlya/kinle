<?php

namespace App;

// use Illuminate\Database\Eloquent\Model;

class Product extends Page
{
    public function tags()
    {
        return $this->belongsToMany(Tag::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    /**
     * Get the page data.
     */
    public function page()
    {
        return $this->morphOne('App\Page', 'pageable', 'template_type', 'template_page_id');
    }
}
