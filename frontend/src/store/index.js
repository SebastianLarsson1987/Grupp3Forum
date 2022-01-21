import { createStore } from "vuex"

const store = createStore({
    state: {
        name: "Vue",
        user: {},
    },
    mutations: {
        setName(state, x) {
            state.name = x
        },
        setUser(state, obj) {
            state.user = obj.user;
        }
    },
    actions: {
        async({ commit }) {
            let name = 'Vue with vuex'
            commit('setName', name)
        },
        async getUser({ commit }, email) {
            let url = new URL("/api/user/get")
            let param = new URLSearchParams(`email=${email}`);
            url.searchParams = param;
            const user = fetch(url);
            commit("setUser", user);
        }
    }
})

export default store