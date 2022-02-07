// import Vue from 'vue';
import App from './App.vue';
import 'bootstrap/dist/css/bootstrap.min.css';
import store from "./store/index"
import router from "./router/index"
import { createApp } from 'vue'


createApp(App).use(store).use(router).mount('#app')