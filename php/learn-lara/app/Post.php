<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Post extends Model
{
    protected $fillable = ['title', 'body', 'user_id'];

    public function comments() {
        return $this->hasMany(Comment::class);
    }

    public function user() {
        return $this->belongsTo(User::class);
    }

    public function addComment($comment) {
        $this->comments()->create([
            'body' => $comment
        ]);
    }

    public function scopeFilter($query, $filters) {
        $query->whereMonth('created_at', Carbon::parse($filters['month'])->month)->whereYear('created_at', $filters['year']);
    }

    public static function archives() {
        return static::selectRaw('year(created_at) as year, monthname(created_at) as month, count(*) as total_post')->groupBy('year', 'month')->orderByRaw('min(created_at) desc')->get()->toArray();
    }
}
