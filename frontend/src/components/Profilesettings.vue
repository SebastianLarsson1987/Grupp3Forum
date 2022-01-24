<template>
    <div class="form">
        <form class="userprofile-form">
            <div class="userprofile-form-grid1">
                 <img src="../assets/emptyavatar2.png" alt="">
            </div>
            <div class="userprofile-form-grid2">
                <div class="userprofile-form-grid2-button">
                    <button type="button" @click="edit">Redigera Profil</button>
                </div>
                <div class="userprofile-form-grid2-button-amountOfPosts">
                    
                </div>
            </div>
            <div class="userprofile-form-grid3">
                <h2>Innehåll</h2>
                <nav class="userprofile-form-grid3-contentNavbar">
                    <div>
                        <router-link to="/userposts">Inlägg</router-link>
                    </div>
                    <div>
                         <router-link to="#">Grupper</router-link>
                    </div>
                    <div>
                        <router-link to="/profilesettings">Profilinställningar</router-link>
                    </div>
                </nav>
            </div>
            <div class="userprofile-form-grid4" v-for="(item, index) in user" :key="index">
                <div class="userprofile-form-grid4-banned" v-if="item.banned">
                    <h2>This user is banned</h2>
                </div>
                <div v-else>
                    <div class="userprofile-form-grid4-username">
                        <p>Användarnamn</p>
                        <input type="text" placeholder="Användarnamn" v-bind:disabled="isReadOnly" v-model="item.userName">
                    </div>
                    <div class="userprofile-form-grid4-email">
                        <p>Email</p>
                        <input type="text" placeholder="Email" v-bind:disabled="isReadOnly" v-model="item.email">
                    </div>
                    <div class="userprofile-form-grid4-password">
                        <p>Lösenord</p>
                        <input type="password" placeholder="Lösenord" v-bind:disabled="isReadOnly">
                    </div>
                    <div class="userprofile-form-grid4-verify">
                        <p>Bekräfta lösenord*</p>
                        <input type="password" placeholder="Bekräfta lösenord" v-bind:disabled="isReadOnly">
                    </div>
                    <div class="userprofile-form-grid4-buttons">
                        <button  @click="putUser($route.params.id, item.email, item.userName)">Spara</button>
                        <button @click="cancel">Avbryt</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</template>

<script>

export default {
    components: {
      
    },
    data(){
        return{
            isReadOnly: true,
            showPosts: false,
            editProfile: false
        }
    },
    computed:{
            user(){
                return this.$store.state.user;
            }
    },
    methods:{
        edit(){
            this.isReadOnly = false
        },

        cancel(){
            this.isReadOnly = true;
        },

        getUser(){
            return this.$store.dispatch('getOneUser', this.$route.params.id)
        },

        putUser(id, email, userName){
            this.isReadOnly = true
            return this.$store.dispatch('editUser', {id, email, userName});
        }
    },

    created(){
        this.getUser();
    }
    
}



</script>


<style scoped>

    .form{
        padding-top: 10vh;
    }

     .userprofile-form{
        display: grid;
        grid-template-columns: 30% 70%;
        grid-template-rows: 30% 70%;
        margin: 0 auto;
        width: 80vw;
        height: 80vh;
        border-radius: 20px;
        box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;

    }

    .userprofile-form-grid1{
        grid-column: 1;
        grid-row: 1;
        border-right: 1px solid black;

    }

    .userprofile-form-grid1>img{
        width: 200px;
        height: 200px;
        display:block;
        margin-left: auto;
        margin-right: auto;
        margin-top: 2vh;
    }

    .userprofile-form-grid2{
        grid-column: 2;
        grid-row: 1;
        border-left: 1px solid black;
       
    }

    .userprofile-form-grid2-button{
        float:right;
        margin-right: 2vw;
        margin-top: 2vh;
    }

    .userprofile-form-grid2-button-amountOfPosts{
        margin-top: 15vh;
        margin-left: 2vw;
    }

    .userprofile-form-grid3{
        grid-column: 1;
        grid-row: 2;
        border-right: 1px solid black;
        border-top: 1px solid black;
        background-color: dodgerblue;
        border-bottom-left-radius: 20px;
        box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;

    }

    .userprofile-form-grid3>h2{
        border-bottom: 1px solid black;
        text-align: center;
        margin-top: 2vh;
        margin-bottom: 2vh;
        color:white;
        
        
    }

    .userprofile-form-grid3>nav>div>a{
        margin-left: 2vw;
    }

    .userprofile-form-grid3-contentNavbar{
        display:flex;
        flex-direction: column;
    }

    .userprofile-form-grid3-contentNavbar>div>a{
        text-decoration: none;
        font-size: 150%;
        color:white;
    }

    .userprofile-form-grid3-contentNavbar>div:hover    {
        background-color:#7aa7c7;
        border-radius: 20px;
        width:100%;
    }

    .userprofile-form-grid4{
        grid-column: 2;
        grid-row: 2;
        border-left: 1px solid black;
        border-top: 1px solid black;
        background-color: dodgerblue;
        border-bottom-right-radius: 20px;
        box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;

        
    }

    .userprofile-form-grid4-username{
        display:flex;
        flex-direction: row;
        justify-content: space-between;
        margin-bottom: 2vh;
        margin-right: 2vw;
        margin-left: 2vw;
        margin-top: 2vh;
        color:white;
        font-size: 120%;
    }
    .userprofile-form-grid4-username>input{
        width: 60%;
    }

    .userprofile-form-grid4-email{
        display:flex;
        flex-direction: row;
        justify-content: space-between;
        margin-bottom: 2vh;
        margin-right: 2vw;
        margin-left: 2vw;
        color:white;
        font-size: 120%;
    }

    .userprofile-form-grid4-email>input{
        width:60%;
    }

    .userprofile-form-grid4-password{
        display:flex;
        flex-direction: row;
        justify-content: space-between;
        margin-bottom: 2vh;
        margin-right: 2vw;
        margin-left: 2vw;
        color:white;
        font-size: 120%;
    }

    .userprofile-form-grid4-password>input{
        width: 60%;
    }

    .userprofile-form-grid4-verify{
        display:flex;
        flex-direction: row;
        justify-content: space-between;
        margin-bottom: 2vh;
        margin-right: 2vw;
        margin-left: 2vw;
        color:white;
        font-size: 120%;
    }

    .userprofile-form-grid4-verify>input{
        width: 60%;
    }

    .userprofile-form-grid4-buttons{
        display:flex;
        flex-direction: row;
        justify-content: center;
        margin-top: 15vh;
    }
    
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
    }

    .userprofile-form-grid4-buttons>button:hover,
    .userprofile-form-grid4-buttons>button:focus {
        background-color: #b3d3ea;
        color: #2c5777;
    }

    .userprofile-form-grid4-buttons>button:focus {
        box-shadow: 0 0 0 4px rgba(0, 149, 255, .15);
    }

    .userprofile-form-grid4-buttons>button:active {
        background-color: #a0c7e4;
        box-shadow: none;
        color: #2c5777;
    }
   
</style>