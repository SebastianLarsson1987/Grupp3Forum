<template>
  <nav class="bg-dark">
    <div class="container-fluid">
      <div class="row justify-content-md-center align-items-center">
        <div class="col col-lg-4"> </div>
          <div class="col-md-auto">
            <router-link class="nav-link-white-blue" to="/">Hem |</router-link>|
            <router-link class="nav-link-white-blue" to="/forum">Forum |</router-link>|
            <span v-if="isLoggedIn">
              <router-link class="nav-link-white-blue"  :to="`/profilesettings/${uid}`">Profil |</router-link>|
              <a class="nav-link-white-blue" @click="signOut()">Logga ut</a>|
            </span>
            <span v-else>
              <router-link class="nav-link-white-blue" to="/register-user">Bli medlem |</router-link>
              <router-link class="nav-link-white-blue" to="/signin">Logga in</router-link>|
            </span>
          </div>
          <div class="col col-lg-4"> 
            <div class="d-flex flex-row">
              <div class="">
                <form @submit.prevent="searchThreads()">
                  <input type="search" id="searchForm" class="form-control" v-model="searchString"/>
                  <input type="submit" value="Sök" class="btn btn-primary">
                </form>
              </div>
              <div style="margin-left:15%">
                <router-link class="nav-link-white-blue" to="/FAQ">FAQ |</router-link>|
                <router-link class="nav-link-white-blue" to="/GDPR">GDPR</router-link>
              </div>
            </div>
          </div>
        </div>
      </div>
  </nav>  
</template>

<script>
import routers from "../../router/index"
  export default {
    data(){
      return{ 
        show:false,
        searchString: ""
      }
    },
    methods:{
      searchThreads(){
        this.$store.dispatch('getThreadsBySearch', this.searchString)
        routers.push("/searchResult")
      }
    }
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
  /* .searchBar{
    width:18%;
    height:15%;
    background-color: white;
    position: absolute;
    right:230px;
    top:50px;
  }
  .searchText{
    position:relative;
  } */
</style>