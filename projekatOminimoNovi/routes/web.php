<?php

use App\Http\Controllers\CommentController;
use App\Http\Controllers\PostsController;
use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [PostsController::class, 'posts']);

Route::get('/dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

Route::get('/posts', [PostsController::class, 'posts'])->name('posts');

Route::get('/posts/create', function () {
    return Inertia::render('Posts/PostCreate');
})->middleware(['auth', 'verified'])->name('postCreate');

Route::post('/posts', [PostsController::class, 'store'])->name('postsStore');

Route::get('/posts/{id}', [PostsController::class, 'onePost'])->name('onePost');

Route::get('/posts/{posts}/edit', [PostsController::class, 'edit'])->name('edit');

Route::put('/posts/{id}', [PostsController::class, 'update'])->name('update');

Route::delete('/posts/{id}', [PostsController::class, 'destroy'])->name('deletee');

Route::post('/posts/{id}/comments', [CommentController::class, 'comment'])->name('comment');

Route::delete('/comments/{id}', [CommentController::class, 'destroy'])->name('deleteComment');

require __DIR__.'/auth.php';
