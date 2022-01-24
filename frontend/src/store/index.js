import { createStore } from "vuex" 

const store = createStore({
  state:{
       categories: [],
       AllCategoriesAndThreads: []
  },
  mutations:{
      setCategories(state, data){
          state.categories = data
      },
      setAllCategoriesAndThreads(state, data){
        state.AllCategoriesAndThreads = data
      }
  },
  actions:{
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
