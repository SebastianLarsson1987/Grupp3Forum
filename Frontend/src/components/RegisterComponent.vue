<template>
    <div class="row d-flex justify-content-center">
        <div class="col-md-8 mt-5">
            <h5 class="card-header"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
  <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
  <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
</svg>
Register</h5>
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

            <div style="position:absolute;"  >
 
                <router-link style="color:black;"  class="nav-link link-light" to="/gdpr">
                     <div class="form-check">
                    <input class="form-check-input" type="radio" name="flexRadioDisabled" id="flexRadioCheckedDisabled" checked disabled>
                    <label class="form-check-label" for="flexRadioCheckedDisabled">
                    By clicking submit you agree to the privacy policy. Read more - GDPR
                </label>
                </div>
                </router-link>
            </div>

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
