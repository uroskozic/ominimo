<template>
    <div class="post-container">
        <div class="post-actions">
            <Link :href="route('posts')" replace preserve-state preserve-scroll class="btn-back">
                Back to All Posts
            </Link>
            <Link v-if="currentUserId === post.user_id" :href="route('edit', post.id)" class="btn-edit">
                Edit Post
            </Link>
            <button v-if="currentUserId === post.user_id" @click="deletePost(post.id)" class="btn-delete">Delete Post</button>
        </div>

        <div class="post-content">
            <h3>{{ post.title }}</h3>
            <p>{{ post.content }}</p>
            <small v-if="post.user">By: {{ post.user.name }}</small>
            <small v-else>Author not available</small>
        </div>

        <div class="comment-section">
            <label for="comment">Add a Comment:</label>
            <textarea
                id="comment"
                v-model="newComment"
                class="form-control"
                placeholder="Enter your comment"
            ></textarea>
            <button  @click="submitComment" class="btn-submit-comment">Submit Comment</button>
        </div>

        <h4>Comments:</h4>
        <div v-if="comments && comments.length">
            <div v-for="(comment, index) in comments" :key="index" class="comment-item">
                <h5>{{ comment.comment }}</h5>
                <small v-if="comment.user">By: {{ comment.user.name }}</small>
                <small v-else>By: Guest</small>
                <button v-if="currentUserId === comment.user_id || currentUserId === post.user_id" @click="deleteCom(comment.id)" class="btn-delete-comment">Delete Comment</button>
            </div>
        </div>
        <div v-else>
            <p class="no-comments">No comments available.</p>
        </div>
    </div>
</template>

<script>
import { Inertia } from '@inertiajs/inertia';
import { Link } from '@inertiajs/vue3';
export default {
    props: {
        post: Object,
        comments: Array,
        currentUserId: Number
    },
    components: {
        Link
    },
    data() {
        return {
            newComment: ''
        }
    },
    methods: {
        deletePost(id) {
            if (confirm('Are you sure you want to delete this post?')) {
                Inertia.delete(route('deletee', id), {
                    onSuccess: () => {
                        Inertia.replace(route('postsStore'));
                    }
                });
            }
        },
        deleteCom(id) {
            if (confirm('Are you sure you want to delete this comment?')) {
                Inertia.delete(route('deleteComment', id));
            }
        },
        submitComment() {
            if (!this.newComment.trim()) {
                alert("Comment cannot be empty!");
                return;
            }

            Inertia.post(route('comment', this.post.id), {
                comment: this.newComment
            }, {
                onSuccess: () => {
                    this.newComment = '';
                }
            });
        }
    }
}
</script>

<style scoped>
.post-container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.post-actions {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
}

.btn-back, .btn-edit, .btn-delete {
    padding: 10px 15px;
    border-radius: 5px;
    text-decoration: none;
    font-weight: bold;
    cursor: pointer;
}

.btn-back {
    background-color: #007bff;
    color: #fff;
}

.btn-edit {
    background-color: #ffc107;
    color: #fff;
}

.btn-delete {
    background-color: #dc3545;
    color: #fff;
}

.btn-back:hover, .btn-edit:hover, .btn-delete:hover {
    opacity: 0.8;
}

.post-content {
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    margin-bottom: 30px;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
}

.comment-section {
    padding: 20px;
    background-color: #f1f1f1;
    border-radius: 10px;
    margin-bottom: 20px;
}

.form-control {
    width: 100%;
    padding: 10px;
    margin-top: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    resize: vertical;
}

.btn-submit-comment {
    display: inline-block;
    margin-top: 10px;
    padding: 10px 15px;
    background-color: #28a745;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.btn-submit-comment:hover {
    opacity: 0.9;
}

.comment-item {
    background-color: #fff;
    padding: 15px;
    border-radius: 10px;
    margin-bottom: 15px;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
    position: relative;
}

.comment-item h5 {
    font-size: 1.1em;
    margin-bottom: 5px;
}

.comment-item small {
    color: #888;
}

.btn-delete-comment {
    position: absolute;
    top: 15px;
    right: 15px;
    background-color: #dc3545;
    color: #fff;
    padding: 5px 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 0.9em;
}

.btn-delete-comment:hover {
    opacity: 0.8;
}

.no-comments {
    text-align: center;
    font-size: 1.1em;
    color: #777;
}
</style>
