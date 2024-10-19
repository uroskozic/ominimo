<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Posts extends Model
{

    const UPDATED_AT = null;
    use HasFactory, Notifiable;
//     posts (id, user_id, title, content, created_at)

// comments (id, post_id, user_id, comment, created_at)
    
    /**
    * @var string $table
    */
    protected $table = 'posts';

    /**
    * @var string $primaryKey
    */
    protected $primaryKey = 'id';

    /**
    * @var string[] $fillable
    */
    protected $fillable = [
        'id', 'user_id', 'title', 'content', 'created_at'
    ];

    public function comments(){
        return $this->hasMany(Comments::class);
    }
    public function user(){
        return $this->belongsTo(User::class);
    }
}
