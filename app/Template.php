<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Template extends Model
{
    public function pages()
    {
        return $this->belongsTo('App\Page','template_id','template_id');
    }
}
