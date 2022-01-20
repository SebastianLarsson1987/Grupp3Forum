<template>
  <div>
    <h1>Register</h1>
    <div>
      <input type="text" v-model="this.user.email" placeholder="Email..." />
      <input type="text" v-model="this.user.userName" placeholder="User name..." />
      <input type="password" v-model="this.user.password" placeholder="Password..." />
      <input type="password" v-model="this.user.verifyPassword" placeholder="Re-enter password..." />
      <button @click="this.registerUser()">Register</button>
    </div>
    <div>
      <h1>Reset Password?</h1>
      <input type="text" v-model="this.passwordReset" placeholder="Email..." />
      <button @click="reset()">Reset</button>
    </div>
  </div>
</template>

<script>
import { defineComponent } from "vue"
import { register, resetPassword } from "../assets/js/firebase";
export default defineComponent({
  name: "Register",
  data() {
    return {
      user: {
        "email": "",
        "userName": "",
        "password": "",
        "verifyPassword": ""
      },
      passwordReset: ""
    }
  },
  methods: {
    registerUser() {
      register(this.user.email, this.user.userName, this.user.password);
    },
    reset() {
      resetPassword(this.passwordReset);
    }
  }
});
</script>
<style>
</style>