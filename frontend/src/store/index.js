import { createStore } from "vuex" 
import axios from 'axios'

const store = createStore({
  state:{
       name: "Vue",
       userPosts: [],
      
       
  },
  mutations:{
      setName(state, x){
          state.name = x
      }
  },
  actions:{
       async ({commit}){
           let name = 'Vue with vuex'
           commit('setName', name)
       },

       getUserPosts(_,id){
            axios
            .get(`https://localhost:44362/api/Message/GetUserMessages/` + id , {
                
            })
            .then(result => {
                this.state.userPosts = result.data;
                console.log(this.state.userPosts)
            })
            .catch(error => {
                console.log(error)
            })
       }
  }
})

export default store