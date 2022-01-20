import { createStore } from "vuex" 

const store = createStore({
  state:{
       categories: []
  },
  mutations:{
      setCategories(state, data){
          state.categories = data
      }
  },
  actions:{
      async fetchCategories({commit}){
          let response = await fetch("https://localhost:44362/api/Thread/GetAllCategories")
          let data = await response.json()
          console.log(data)
          commit('setCategories', data)
    },
    
    
  }
})

export default store
