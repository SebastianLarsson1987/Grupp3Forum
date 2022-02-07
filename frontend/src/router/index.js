import { createRouter, createWebHistory } from 'vue-router'
import { auth } from '../assets/js/firebase'
import UserPosts from '../components/Profile/UserPosts.vue'
import Profilesettings from '../components/Profile/Profilesettings.vue'
import DashboardComponent from '../components/Navbar/DashboardComponent.vue'
import FAQ from '../components/Pages/FAQ.vue'
import RegisterComponent from '../components/Register/RegisterComponent.vue'
import GDPRComponent from '../components/Pages/GDPRComponent.vue'
import LoginComponent from '../components/Login/LoginComponent.vue'
import ForumComponent from '../components/Forum/ForumComponent.vue'
import Main from '../components/Homepage/Main.vue'
import Categorythreads from '../components/Forum/Categorythreads.vue'
import ThreadAndMessages from '../components/Forum/ThreadAndMessages.vue'
import WriteMessage from "../components/Forum/CreateThread/WriteMessage";
import UserThreads from '../components/Profile/UserThreads.vue'
import ForgetPassword from "../components/Login/ForgetPassword"
import SearchComponent from "../components/SearchResult/SearchComponent"

const routes = [

  {
    path: '/profilesettings/:id',
    name: 'Profilesettings',
    component: Profilesettings,
    meta: {
      authRequired: true,
    },
  },
  {
    path: '/userposts/:id',
    name: 'User-posts',
    component: UserPosts,
    meta: {
      authRequired: true,
    },
  },
  {
    path: '/userthreads/:id',
    name: 'User-threads',
    component: UserThreads,
    meta: {
      authRequired: true,
    },
  },

  {
    path: '/categorythreads/:id',
    name: 'Category-Threads',
    component: Categorythreads

  },
  {
    path: "/newthread",
    name: "NewThread",
    component: WriteMessage
  },
  {
    path: '/threadmessages/:id',
    name: 'Thread-messages',
    component: ThreadAndMessages,
    

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
    path: '/FAQ',
    name: 'FAQ',
    component: FAQ,
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
  },
  {
    path:"/searchResult",
    name: "searchResult",
    component: SearchComponent
  },
  {
    path: '/forgetpassword',
    name: 'forgetpassword',
    component: ForgetPassword
  }

]
const router = createRouter({
  history: createWebHistory(),
  routes,
})

router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.authRequired)) {
    auth.onAuthStateChanged(user => {
      if(user || auth.currentUser){
        next();
      } else{
        alert('You must be logged in to see this page');
        // next({
        //   path: '/',
        // });
      } 
    })
  }else{
    next();
  }
});

export default router
