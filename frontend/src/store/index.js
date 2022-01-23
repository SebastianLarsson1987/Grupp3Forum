import { createStore } from "vuex" 
import axios from 'axios'


const store = createStore({
  state:{
       name: "Vue",
       userPosts: [],
       localPosts: [],
       user: [],
        text: "",
       
  },
  mutations:{
      setName(state, x){
          state.name = x
      },

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
       }

       
  }
})

export default store