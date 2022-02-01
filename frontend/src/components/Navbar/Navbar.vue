<template>
  <div class="d-flex justify-content-center p-4 mb-3 bg-dark" style="text-align-last: right;">
    <div class="d-flex mx-auto" style="position:relative ; left: 3%;">
      <div>
        <router-link class="nav-link-white-blue pr-4" to="/">Hem |</router-link>|
      </div>
    <div>
      <router-link class="nav-link-white-blue" to="/forum">Forum |</router-link>|
    </div>

            <span v-if="isLoggedIn">
            
            <router-link class="nav-link-white-blue"  :to="`/profilesettings/${uid}`">Profil
            |
            </router-link>|
            
            <a class="nav-link-white-blue" @click="signOut()">Logga ut</a>|
            
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

<script>
export default {

}
</script>

<!-- <style lang="scss" scoped>
</style> -->

<script setup>
import { auth, logOut } from "../../assets/js/firebase";
import { ref } from 'vue' // used for conditional rendering

import { useRouter } from 'vue-router'
const router = useRouter()
const isLoggedIn = ref(true)
// runs after firebase is initialized
auth.onAuthStateChanged(function (user) {
  if (user) {
    isLoggedIn.value = true // if we have a user
  } else {
    isLoggedIn.value = false // if we do not
  }
})
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