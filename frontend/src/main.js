import Vue from 'vue';
import App from './App.vue';
import 'bootstrap/dist/css/bootstrap.min.css';
import VueRouter from 'vue-router';
Vue.use(VueRouter)


// Routers
const router = new VueRouter({
  mode: 'history',
  base: __dirname,
  routes: [

    { 
      path: '/',
      component: () => import('./components/HomeComponent.vue')
    },  

    { 
      path: '/register-user',
      name: 'register-user',
      component: () => import('./components/RegisterComponent.vue')
    },    
    { 
      path: '/signin',
      name: 'signin',
      component: () => import('./components/LoginComponent.vue')
    },
    { 
      path: '/forum',
      name: 'forum',
      component: () => import('./components/ForumComponent.vue'),
      meta: {
        authRequired: true,
      },
    },
    { 
      path: '/dashboard',
      name: 'dashboard',
      component: () => import('./components/DashboardComponent.vue'),
      meta: {
        authRequired: true,
      },
    }
  ]
});

router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.authRequired)) {
      if (firebase.auth().currentUser) {
          next();
      } else {
          alert('You must be logged in to see this page');
          next({
              path: '/',
          });
      }
  } else {
      next();
  }
});

export default router;



// Database connection
import firebase from 'firebase/app';

const firebaseConfig = {
    apiKey: "AIzaSyBWnqs4fGVQ7b1h_3cIbmvq6jdCEAspW9E",
    authDomain: "grupp3forum.firebaseapp.com",
    projectId: "grupp3forum",
    storageBucket: "grupp3forum.appspot.com",
    messagingSenderId: "544976868582",
    appId: "1:544976868582:web:c2742c1d0a63e0af0c9727"
}
firebase.initializeApp(firebaseConfig);



new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
