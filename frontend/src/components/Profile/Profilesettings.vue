<template>
    <div class="form">
        <form class="userprofile-form">
            <div class="userprofile-form-grid1">
                <img src="../../assets/emptyavatar2.png" alt />
            </div>
            <div class="userprofile-form-grid2">
                <div class="userprofile-form-grid2-buttons">
                    <button
                        type="button"
                        class="btn btn-primary btn-lg btn-block"
                        @click="edit"
                    >Redigera Profil</button>
                    <button
                        type="button"
                        class="btn btn-primary btn-lg btn-block"
                        @click="removeUser"
                    >Ta bort Profil</button>
                </div>
                <div class="userprofile-form-grid2-button-amountOfPosts"></div>
            </div>
            <div class="userprofile-form-grid3">
                <h2>Innehåll</h2>
                <nav class="userprofile-form-grid3-contentNavbar">
                    <div>
                        <router-link :to="`/userposts/${$route.params.id}`">Inlägg</router-link>
                    </div>
                    <div>
                        <router-link :to="`/userthreads/${$route.params.id}`">Grupper</router-link>
                    </div>
                    <div>
                        <router-link
                            :to="`/profilesettings/${$route.params.id}`"
                        >Profilinställningar</router-link>
                    </div>
                </nav>
            </div>
            <div class="userprofile-form-grid4" v-for="item in user" :key="item">
                <div>
                    <div class="userprofile-form-grid4-username">
                        <p>Användarnamn</p>
                        <input
                            type="text"
                            placeholder="Användarnamn"
                            v-bind:disabled="isReadOnly"
                            v-model="item.userName"
                        />
                    </div>
                    <div class="userprofile-form-grid4-email">
                        <p>Email</p>
                        <input
                            type="text"
                            placeholder="Email"
                            v-bind:disabled="isReadOnly"
                            v-model="item.email"
                        />
                    </div>
                    <!-- <div class="userprofile-form-grid4-password">
                        <p>Lösenord</p>
                        <input type="password" placeholder="Lösenord" v-bind:disabled="isReadOnly">
                    </div>
                    <div class="userprofile-form-grid4-verify">
                        <p>Bekräfta lösenord*</p>
                        <input type="password" placeholder="Bekräfta lösenord" v-bind:disabled="isReadOnly">
                    </div>-->
                    <div class="userprofile-form-grid2-buttons">
                        <button
                            class="btn btn-primary btn-lg btn-block"
                            @click="putUser($route.params.id, item.email, item.userName)"
                        >Spara</button>

                        <button class="btn btn-primary btn-lg btn-block" @click="cancel">Avbryt</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</template>

<script>

import { auth, updateUser, editEmail, logOut, remove } from "../../assets/js/firebase";
//import { useRouter } from 'vue-router'

export default {
    components: {

    },
    data() {
        return {
            isReadOnly: true,
            showPosts: false,
            editProfile: false,
            authId: 0,
            authUser: null
        }
    },
    computed: {
        user() {
            return this.$store.state.user;
        },

        uid() {
            let user = auth.currentUser;
            if (user.uid == null) {
                auth.onAuthStateChanged(user => {
                    this.$route.params.id = user.uid
                })
            }

            console.log(user.uid)
            return user.uid

        }
    },
    methods: {
        edit() {
            this.isReadOnly = false
        },

        cancel() {
            this.isReadOnly = true;
        },

        getUser() {
            return this.$store.dispatch('getOneUser', this.$route.params.id)
        },

        putUser(id, email, userName) {
            this.isReadOnly = true
            updateUser({
                displayName: userName
            })
            editEmail(email)
            this.$store.dispatch('editUser', { id, email, userName });
            alert("Du skickas nu till inloggningssidan för att logga in igen för att ändringarna ska ha effekt");
            logOut();
            this.$router.push("/signin")
        },

        async removeUser() {
            if (confirm("Är du säker på att du vill ta bort ditt konto? Det går inte att återställa sitt konto efter detta steg.")) {
                console.log("userid, removeUser", this.uid)
                await remove();
                this.$router.push("/signin")
                return true;
            } else {
                return false;
            }

        }

    },

    created() {
        this.getUser();
        auth.onAuthStateChanged(user => {
            console.log(user)
        })

        auth.onAuthStateChanged(user => {
            if (user) {
                this.$route.params.id = user.uid
            }
        })



    },

    updated() {

    }

}



</script>


<style scoped>
.form {
    padding-top: 5vh;
}

.userprofile-form {
    display: grid;
    grid-template-columns: 30% 70%;
    grid-template-rows: 30% 70%;
    margin: 0 auto;
    width: 80vw;
    height: 80vh;
    border-radius: 20px;
    box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px,
        rgba(0, 0, 0, 0.3) 0px 30px 60px -30px,
        rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
}

