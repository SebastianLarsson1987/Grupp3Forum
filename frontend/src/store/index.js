import { createStore } from "vuex" 

const store = createStore({
    state:{
         categories: [],
    },
    mutations:{
        setCategories(state, data){
            state.categories = data
        },
        // setCategoryNames(state, data){
        //     state.categoryNames = data
        // }
    },
    actions:{
        async fetchCategories({commit}){
            let response = await fetch("https://localhost:44362/api/Thread/GetAllCategories")
            let data = await response.json()
            this.state.categories=data
            console.log(this.state.categories)
            commit('setCategories', data)
        }
    }
  })

export default store