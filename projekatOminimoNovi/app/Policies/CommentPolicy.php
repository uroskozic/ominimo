<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Comments;

class CommentPolicy
{
    /**
     * Create a new policy instance.
     */
    public function __construct()
    {
        //
    }

    /**
     * Odredite da li korisnik može obrisati post.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Comments  $commment
     * @return bool
     */
    public function delete(User $user, Comments $comment)
    {
        // Korisnik može obrisati post samo ako je vlasnik
        return $user->id === $comment->user_id || $user->id === $comment->post->user->id;
    }
}
