<template>
  <nav class="bg-dark">
    <div class="container-fluid">
      <div class="row justify-content-md-center align-items-center">
        <div class="col col-lg-4"> </div>
          <div class="col-md-auto">
            <router-link class="nav-link-white-blue" to="/">Hem |</router-link>|
            <span v-if="isLoggedIn">
              <router-link class="nav-link-white-blue"  :to="`/profilesettings/${uid}`">Profil |</router-link>|
              <a class="nav-link-white-blue" @click="signOut()">Logga ut</a>|
            </span>
            <span v-else>
              <router-link class="nav-link-white-blue" to="/register-user">Bli medlem |</router-link>
              <router-link class="nav-link-white-blue" to="/signin"> Logga in</router-link>|
            </span>
          </div>
          <div class="d-flex col col-lg-4 m-3 p-2 align-items-center"> 
            <div class="justify-content-end">
              <form class="d-flex col col-lg-4" @submit.prevent="searchThreads()">
                <input type="search" id="searchForm" placeholder="Skriv en tråd här" v-model="searchString"/>
                <input type="submit" value="Sök" class="btn btn-primary">
              </form>
            </div>
            <div class="justify-content-end align-items-center m-3 p-2">
              <router-link class="nav-link-white-blue" to="/FAQ">FAQ |</router-link>|
              <router-link class="nav-link-white-blue" to="/GDPR">GDPR |</router-link>
            <span v-if="userFromBackend.roleId==2 && loggedIn">
              <router-link class="nav-link-white-blue" to="/admin"> Admin</router-link>
            </span>
            
            </div>
          </div>
        </div>
      </div>
  </nav>  
</template>

<!-- <style lang="scss" scoped>
</style> -->

<script>
import routers from "../../router/index";
import { auth, logOut } from "../../assets/js/firebase";
//import { ref } from 'vue' // used for conditional rendering

//import { useRouter } from 'vue-router'

export default {
    data(){
      return{
        uid: 0,
        isLoggedIn: false,
        searchString: ""
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
      },
      
      searchThreads(){
        this.$store.dispatch('getThreadsBySearch', this.searchString)
        routers.push("/searchResult")
      }
    },

    
    created(){
      
      this.userFromBackend
        this.loggedIn()
        this.getUid();
        auth.onAuthStateChanged(user=>{
            if(user){
              this.$store.dispatch('fetchUser', user.email)
            }
        })
        //console.log(this.isLoggedIn)
        
    },

    Update(){
      console.log("teststatat")
    },
    computed:{
      userFromBackend(){
        return this.$store.state.userFromBackend
      },
      
    },
    mounted(){
    }
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
span{ 
  cursor: pointer;
}
</style>