import { createRouter, createWebHistory } from 'vue-router'
import firebase from 'firebase'

import UserPosts from '../components/Profile/UserPosts.vue'
import Profilesettings from '../components/Profile/Profilesettings.vue'
import DashboardComponent from '../components/Navbar/DashboardComponent.vue'
import RegisterComponent from '../components/Register/RegisterComponent.vue'
import GDPRComponent from '../components/Pages/GDPRComponent.vue'
import LoginComponent from '../components/Login/LoginComponent.vue'
import ForumComponent from '../components/Forum/ForumComponent.vue'
import Main from '../components/Homepage/Main.vue'

const routes = [
  
  {
      path: '/profilesettings/:id',
      name: 'Profilesettings',
      component: Profilesettings
  },
  {
    path: '/userposts/:id',
    name: 'User-posts',
    component: UserPosts
  },
  { 
    path: '/',
    name: 'Main',
    component: Main
  },  

  { 
    path: '/register-user',
    name: 'register-user',
    component: RegisterComponent
  },    

  { 
    path: '/gdpr',
    name: 'gdpr',
    component: GDPRComponent
  }, 

  { 
    path: '/signin',
    name: 'signin',
    component: LoginComponent
  },

  { 
    path: '/forum',
    name: 'forum',
    component: ForumComponent,
    meta: {
      authRequired: true,
    },
  },

  { 
    path: '/dashboard',
    name: 'dashboard',
    component: DashboardComponent,
    meta: {
      authRequired: true,
    },
  }
]
const router = createRouter({
  history: createWebHistory(),
  routes,
})

router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.authRequired)) {
      if (firebase.auth().currentUser) {
          next();
      } else {
          alert('Logga in för att se den här sidan!');
          next({
              path: '/',
          });
      }
  } else {
      next();
  }
});

export default router

