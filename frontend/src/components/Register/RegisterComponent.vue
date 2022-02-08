<template>
    <div class="row d-flex justify-content-center">
        <div class="col-md-8 mt-5">
            <h5 class="card-header">
                <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="20"
                    height="20"
                    fill="currentColor"
                    class="bi bi-person-plus-fill"
                    viewBox="0 0 16 16"
                >
                    <path
                        d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"
                    />
                    <path
                        fill-rule="evenodd"
                        d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"
                    />
                </svg>
                Bli medlem
            </h5>
            <br />
            <form @submit.prevent="onSubmit">
                <div class="form-group mb-3">
                    <label>
                        <strong>Användarnamn</strong>
                    </label>
                    <input type="text" class="form-control form-control-lg" v-model="user.name" />
                </div>

                <div class="form-group mb-3">
                    <label>
                        <strong>E-post</strong>
                    </label>
                    <input type="email" class="form-control form-control-lg" v-model="user.email" />
                </div>

                <div class="form-group mb-3">
                    <label>
                        <strong>Lösenord</strong>
                    </label>
                    <input
                        type="password"
                        class="form-control form-control-lg"
                        v-model="user.password"
                    />
                </div>

            
            </form>

            <input type="checkbox"
            :inProgress="inProgress"
            @click="clickAction">
            Jag har läst & accepterar forumetsregler & GDPR!
            <router-link style="color:black;"  class="nav-link link-light" to="/gdpr">Läs om alla villkor här.
            </router-link>
            <br>
            <br>

            <span v-if="inProgress">
            
              <div class="d-grid">
                    <input
                        type="submit"
                        @click="onSubmit"
                        class="btn btn-primary btn-lg btn-block"
                        value="Bli medlem"
                    />
                </div>
            </span>

        </div>
    </div>
</template>

<script>
import { register } from "../../assets/js/firebase";

export default {
    data() {
        return {
            user: {
                name: '',
                email: '',
                password: '',
            },
            inProgress: this.actionInProgress
        };
    },
    methods: {
    async onSubmit() {
    await register(this.user.email, this.user.name, this.user.password);
    this.$router.push('/dashboard')
    },

      clickAction () {
      this.updateActionInProgress(true)
      this.$emit('clicked')
    },
      updateActionInProgress (status) {
      this.inProgress = status
      this.$emit('update:actionInProgress', this.inProgress)
    }
    },
};
</script>
