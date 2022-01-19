import { createRouter, createWebHistory } from 'vue-router'

import Profilesettings from '../components/Profilesettings.vue'

const routes = [
  {
      path: '/profilesettings',
      name: 'Profilesettings',
      component: Profilesettings
  },
]
const router = createRouter({
  history: createWebHistory(),
  routes,
})
export default router