.userprofile-form-grid1 {
    grid-column: 1;
    grid-row: 1;
    border-right: 1px solid black;
}

.userprofile-form-grid1 > img {
    width: 200px;
    height: 200px;
    display: block;
    margin-left: auto;
    margin-right: auto;
    margin-top: 2vh;
}

.userprofile-form-grid2 {
    grid-column: 2;
    grid-row: 1;
    border-left: 1px solid black;
}

.userprofile-form-grid2-buttons {
    float: right;
    margin-right: 2vw;
    margin-top: 2vh;
    display: flex;
    flex-direction: column;
    padding: 1vw;
}

.userprofile-form-grid2-buttons > button {
    margin-bottom: 1vh;
}

.userprofile-form-grid2-button-amountOfPosts {
    margin-top: 15vh;
    margin-left: 2vw;
}

.userprofile-form-grid3 {
    grid-column: 1;
    grid-row: 2;
    border-right: 1px solid black;
    border-top: 1px solid black;
    background-color: #eff0f1;
    border-bottom-left-radius: 20px;
    box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px,
        rgba(0, 0, 0, 0.3) 0px 30px 60px -30px,
        rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
}

.userprofile-form-grid3 > h2 {
    border-bottom: 1px solid black;
    text-align: center;
    margin-top: 2vh;
    margin-bottom: 2vh;
    color: black;
}

.userprofile-form-grid3 > nav > div > a {
    margin-left: 2vw;
}

.userprofile-form-grid3-contentNavbar {
    display: flex;
    flex-direction: column;
}

.userprofile-form-grid3-contentNavbar > div > a {
    text-decoration: none;
    font-size: 150%;
    color: black;
}

.userprofile-form-grid3-contentNavbar > div:hover {
    background-color: #7aa7c7;
    border-radius: 20px;
    width: 100%;
}

.userprofile-form-grid4 {
    grid-column: 2;
    grid-row: 2;
    border-left: 1px solid black;
    border-top: 1px solid black;
    background-color: #eff0f1;
    border-bottom-right-radius: 20px;
}

.userprofile-form-grid4-username {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    margin-bottom: 2vh;
    margin-right: 2vw;
    margin-left: 2vw;
    margin-top: 2vh;
    color: black;
    font-size: 120%;
}
.userprofile-form-grid4-username > input {
    width: 60%;
}

.userprofile-form-grid4-email {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    margin-bottom: 2vh;
    margin-right: 2vw;
    margin-left: 2vw;
    color: black;
    font-size: 120%;
}

.userprofile-form-grid4-email > input {
    width: 60%;
}

.userprofile-form-grid4-password {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    margin-bottom: 2vh;
    margin-right: 2vw;
    margin-left: 2vw;
    color: black;
    font-size: 120%;
}

.userprofile-form-grid4-password > input {
    width: 60%;
}

.userprofile-form-grid4-verify {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    margin-bottom: 2vh;
    margin-right: 2vw;
    margin-left: 2vw;
    color: black;
    font-size: 120%;
}

.userprofile-form-grid4-verify > input {
    width: 60%;
}

.userprofile-form-grid4-buttons {
    display: flex;
    flex-direction: row;
    justify-content: center;
    margin-top: 30vh;
}
/*     
    .userprofile-form-grid4-buttons>button:nth-child(2){
        margin-left: 1vw;
    }

    .userprofile-form-grid4-buttons>button{
        background-color: #e1ecf4;
        border-radius: 3px;
        border: 1px solid #7aa7c7;
        box-shadow: rgba(255, 255, 255, .7) 0 1px 0 0 inset;
        box-sizing: border-box;
        color: #39739d;
        cursor: pointer;
        display: inline-block;
        font-family: -apple-system,system-ui,"Segoe UI","Liberation Sans",sans-serif;
        font-size: 13px;
        font-weight: 400;
        line-height: 1.15385;
        margin: 0;
        outline: none;
        padding: 8px .8em;
        position: relative;
        text-align: center;
        text-decoration: none;
        user-select: none;
        -webkit-user-select: none;
        touch-action: manipulation;
        vertical-align: baseline;
        white-space: nowrap;
        margin-right: 0.5vw;
    } */
/* 
    .userprofile-form-grid4-buttons>button:hover,
    .userprofile-form-grid4-buttons>button:focus {
        background-color: #b3d3ea;
        color: #2c5777;
    } */
/* 
    .userprofile-form-grid4-buttons>button:focus {
        box-shadow: 0 0 0 4px rgba(0, 149, 255, .15);
    }

    .userprofile-form-grid4-buttons>button:active {
        background-color: #a0c7e4;
        box-shadow: none;
        color: #2c5777;
    }
    */
</style>