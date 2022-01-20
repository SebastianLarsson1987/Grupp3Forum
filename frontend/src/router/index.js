import { createRouter, createWebHistory } from 'vue-router'

import UserPosts from '../components/UserPosts.vue'
import Profilesettings from '../components/Profilesettings.vue'

const routes = [
  {
      path: '/profilesettings',
      name: 'Profilesettings',
      component: Profilesettings
  },
  {
    path: '/userposts/:id',
    name: 'User-posts',
    component: UserPosts
  }
]
const router = createRouter({
  history: createWebHistory(),
  routes,
})
export default router