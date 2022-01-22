<template>
    <div class="row d-flex justify-content-center">
        <div class="col-md-8 mt-5">
            <h5 class="card-header">Register</h5>
            <br>
            <form @submit.prevent="onSubmit">
                <div class="form-group mb-3">
                    <label><strong>UserName</strong></label>
                    <input
                        type="text"
                        class="form-control form-control-lg"
                        v-model="user.name"
                    />
                </div>

                <div class="form-group mb-3">
                    <label><strong>Email</strong></label>
                    <input
                        type="email"
                        class="form-control form-control-lg"
                        v-model="user.email"
                    />
                </div>

                <div class="form-group mb-3">
                    <label><strong>Password</strong></label>
                    <input
                        type="password"
                        class="form-control form-control-lg"
                        v-model="user.password"
                    />
                </div>

                <div class="d-grid">
                    <input
                        type="submit"
                        class="btn btn-primary btn-lg btn-block"
                        value="Register User"
                    />
                </div>
            </form>
        </div>
    </div>
</template>

<script>
import firebase from 'firebase';

export default {
    data() {
        return {
            user: {
                name: '',
                email: '',
                password: '',
            },
        };
    },
    methods: {
        onSubmit() {
            firebase
                .auth()
                .createUserWithEmailAndPassword(
                    this.user.email,
                    this.user.password
                )
                .then(response => {
                    response.user
                        .updateProfile({
                            displayName: this.user.name,
                        })
                        .then(() => {
                            alert('User successfully registered!');
                            this.user = {
                                name: '',
                                email: '',
                                password: '',
                            };
                            this.$router.push('/dashboard')
                        });
                })
                .catch(err => {
                    console.log(err);
                    alert(err);
                });
        },
    },
};
</script>
