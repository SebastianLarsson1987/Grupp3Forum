<template>
  <div>
    <h1>Glömt lösenord?</h1>
    <form @click.prevent="forgetPassword()">
      <p>Skriv in din email så får du en länk på mailen där du kan skriva in nytt lösenord</p>
      <input type="email" placeholder="email" v-model="user.email"> 
      <input type="submit">
    </form>
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

<style lang="scss" scoped>

</style>