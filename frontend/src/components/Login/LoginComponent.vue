<template>
  <div class="row d-flex justify-content-center">
    <div class="col-md-8 mt-5">
      <h5 class="card-header">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="20"
          height="20"
          fill="currentColor"
          class="bi bi-person-check-fill"
          viewBox="0 0 16 16"
        >
          <path
            fill-rule="evenodd"
            d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"
          />
          <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
        </svg>
        Logga in
      </h5>
      <br />
      <form @submit.prevent="onSubmit">
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
          <input type="password" class="form-control form-control-lg" v-model="user.password" />
        </div>

        <div class="d-grid">
          <input type="submit" class="btn btn-primary btn-lg btn-block" value="Logga in" />
        </div>
        
      </form>
      <div class="d-grid">
        <router-link to="/forgetpassword">Glömt Lösenord?</router-link>
      </div>
    </div>
  </div>
</template>

<script>
import { logIn, resetPassword } from "../../assets/js/firebase";
import axios from 'axios'
import {auth} from "../../assets/js/firebase"
export default {
  data() {
    return {
      user: {
        email: '',
        password: ''
      }
    };
  },
  methods: {
    async onSubmit() {
      axios
      .get(`https://localhost:44362/api/User/GetUserStatus?email=${this.user.email}`)
      .then(response => {
        console.log(response)
        if(response.data[0] === false){
          console.log(response.data)
          logIn(this.user.email, this.user.password);
          
          this.$router.push("/");
          
        } 
        else{
          alert("Ditt konto är avstängt");
          this.$router.push('/')
        }
        
      })
      this.getUser()
    },
    getUser(){
      auth.onAuthStateChanged(user => {
          if(user){
            this.$store.dispatch('fetchUser', user.email)
          }else{
            this.$router.push('/')
          }
        })
    },
    async forgetPassword(){
    await resetPassword(this.user.email)
    }
  },
  
  
};
</script>