<template>
    <div class="create-post-container">
        <h2>Create New Post</h2>
        <form @submit.prevent="submitForm">
            <div class="form-group">
                <label for="title">Title</label>
                <input v-model="form.title" type="text" id="title" class="form-control" placeholder="Enter post title" />
                <span v-if="errors.title" class="error">{{ errors.title }}</span>
            </div>

            <div class="form-group">
                <label for="content">Content</label>
                <textarea v-model="form.content" id="content" class="form-control" rows="5" placeholder="Enter post content"></textarea>
                <span v-if="errors.content" class="error">{{ errors.content }}</span>
            </div>

            <button type="submit" class="btn-submit">Submit</button>
        </form>
    </div>
</template>

<script>
import { useForm, usePage } from '@inertiajs/vue3';
import { reactive } from 'vue';

export default {
    setup() {
        const form = useForm({
            title: '',
            content: '',
            user_id: null,
        });

        const page = usePage();
        if (page.props.auth && page.props.auth.user) {
            form.user_id = page.props.auth.user.id;
        }

        const errors = reactive({
            title: null,
            content: null,
        });

        const validateForm = () => {
            // Resetovanje grešaka
            errors.title = null;
            errors.content = null;

            let valid = true;

            // Provera da li su polja prazna
            if (!form.title) {
                errors.title = 'Title is required.';
                valid = false;
            }
            if (!form.content) {
                errors.content = 'Content is required.';
                valid = false;
            }

            return valid;
        };

        const submitForm = () => {
            // Provera validnosti pre slanja
            if (!validateForm()) {
                return;
            }

            // Slanje POST zahteva koristeći Inertia ako su polja validna
            form.post(route('postsStore'), {
                onSuccess: () => {
                    console.log('Post created successfully');
                },
                onError: (backendErrors) => {
                    // Kombinovanje grešaka sa backend-a sa frontend greškama
                    Object.assign(errors, backendErrors);
                    console.error('Error:', errors);
                },
            });
        };

        return { form, errors, submitForm };
    },
};
</script>

<style scoped>
.create-post-container {
    max-width: 600px;
    margin: 0 auto;
    padding: 30px;
    background-color: #f9f9f9;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

h2 {
    text-align: center;
    margin-bottom: 30px;
    font-size: 1.8em;
    color: #333;
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
    transition: background-color 0.3s ease, transform 0.2s ease;
    width: 100%;
    text-align: center;
}

.btn-submit:hover {
    background-color: #2779bd;
    transform: translateY(-2px);
}

.btn-submit:active {
    background-color: #1d72b8;
    transform: translateY(0);
}
</style>
