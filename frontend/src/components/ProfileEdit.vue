<template>
    <div>
        <input type="text" v-model="this.user.email" placeholder="{{this.user.email}}" />
        <input type="text" v-model="this.user.email" placeholder="{{this.user.userName}}" />
    </div>
</template>

<script>
import { defineComponent } from 'vue'
import { auth } from '../assets/js/firebase';
import store from '../store';
export default defineComponent({
    name: "ProfileEdit",
    data() {
        return {
            user: {},
        }
    },
    async created() {
        auth.currentUser.g
        await this.fetchUserById(auth.currentUser.uid);
    },
    methods: {
        async fetchUserByEmail(email) {
            store.dispatch("getUser", email)
            this.user = store.state.user;
        },
        async fetchUserById(id) {
            store.dispatch("getUserById", id);
            this.user = store.state.user;
        }
    }
});
</script>

<style>
</style>