<?php

namespace App\Http\Controllers;

use App\Models\Comments;
use Illuminate\Http\Request;
use Inertia\Response;
use Inertia\Inertia;
use App\Models\Posts;
use Illuminate\Support\Facades\Auth;

class PostsController extends Controller
{
    //
    public function posts(Request $request): Response
    {
        $posts = Posts::with('user')->get();

        return Inertia::render('Posts/Posts', [
            'posts' => $posts // Prosleđivanje podataka Vue komponenti
        ]);
    }

    public function store(Request $request): Response
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
            'user_id' => 'required'
        ]);

        // Kreiranje novog posta nakon uspešne validacije
        Posts::create([
            'title' => $request->input('title'),
            'content' => $request->input('content'),
            'user_id' => $request->input('user_id')
        ]);

        $posts = Posts::with('user')->get();

        return Inertia::render('Posts/Posts', [
            'posts' => $posts // Prosleđivanje podataka Vue komponenti
        ]);
    }

    public function onePost($id): Response
    {
        $post = Posts::with('user')->find($id);
        $comments = Comments::with('post')->with('user')->where('post_id', $id)->get();
        $currentUser = auth()->user();

        return Inertia::render('Posts/OnePost', [
            'post' => $post, // Prosleđivanje podataka Vue komponenti
            'comments' => $comments,
            'currentUserId' => $currentUser ? $currentUser->id : null,

        ]);
    }

    public function edit($id)

    {
        $post = Posts::with('user')->findOrFail($id);
        // dd(auth()->user()->id, $post->user_id);
        $this->authorize('update', $post);

        return Inertia::render('Posts/Edit', [
            'post' => $post,
        ]);
    }

    public function update(Request $request,$id)
    {
        $post = Posts::with('user')->findOrFail($id);
        // Proverava da li korisnik ima pravo da ažurira post
        $this->authorize('update', $post);

        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
        ]);

        $post->update($request->only('title', 'content'));

        $posts = Posts::with('user')->get();
        return Inertia::render('Posts/Posts', [
            'posts' => $posts,
        ]);
        // return redirect()->route('posts.index')->with('message', 'Post updated successfully');
    }

    public function destroy($id)
    {
        
        $post = Posts::with('user')->findOrFail($id);
        // dd($post);
        // Proverava da li korisnik ima pravo da obriše post
        $this->authorize('delete', $post);

        $post->delete();

        $posts = Posts::with('user')->get();

        return redirect()->route('postsStore')->with('posts', $posts);
    }

    public function comment(Request $request, $id): Response
    {
        $request->validate([
            'comment' => 'required|string|max:500',
            
        ]);

        // Kreiranje novog posta nakon uspešne validacije
        Comments::create([
            'comment' => $request->comment,
            'post_id' => $id,
            'user_id' => Auth::check() ? Auth::id() : null
        ]);

        $posts = Posts::with('user')->get();

        return Inertia::render('Posts/Posts', [
            'posts' => $posts // Prosleđivanje podataka Vue komponenti
        ]);
    }

}
