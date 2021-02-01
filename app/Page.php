<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Relations\Relation;

Relation::morphMap([
    '4' => 'App\Product',
    '3' => 'App\Category',
]);

class Page extends Model
{
    protected $table = 'sections';

    use Sluggable;

    /**
     * Return the sluggable configuration array for this model.
     *
     * @return array
     */
    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'name'
            ]
        ];
    }

    public function pageable() {
        return $this->morphTo(
            'pageable', // имя связи
            'template_id', // поле, определяющее тип
            'template_page_id' // id связанной сущности
        );
    }

    public function view() {
        return $this->hasOne('App\Template', 'template_id', 'template_id');
    }
}
