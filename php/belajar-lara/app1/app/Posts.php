<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Posts extends Model
{
    protected $fillable = ['body', 'title', 'user_id'];

    public function comments(){
        return $this->hasMany(Comments::class);
    }

    public function users(){
        return $this->belongsTo(User::class, 'user_id');
    }

    public function addComment($body){
        /*Comments::create([
            'body' => $body,
            'posts_id' => $this->id
        ]);*/

        //$this->comments()->create(compact('body'));
        $this->comments()->create($body);
    }
}
