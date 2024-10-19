<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Comments;
use Inertia\Response;
use Inertia\Inertia;
use App\Models\Posts;
use Illuminate\Support\Facades\Auth;

class CommentController extends Controller
{
    public function comment(Request $request, $id)
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

        return redirect()->back();
        
    }

    public function destroy($id)
    {
        
        $comment = Comments::with('user')->findOrFail($id);
        
        $this->authorize('delete', $comment);

        $comment->delete();

        return redirect()->back();

        // $posts = Posts::with('user')->get();

        // return redirect()->route('postsStore')->with('posts', $posts);
    }


}
