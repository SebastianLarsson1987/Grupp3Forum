import { createRouter, createWebHistory } from 'vue-router'
import Home from '/src/components/pages/Home.vue'
import Register from '/src/components/pages/Home.vue'
import Login from '/src/components/pages/Home.vue'

const routes = [
  {
      path: '/',
      name: 'Home',
      component: Home
  },
  {
    path: '/signup',
    name: 'Bli medlem',
    component: Register
  },
  {
    path: '/login',
    name: 'Logga in',
    component: Login
  },
]
const router = createRouter({
  history: createWebHistory(),
  routes,
})
export default router