<template>
    <div class="update-post-container">
        <div class="form-container">
            <form @submit.prevent="updatePost">
                <div class="form-group">
                    <label for="title">Title</label>
                    <input
                        type="text"
                        id="title"
                        v-model="form.title"
                        class="form-control"
                        placeholder="Enter post title"
                    />
                    <!-- Prikazivanje poruke o grešci ako je polje prazno -->
                    <span v-if="errors.title" class="error">{{ errors.title }}</span>
                </div>

                <div class="form-group">
                    <label for="content">Content</label>
                    <textarea
                        id="content"
                        v-model="form.content"
                        class="form-control"
                        placeholder="Enter post content"
                    ></textarea>
                    <!-- Prikazivanje poruke o grešci ako je polje prazno -->
                    <span v-if="errors.content" class="error">{{ errors.content }}</span>
                </div>

                <button type="submit" class="btn btn-primary btn-submit">Update Post</button>
            </form>
        </div>
        <Link :href="route('posts')" replace preserve-state preserve-scroll class="btn-back">
            Back to All Posts
        </Link>
    </div>
</template>

<script>
import { Link } from '@inertiajs/vue3';

export default {
    props: {
        post: Object // Post koji dolazi iz kontrolera kao prop
    },
    data() {
        return {
            // Popunjavanje forme sa postojećim vrednostima iz posta
            form: {
                title: this.post.title,
                content: this.post.content,
            },
            errors: {
                title: null,
                content: null
            }
        };
    },
    methods: {
        updatePost() {
            // Resetovanje grešaka
            this.errors.title = null;
            this.errors.content = null;

            // Proveravanje da li su polja prazna
            if (!this.form.title) {
                this.errors.title = 'Title is required.';
            }
            if (!this.form.content) {
                this.errors.content = 'Content is required.';
            }

            // Ako postoje greške, zaustavi dalji proces
            if (this.errors.title || this.errors.content) {
                return;
            }

            // Slanje ažuriranih podataka pomoću Inertia.js
            this.$inertia.put(route('update', this.post.id), this.form);
        }
    },
    components: {
        Link
    }
}
</script>

<style scoped>
.update-post-container {
    max-width: 600px;
    margin: 0 auto;
    padding: 30px;
    background-color: #f9f9f9;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.form-container {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 20px;
}

.form-control {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1em;
}

.form-control:focus {
    outline: none;
    border-color: #3490dc;
    box-shadow: 0 0 5px rgba(52, 144, 220, 0.5);
}

.error {
    color: #e3342f;
    font-size: 0.9em;
    margin-top: 5px;
    display: block;
}

.btn-submit {
    padding: 12px 20px;
    background-color: #3490dc;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s ease;
    width: 100%;
    text-align: center;
}

.btn-submit:hover {
    background-color: #2779bd;
}

.btn-back {
    display: inline-block;
    margin-top: 10px;
    padding: 10px 15px;
    background-color: #6c757d;
    color: #fff;
    border-radius: 5px;
    text-decoration: none;
    text-align: center;
    font-weight: bold;
    transition: background-color 0.3s ease;
    width: 100%;
}

.btn-back:hover {
    background-color: #5a6268;
}

.btn-primary {
    background-color: #3490dc;
    border: none;
    color: #fff;
}

.btn-primary:hover {
    background-color: #2779bd;
}
</style>
