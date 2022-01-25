// import Vue from 'vue';
import App from './App.vue';
import 'bootstrap/dist/css/bootstrap.min.css';
import store from "./store/index"
import router from "./router/index"
import { createApp } from 'vue'







// new Vue({
//   router,
//   render: h => h(App)
// }).$mount('#app')







//Database connection
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





createApp(App).use(store).use(router).mount('#app')