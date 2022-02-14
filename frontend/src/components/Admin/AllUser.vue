<template>
  <div>
    <h2>Alla aktiva användare</h2>

    <input type="text" v-model="search" v-on:keyup="filterUser(search)" placeholder="Sök användare">
   
    <div class="main">
      <div class="left-bar" v-for="item in allUsers" :key="item.id">
        <div class="left-bar-item">
          <p @click="fetchThreadsByUser(item.uid)" v-if="item.userName!=='Borttagen' && item.userName!=='deleted'" class="user-links">{{item.userName}}</p>
          <!-- <button v-if="item.userName!=='Borttagen'" class="delete-button" @click="deleteUser(item.uid)">Ta bort användare</button> -->
          <button v-if="item.userName!=='Borttagen' && item.userName!=='deleted'" class="delete-button" @click="deleteUser(item.uid)" >Ta bort användare</button>

        </div>
      </div>
      <div class="right-bar">
        <CreatedThreadsByUser/>
      </div>
    </div>
      
  </div>
</template>

<script>
import CreatedThreadsByUser from './CreatedThreadsByUser.vue'
  export default {
    data(){
      return{
        search:""
      }
    },
    components: {
      CreatedThreadsByUser
    },
    async created(){
      await this.loadUsers()
    },
    methods:{
      async loadUsers(){
        await this.$store.dispatch("fetchAllUsers")
      },
      fetchThreadsByUser(id){
        this.$store.dispatch("fetchThreadsByUser", id)
        
      },
      async deleteUser(uid){
        await fetch(`https://localhost:44362/api/User/DeleteUser?uid=${uid}`,{
          method: "DELETE",
            headers: {
                'Accept': 'application/json',
                'Content-Type': "application/json"
            }
        }
        )},
      filterUser(search){
        console.log(search)
        this.allUsers.filter(x=>x.userName.includes(search.toLowerCase))
      }
    },
    computed:{
      allUsers(){
        return this.$store.state.allUsers.filter(x=>x.userName.toLowerCase().includes(this.search.toLowerCase()))
      }
    }
  }
</script>

<style>

.main{
  position: relative;
  width:100%;
 
}

.left-bar{
  width:50%;
  display:flex;
  flex-direction:column;
  
}
.right-bar{
  position:absolute;
  top:0;
  right:20%;
  width:50%;
  
}
.user-links{
  cursor:pointer;
  width:20%;
  
}
.delete-button{
  width:20%;
}
.left-bar-item{
  display:flex;
  flex-direction:row;
}

</style>