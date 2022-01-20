<template>
    <div class="form">
        <form class="userprofile-form">
            <div class="userprofile-form-grid1">
                
            </div>
            <div class="userprofile-form-grid2">
                <div class="userprofile-form-grid2-button-amountOfPosts">
                    <p>Antal inlägg:</p>
                </div>
            </div>
            <div class="userprofile-form-grid3">
                <h2>Innehåll</h2>
                <nav class="userprofile-form-grid3-contentNavbar">
                    <router-link to="/userposts">Inlägg</router-link>
                    <router-link to="#">Grupper</router-link>
                    <router-link to="/profilesettings">Profilinställningar</router-link>
                </nav>
            </div>
            <div class="userprofile-form-grid4">
                <div class="userprofile-form-grid4-wrapperscroll">
                    <ul class="userprofile-form-grid4-ul" v-for="post in userPosts" :key="post.userId">
                        <li class="userprofile-form-grid4-list">
                            <p>Inlägg skapat: {{post.createdAt}}</p>
                            <p>Inlägg uppdaterat: {{post.updatedAt}}</p>
                            <p>{{post.id}}</p>
                            <textarea v-bind:disabled="isDisabled" class="userprofile-form-grid4-textarea" rows="4" cols="50" v-model="post.text"></textarea>
                            <div>
                                <button>Ta bort</button>
                                <button type="button" @click="edit">Redigera</button>
                                <button @click="putMessageText(post.id, post.text)">Spara</button>
                                <button @click="cancel">Avbryt</button>
                            </div>
                        </li> 
                    </ul>
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
            isDisabled: true
        }
    },
    computed:{
        userPosts(){
            return this.$store.state.userPosts;
        },
        
        
    },
    methods:{
        toggleReadOnly(){
            this.isReadOnly = !this.isReadOnly
            console.log(this.isReadOnly)
        },

        edit(){
            this.isDisabled = !this.isDisabled;
        },
        
        cancel(){
            this.isDisabled = true;
        },

        getUserPosts(){
            return this.$store.dispatch('getUserPosts', this.$route.params.id)

        },
        
        putMessageText(id, text){
            this.isDisabled = true;
            return this.$store.dispatch('putMessageText', {id, text})
            
        }

        

    },
    created(){

        this.getUserPosts();
        console.log(this.$route.params.id)
       
        
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

    .userprofile-form-grid3-contentNavbar{
        display:flex;
        flex-direction: column;
    }

    .userprofile-form-grid4{
        grid-column: 2;
        grid-row: 2;
        border-left: 1px solid black;
        border-top: 1px solid black;
        background-color: dodgerblue;
        border-bottom-right-radius: 20px;
        
    }

    .userprofile-form-grid4-wrapperscroll{
        overflow-x: hidden;
        overflow-y: auto;
        text-align: justify;
        height:53vh;
    }

    .userprofile-form-grid4-list{
        list-style: none;
        padding: 2vw;
        background-color: white;
        border-radius: 10px;
    }

    .userprofile-form-grid4-textarea{
        resize: none;
    }
    
    .userprofile-form-grid4-ul{
        padding: 2vw;
    }

</style>