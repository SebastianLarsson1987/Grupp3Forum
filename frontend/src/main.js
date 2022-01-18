import { createApp } from 'vue'
import App from './App.vue'
import store from "./store/index"
import router from "./router/index"

createApp(App).user(store).use(router).mount('#app')
