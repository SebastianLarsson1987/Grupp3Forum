<template>
    <ProfileEditVue></ProfileEditVue>
</template>

<script>
import { defineComponent } from "vue"
import ProfileEditVue from "../components/ProfileEdit.vue";
export default defineComponent({
    name: "Profile",
    components: {
        ProfileEditVue
    },

});
</script>

<style>
</style>