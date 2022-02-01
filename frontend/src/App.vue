<template>
    <div>
      <Navbar/>
      
      

      
      <router-view></router-view>

    


    </div>
        
</template>
<script>
import {auth} from './assets/js/firebase'
import Navbar from './components/Navbar/Navbar.vue'
export default {
  data() {
    return {
      user: {},
    };
  },
  computed:{
    usera(){
      return this.$store.state.user
    }
  },
   created() {
    auth.onAuthStateChanged((user) => {
      if (user) {
        this.user = user;
        console.log(user)
      } else {
        this.user = '';
      }
    });
  },
  
  name: 'App',
  components: {

    Navbar
  }
}
</script>
