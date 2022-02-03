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
            
            <router-link class="nav-link-white-blue"  :to="`/profilesettings/${uid}`">Profil
            |
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
            <p class="nav-link-white-blue searchText" v-on:click="show = !show">| Sök</p>
            <div class="searchBar" v-if="show">
              <form @submit.prevent="searchThreads()">
                <p>Sök efter en tråd</p>
                <input type="text" v-model="searchString">
                <input type="submit" value="Sök">
              </form>
            </div>
  </div>
</template>

<script>
import router from "../../router/index"
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
        router.push("/searchResult")
      }
    }
  }
</script>

<style lang="scss" scoped>

</style>

<script setup>
  import { auth, logOut} from "../../assets/js/firebase";
  import { ref} from 'vue' // used for conditional rendering
  import { useRouter } from 'vue-router'
  const router = useRouter()
  const isLoggedIn = ref(true)
  // runs after firebase is initialized
  auth.onAuthStateChanged(function(user) {
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
  .searchBar{
    width:18%;
    height:15%;
    background-color: white;
    position: absolute;
    right:230px;
    top:50px;
  }
  .searchText{
    position:relative;
  }
</style>