<template>
    <div>
        <div class="d-flex justify-content-center p-4 mb-3 bg-dark">
            <div>
                <router-link class="nav-link link-light" to="/signin">
                    Login
                </router-link>
            </div>
            <div>
                <router-link class="nav-link link-light" to="/register-user">
                    Register
                </router-link>
            </div>
               <div>
                <router-link class="nav-link link-light" to="/dashboard">
                    Dashboard
                </router-link>
            </div>
               <div>
                <router-link class="nav-link link-light" to="/">
                    Home
                </router-link>
            </div>
        </div>

        <div class="container">
            <router-view></router-view>
        </div>
    </div>
</template>
