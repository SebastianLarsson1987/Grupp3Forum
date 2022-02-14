<template>
    <div>
      <Navbar/>
      

      
      <router-view></router-view>

    


    </div>
        
</template>
<script>

import Navbar from './components/Navbar/Navbar.vue'
export default {
  data(){
    return{
      role: ""
    }
  },
  
  computed: {
     userFromBackend(){
        return this.$store.state.userFromBackend
      }
  },
  

  name: 'App',
  components: {

    Navbar
  }
}
</script>
