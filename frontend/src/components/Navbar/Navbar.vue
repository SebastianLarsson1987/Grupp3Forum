<template>
  <div class="d-flex justify-content-center p-4 mb-3 bg-dark">

            <div>
                <router-link class="nav-link link-light" to="/">
                    Home
                </router-link>
            </div>

              <div>
                <router-link class="nav-link link-light" to="/forum">
                    Forum
                </router-link>
            </div>
    
            <div>
                <router-link class="nav-link link-light" to="/register-user">
                    Register
                </router-link>
            </div>

              <div>
                <router-link class="nav-link link-light" to="/signin">
                    Login
                </router-link>
            </div>

              <div>
                <router-link class="nav-link link-light" to="/dashboard">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                     </svg>
                </router-link>
              </div>

              <div>
                <router-link class="nav-link link-light" :to="`/profilesettings/${authId}`">
                    Profil
                </router-link>
              </div>
   </div>
</template>

<script>
import { auth } from "../../assets/js/firebase";

  export default {
      data(){
        return{
          authId: auth.currentUser.uid
        }
      }
  }
</script>

<style lang="scss" scoped>

</style>