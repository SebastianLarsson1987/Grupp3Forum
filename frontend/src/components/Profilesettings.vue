<template>
    <div class="form">
        <form class="userprofile-form">
            <div class="userprofile-form-grid1">
                
            </div>
            <div class="userprofile-form-grid2">
                <div class="userprofile-form-grid2-button">
                    <button type="button" @click="toggleReadOnly">Redigera Profil</button>
                </div>
                <div class="userprofile-form-grid2-button-amountOfPosts">
                    <p>Antal inlägg:</p>
                </div>
            </div>
            <div class="userprofile-form-grid3">
                <h2>Innehåll</h2>
                <nav>
                    <router-link to="#">Inlägg</router-link>
                </nav>
            </div>
            <div class="userprofile-form-grid4">
                <div class="userprofile-form-grid4-username">
                    <p>Användarnamn</p>
                    <input type="text" placeholder="Användarnamn" v-bind:disabled="isReadOnly">
                </div>
                <div class="userprofile-form-grid4-email">
                    <p>Email</p>
                    <input type="text" placeholder="Email" v-bind:disabled="isReadOnly">
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
                    <button @click="save">Spara</button>
                    <button>Avbryt</button>
                </div>
            </div>
        </form>
    </div>
</template>

<script>
export default {
    data(){
        return{
            isReadOnly: true
        }
    },
    computed:{
        
    },
    methods:{
        toggleReadOnly(){
            this.isReadOnly = !this.isReadOnly
            console.log(this.isReadOnly)
        },

        save(){
            this.isReadOnly = true
        }
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
    }

    .userprofile-form-grid3>h2{
        border-bottom: 1px solid black;
        text-align: center;
        margin-top: 2vh;
        margin-bottom: 2vh;
        
    }

    .userprofile-form-grid3>nav>a{
        margin-left: 2vw;
    }

    .userprofile-form-grid4{
        grid-column: 2;
        grid-row: 2;
        border-left: 1px solid black;
        border-top: 1px solid black;
        
    }

    .userprofile-form-grid4-username{
        display:flex;
        flex-direction: row;
        justify-content: space-between;
        margin-bottom: 2vh;
        margin-right: 2vw;
        margin-left: 2vw;
        margin-top: 2vh;
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
    }

    .userprofile-form-grid4-verify>input{
        width: 60%;
    }

    .userprofile-form-grid4-buttons{
        display:flex;
        flex-direction: row;
        justify-content: center;
        margin-top: 20vh;
    }
    
    .userprofile-form-grid4-buttons>button:nth-child(2){
        margin-left: 1vw;
    }
   
</style>