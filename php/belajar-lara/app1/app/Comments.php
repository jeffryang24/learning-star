<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comments extends Model
{
    protected $fillable = ['body', 'posts_id', 'user_id'];

    public function posts(){
        return $this->belongsTo(Posts::class);
    }

    public function users(){
        return $this->belongsTo(User::class);
    }
}
