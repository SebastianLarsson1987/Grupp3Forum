import { createStore } from "vuex" 
import axios from 'axios'


const store = createStore({
  state:{
       name: "Vue",
       userPosts: {},
        text: ""
       
  },
  mutations:{
      setName(state, x){
          state.name = x
      },

      ADD_POSTS(state, post){
          state.userPosts.push(post)
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
       },

       putMessageText(_, {id, text}){
        axios
        .put(`https://localhost:44362/api/Message/EditUserMessage/${id +'?message='+ text}`, {
            
        })
        .then(response => {
            console.log(response)
        })
        .catch(error => {
            console.log(error)
        })
       }

       
  }
})

export default store