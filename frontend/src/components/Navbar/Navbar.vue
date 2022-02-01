<template>
  <div class="d-flex justify-content-center p-4 mb-3 bg-dark">

            <div>
            <router-link class="nav-link-white-blue"  to="/">
            Hem |
            </router-link>|
            </div>

            <div>
            <router-link class="nav-link-white-blue"  to="/forum">
            Forum |
            </router-link>|
            </div>
    
            <span v-if="isLoggedIn">
            
            <router-link class="nav-link-white-blue"  to="/dashboard">
            Profilsida |
            </router-link>|
            
            <a class="nav-link-white-blue" @click="signOut()">Logga ut</a>|
            
            </span>

            <span v-else>
            <div>
            <router-link class="nav-link-white-blue" to="/register-user"> 
            Bli medlem | </router-link>|
             
            <router-link class="nav-link-white-blue"  to="/signin"> 
            Logga in </router-link>|
            </div>
            </span> 
            {{user.email}}
  </div>
</template>

<script>
  export default {
    computed:{
      user(){
        return this.$store.state.user
      }
    },
    
  }
</script>

<style lang="scss" scoped>

</style>

<script setup>
  import { auth, logOut} from "../../assets/js/firebase";
  import { useRouter } from 'vue-router'

  
  const router = useRouter()
 
  // runs after firebase is initialized
  
  const signOut = () => {
    logOut()
    router.push('/')
  }
</script>


<style>
  .nav-link-white-blue {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    font-size: larger;
    text-decoration: none;
    color: white;
    
  }
</style>