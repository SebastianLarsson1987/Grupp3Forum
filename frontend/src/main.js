// import Vue from 'vue';
import App from './App.vue';
import 'bootstrap/dist/css/bootstrap.min.css';
import store from "./store/index"
import router from "./router/index"
import { createApp } from 'vue'
window.$ = window.jQuery = require('jquery');

createApp(App).use(store).use(router).mount('#app')