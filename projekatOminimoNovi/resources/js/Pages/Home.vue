<script setup>
import { Head, Link } from '@inertiajs/vue3';

defineProps({
    canLogin: {
        type: Boolean,
    },
    canRegister: {
        type: Boolean,
    },
    laravelVersion: {
        type: String,
        required: true,
    },
    phpVersion: {
        type: String,
        required: true,
    },
});
</script>

<template>
    <Head title="Welcome" />

    <div class="welcome-container">
        <div class="header-section">
            <div v-if="canLogin" class="auth-links">
                <Link
                    v-if="$page.props.auth.user"
                    :href="route('dashboard')"
                    class="btn-primary"
                >
                    Dashboard
                </Link>
                <template v-else>
                    <Link
                        :href="route('login')"
                        class="btn-secondary"
                    >
                        Log in
                    </Link>

                    <Link
                        v-if="canRegister"
                        :href="route('register')"
                        class="btn-secondary ms-4"
                    >
                        Register
                    </Link>
                </template>
            </div>
        </div>

        <div class="main-content">
            <h1 class="main-title">Welcome to Our Platform!</h1>
            <p class="main-description">
                Discover and share your thoughts, ideas, and projects with the world. 
            </p>

            <div class="action-links">
                <Link
                    :href="route('posts')" replace preserve-state preserve-scroll
                    class="btn-primary"
                >
                    View Posts
                </Link>

                <Link
                    :href="route('postCreate')"
                    class="btn-primary ms-4"
                >
                    Create Post
                </Link>
            </div>
        </div>

        <footer class="footer-section">
            <p class="footer-text">Powered by Laravel {{ laravelVersion }} & PHP {{ phpVersion }}</p>
        </footer>
    </div>
</template>

<style scoped>
.welcome-container {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    min-height: 100vh;
    background-color: #f3f4f6;
    padding: 20px;
    text-align: center;
    color: #333;
}

.header-section {
    display: flex;
    justify-content: flex-end;
    padding: 10px;
    background-color: #1f2937;
}

.auth-links {
    display: flex;
    gap: 10px;
}

.main-content {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    flex: 1;
    padding: 40px 20px;
}

.main-title {
    font-size: 2.5em;
    font-weight: bold;
    color: #1f2937;
    margin-bottom: 15px;
}

.main-description {
    font-size: 1.2em;
    color: #4b5563;
    margin-bottom: 30px;
}

.action-links {
    display: flex;
    justify-content: center;
    gap: 15px;
}

.btn-primary, .btn-secondary {
    display: inline-block;
    padding: 12px 20px;
    background-color: #2563eb;
    color: #fff;
    border-radius: 5px;
    text-decoration: none;
    font-weight: bold;
    transition: background-color 0.3s ease, transform 0.2s ease;
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

.footer-section {
    padding: 10px;
    background-color: #1f2937;
    color: #9ca3af;
    text-align: center;
}

.footer-text {
    font-size: 0.9em;
}
</style>
