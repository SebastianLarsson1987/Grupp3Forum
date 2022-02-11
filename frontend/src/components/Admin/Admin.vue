
<template>
  <div class="main-content-section">
    <AdminNavbar/>
    <router-view></router-view>
    
  </div>
</template>

<script>
import AdminNavbar from './AdminNavbar.vue'
  export default {
    data(){

    },
    components: {
      AdminNavbar,
    }
    
    
  }
</script>

<style>
.main-content-section{
  margin-left: 1em;
}
</style>