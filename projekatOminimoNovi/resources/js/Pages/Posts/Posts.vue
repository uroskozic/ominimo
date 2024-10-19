<template>
    <div class="post-list">
        <!-- Sekcija za Login, Register ili Dashboard -->
        <div class="auth-links">
            <template v-if="$page.props.auth.user">
                <Link
                    :href="route('dashboard')"
                    class="btn-primary"
                >
                    Dashboard
                </Link>
            </template>
            <template v-else>
                <Link
                    :href="route('login')"
                    class="btn-secondary"
                >
                    Log in
                </Link>

                <Link
                    
                    :href="route('register')"
                    class="btn-secondary ms-4"
                >
                    Register
                </Link>
            </template>
        </div>

        <!-- Prikaz liste postova -->
        <h2>List of Posts</h2>
        <div v-if="posts && posts.length">
            <div v-for="(post, index) in posts" :key="index" class="post-item">
                <div @click="goToPost(post.id)" class="clickable-div">
                    <h3 class="post-title">{{ post.title }}</h3>
                    <p class="post-content">{{ post.content }}</p>
                    <small class="post-author" v-if="post.user">By: {{ post.user.name }}</small>
                    <small class="post-author" v-else>Author not available</small>
                </div>
            </div>
        </div>
        <div v-else>
            <p class="no-posts-message">No posts available.</p>
        </div>
    </div>
</template>

<script>
import { Inertia } from '@inertiajs/inertia';
import { Link } from '@inertiajs/vue3';

export default {
    props: {
        posts: Array, // Očekuje niz postova koji je prosleđen iz kontrolera
        canRegister: Boolean // Dodato za prikaz dugmeta za registraciju
    },
    methods:{
        goToPost(postId) {
            // Preusmeravanje na rutu sa post.id kao parametrom
            Inertia.visit(route('onePost', postId));
        }
    },
    components: {
        Link
    }
}
</script>

<style scoped>
.auth-links {
    display: flex;
    justify-content: flex-end;
    padding: 10px;
    background-color: #f3f4f6;
    gap: 10px;
    margin-bottom: 20px;
}

.btn-primary, .btn-secondary {
    display: inline-block;
    padding: 12px 20px;
    border-radius: 5px;
    text-decoration: none;
    font-weight: bold;
    transition: background-color 0.3s ease, transform 0.2s ease;
    cursor: pointer;
}

.btn-primary {
    background-color: #2563eb;
    color: #fff;
}

.btn-primary:hover {
    background-color: #1d4ed8;
    transform: translateY(-2px);
}

.btn-secondary {
    background-color: #6b7280;
    color: #fff;
}

.btn-secondary:hover {
    background-color: #4b5563;
    transform: translateY(-2px);
}

.post-list {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f8f9fa;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.post-item {
    background-color: #ffffff;
    border-radius: 10px;
    padding: 15px;
    margin-bottom: 15px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    cursor: pointer;
}

.post-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.clickable-div {
    text-decoration: none;
    color: inherit;
}

.post-title {
    font-size: 1.5em;
    color: #333;
    margin-bottom: 10px;
    font-weight: 600;
}

.post-content {
    font-size: 1em;
    color: #666;
    margin-bottom: 10px;
}

.post-author {
    font-size: 0.9em;
    color: #888;
}

.no-posts-message {
    text-align: center;
    font-size: 1.2em;
    color: #777;
    padding: 20px;
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}
</style>
