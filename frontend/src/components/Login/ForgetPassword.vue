<template>
  <div class="d-flex flex-column">
    <h1 class="d-flex justify-content-center">Glömt lösenord?</h1>
    <div class="d-flex justify-content-center">
      <form @click.prevent="forgetPassword()">
        <p>Skriv in din email så får du en länk på mailen där du kan skriva in nytt lösenord</p>
        <div class="d-flex justify-content-center">
          <input type="email" placeholder="email" v-model="user.email"> 
          <input type="submit">
        </div>
      </form>
    </div>
  </div>
</template>

<script>
  import { resetPassword } from "../../assets/js/firebase";


  export default {
    data(){
      return{
        user:{
          email:""
        }
      }
    },
    methods:{
      async forgetPassword(){
        
        await resetPassword(this.user.email)
      }
    }
  }
</script>

<style>

</style>