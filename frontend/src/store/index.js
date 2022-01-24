import { createStore } from "vuex" 
import axios from 'axios'


const store = createStore({
  state:{
       name: "Vue",
       userPosts: [],
       localPosts: [],
       user: [],
        text: "",
       
       categories: [],
       AllCategoriesAndThreads: []
  },
  mutations:{
      setName(state, x){
          state.name = x
      },
      setCategories(state, data){
          state.categories = data
      },
      setAllCategoriesAndThreads(state, data){
        state.AllCategoriesAndThreads = data
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
                this.state.localPosts = this.state.userPosts.map(e=> {
                    return {...e, isDisabled: true}
                })
                console.log(this.state.userPosts)
                console.log(this.state.localPosts)
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
       },

       getOneUser(_,id){
           axios
           .get(`https://localhost:44362/api/User/GetOneUser?id=`+ id, {

           })
           .then(result => {
               this.state.user.push(result.data)
               console.log(this.state.user)
           })
           .catch(error => {
               console.log(error)
           })

       },

       editUser(_, {id, email, userName}){
           
           axios
           .put(`https://localhost:44362/api/User/EditUser/`+id +'?' +'email='+email + '&UserName='+userName, {
               
           })
           .then(response =>{
               console.log(response)
           })
           .catch(error => {
               console.log(error)
           })
       },

       
      async fetchCategories({commit}){
          let response = await fetch("https://localhost:44362/api/Thread/GetAllCategories")
          let data = await response.json()
          console.log(data)
          commit('setCategories', data)
    },
      async fetchCategoriesAndThreads({commit}){
        let response = await fetch("https://localhost:44362/api/Thread/GetAllCategoriesAndThreads")
        let data = await response.json()
        console.log(data)
        commit('setAllCategoriesAndThreads', data)
      }
    
    
  }
})

export default store
