<template>
  <div class="d-flex justify-content-center p-4 mb-3 bg-dark" style="text-align-last: right;">
    <div class="d-flex mx-auto" style="position:relative ; left: 3%;">
      <div>
        <router-link class="nav-link-white-blue pr-4" to="/">Hem |</router-link>|
      </div>
  
            <span v-if="isLoggedIn">
            
            <router-link class="nav-link-white-blue"  :to="`/profilesettings/${uid}`">Profil
            |
            </router-link>|
            
            <a class="nav-link-white-blue" @click.prevent="signOut">Logga ut</a>|
            
            </span>

    <span v-else>
      <div>
        <router-link class="nav-link-white-blue" to="/register-user">Bli medlem |</router-link>
|
        <router-link class="nav-link-white-blue" to="/signin">Logga in</router-link>|
      </div>
    </span>
  </div>
  
    <router-link class="nav-link-white-blue" to="/FAQ">FAQ |</router-link>|
    <router-link class="nav-link-white-blue" to="/GDPR">GDPR</router-link>
   
</div>
  
</template>

<!-- <style lang="scss" scoped>
</style> -->

<script>
import { auth, logOut } from "../../assets/js/firebase";
//import { ref } from 'vue' // used for conditional rendering

//import { useRouter } from 'vue-router'

export default {
    data(){
      return{
        uid: 0,
        isLoggedIn: false
      }
    },


    methods:{
      signOut(){
        //const router = useRouter()
        logOut()
        this.$router.push('/')
      },

      loggedIn(){
        auth.onAuthStateChanged(user => {
        if (user) {
          this.isLoggedIn = true // if we have a user
        } else {
          this.isLoggedIn = false // if we do not
        }
        console.log(this.isLoggedIn)
      })
      },

      getUid(){
        auth.onAuthStateChanged(user => {
            if(user){
              this.uid = user.uid
            }
        })
      }
    },

    
    created(){
      
        this.loggedIn()
        this.getUid();
        //console.log(this.isLoggedIn)
        
    },
}

// runs after firebase is initialized





</script>


<style>

.nav-link-white-blue {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  font-size: larger;
  text-decoration: none;
  color: white;

}

</style>