<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Posts;

class PostPolicy
{
    /**
     * Create a new policy instance.
     */
    public function __construct()
    {
        //
    }

     /**
     * Odredite da li korisnik može ažurirati post.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Posts  $post
     * @return bool
     */
    public function update(User $user, Posts $post)
    {
        // Korisnik može ažurirati post samo ako je vlasnik
        return $user->id === $post->user_id;
    }

    /**
     * Odredite da li korisnik može obrisati post.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Posts  $post
     * @return bool
     */
    public function delete(User $user, Posts $post)
    {
        // Korisnik može obrisati post samo ako je vlasnik
        return $user->id === $post->user_id;
    }
}
