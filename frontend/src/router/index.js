import { createRouter, createWebHistory } from "vue-router";

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: "/",
      component: () => import("../views/Home.vue"),
    },

    {
      path: "/sign-in",
      component: () => import("../views/SignIn.vue"),
    },

    {
      path: "/register",
      component: () => import("../views/Register.vue"),
    },

    {
      path: "/forum",
      component: () => import("../views/Forum.vue"),
    },

  ],
});

export default router;