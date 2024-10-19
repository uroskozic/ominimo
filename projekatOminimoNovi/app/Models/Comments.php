<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Comments extends Model
{
    const UPDATED_AT = null;
    use HasFactory, Notifiable;

    /**
    * @var string $table
    */
    protected $table = 'comments';

    /**
    * @var string $primaryKey
    */
    protected $primaryKey = 'id';

    /**
    * @var string[] $fillable
    */
    protected $fillable = [
        'id', 'post_id', 'user_id', 'comment', 'created_at'
    ];

    public function post(){
        return $this->belongsTo(Posts::class);
    }
    public function user(){
        return $this->belongsTo(User::class);
    }
}
