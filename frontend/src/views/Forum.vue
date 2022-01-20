<template>
  <h1>Forum</h1>
</template>

<script setup>
import { auth } from 'firebase/auth'
import { useRouter } from 'vue-router'
import { onBeforeUnmount } from 'vue'
const router = useRouter()
const authListener = auth().onAuthStateChanged(function (user) {
  if (!user) { // not logged in
    alert('you must be logged in to view this. redirecting to the home page')
    router.push('/')
  }
})
onBeforeUnmount(() => {
  // clear up listener
  authListener()
})
</script>