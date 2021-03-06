import { createStore } from "vuex";
import axios from 'axios';
import { remove } from "../assets/js/firebase";


const store = createStore({
    state: {
        name: "Vue",
        userPosts: [],
        localPosts: [],
        user: [],
        userFromBackend:{},
        text: "",
        allUsers:[],
       
       categories: [],
       AllCategoriesAndThreads: [],
       oneCategoryAndThreads: [],
       oneThreadAndMessages: [],
       messages: [],
       newThreads: [],
       threadsBySearch:[],
       threadsFromBackend:[],
       
       threadsByUser:[],
       userThreads: [],
       messageUser: [],
       reportedMessagesStatusInThread: [],
       bannedUser: false,
       roleId: [],
  },

  getters: {
      getMessages: state => {
          return state.messages
      },
      
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
      },
      setOneThreadAndMessages(state,data){
          state.oneThreadAndMessages = data
      },
      setSearchResult(state, data){
        state.threadsBySearch = data
      },
      setMessagesReportedStatus(state){
        if(state.reportedMessagesStatusInThread[1]){
            return true;
        }
        else{
            return false;
        }
      }, 
      setUser(state, data){
          state.userFromBackend=data
          
      },
      setThreads(state, data){
          state.threadsFromBackend=data 
      },
      setAllUsers(state, data){
          state.allUsers = data
      },
      setThreadsByUser(state, data){
          state.threadsByUser = data
      },
      singleRole(state, data){
          state.singleRole =data
      }
      
    },
       actions:{
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

       putDeleteMessage(_, id){
        axios
        .put(`https://localhost:44362/api/Message/SetMessageAsDeleted?id=${id}`, {

        })
        .then(response => {
            console.log(response)
        })
        .catch(error => {
            console.log(error)
        })
       },

       putMessageAsNotReported(_, id){
        axios
        .put(`https://localhost:44362/api/Message/SetMessageToNotReported?id=${id}`, {

        })
        .then(response => {
            console.log(response)
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
           .get(`https://localhost:44362/api/User/GetUser?id=${id}`)
           .then(result => {
               this.state.user = result.data
               console.log(this.state.user)
               result.data.map(item => {
                  this.state.roleId = item.roleId
                })
                console.log("Roleid", this.state.roleId)
            })
            .catch(error => {
                if(error){
                    window.location.reload();
                }
               console.log(error)
           })

       },

       banUser(_,id){
           axios
           .put(`https://localhost:44362/api/User/SetUserAsBanned?id=${id}`, {

           })
           .then(result => {
               console.log(result)
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

      async getCategoryThreadsPerCategoryId(_, id){
           axios
           .get(`https://localhost:44362/api/Thread/GetCategoryPerId?id=${id}`)
           .then(response => {
               this.state.oneCategoryAndThreads = response.data;
               this.state.oneCategoryAndThreads.forEach((item) => {
                   this.state.newThreads = [...item.newThreads]
                   this.state.newThreads.sort(function(a,b){
                       return new Date(b.updatedAt) - new Date(a.updatedAt)
                   })
               })
               console.log(this.state.newThreads)
               console.log(this.state.oneCategoryAndThreads)
           })
           .catch(error => {
               console.log(error)
           })
       },

       getThreadAndMessagesById(_,id){
           axios
           .get(`https://localhost:44362/api/Thread/GetMessagesAndThreadById?id=${id}`)
           .then(response => {
                this.state.oneThreadAndMessages = response.data
                this.state.oneThreadAndMessages.forEach((item) => {
                    
                    this.state.messages = [...item.messages]
                    this.state.messages.sort(function(a,b){
                        return new Date(a.updatedAt) - new Date(b.updatedAt)
                    })
                    item.messages.forEach(item => {
                        this.state.messageUser = item.userU
                    })
                    
                })
                this.state.bannedUser = this.state.messageUser.banned
                console.log(this.state.bannedUser)
                console.log(this.state.messageUser)
                console.log(this.state.messages)
                console.log(this.state.oneThreadAndMessages)
           })
           .catch(error => {
               console.log(error)
           })
        },

        async deleteMessage(_, id) {
            axios
                .delete(`https://localhost:44362/api/Message?id=${id}`)
                .then(response => {
                    console.log(response)
                })
                .catch(error => {
                    console.log(error)
                })
        },

        async postMessageInThread(_, { mtext, threadId, userId }) {
            await fetch(`https://localhost:44362/api/Thread/WriteMessage?text=${mtext}&threadId=${threadId}&userId=${userId}`, {
                method: "POST",
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': "application/json"
                },
                body: JSON.stringify({ mthreadId: threadId, text: mtext, mUserId: userId })
            })
        },

        async deleteUser() {
            try {
                await remove();
            } catch (err) {
                console.error(err);
            }

        },

        async getThreadByUserId(_, id) {
            axios
            .get(`https://localhost:44362/api/Thread/GetThreadsByUserId?id=${id}`)
            .then(response => {
                 this.state.userThreads = response.data
                 this.state.reportedMessagesStatusInThread = this.state.userThreads.map(x => {
                        return x.messages.map(msg => {
                         return msg.isReported
                     })
                 })
                
                    console.log(this.state.reportedMessagesStatusInThread)
                    console.log(this.state.userThreads)
                })
                .catch(error => {
                    console.log(error)
                })
        },


        async fetchCategories({ commit }) {
            let response = await fetch("https://localhost:44362/api/Thread/GetAllCategories")
            let data = await response.json()
            console.log(data)
            commit('setCategories', data)
        },
        async fetchCategoriesAndThreads({ commit }) {
            let response = await fetch("https://localhost:44362/api/Thread/GetAllCategoriesAndThreads")
            let data = await response.json()
            console.log(data)
            commit('setAllCategoriesAndThreads', data)
        },
        async getThreadsBySearch({commit}, searchString){
            console.log(searchString)
             let response = await fetch(`https://localhost:44362/api/Thread/GetThreadsBySearch?input=${searchString}`)
             let data = await response.json()
             console.log(data)
             commit('setSearchResult', data)
      
        },
        async fetchUser({commit},email){
            console.log('test funkar det')
            let response = await fetch('https://localhost:44362/api/User/GetUserByEmail?email='+email)
            let data = await response.json();
            console.log(data)
            
            commit('setUser', data)
            
        },
        
        async fetchThreads({commit}){
            
            let response = await fetch('https://localhost:44362/api/Thread/GetAllThreads')
            let data = await response.json();
            console.log(data)
            commit('setThreads', data)
        },
        async fetchAllUsers({commit}){
            let response = await fetch("https://localhost:44362/api/User/GetAll")
            let data = await response.json();
            commit('setAllUsers', data)
        },
        async fetchThreadsByUser({commit}, uid){
            let response = await fetch(`https://localhost:44362/api/Thread/GetThreadsByUserId?id=${uid}`)
            let data = await response.json();
            commit("setThreadsByUser", data)

        },
        async adminDeleteUser(_, uid){
            console.log(uid)
            await fetch(`https://localhost:44362/api/User/DeleteUser?uid=` +uid, {
                Method: "POST",
                Headers: {
                    'Accept': 'application/json',
                    'Content-Type': "application/json"
                },
                body: JSON.stringify({uid:uid})
            })
            // remove()

        }
    }
})

export default store
