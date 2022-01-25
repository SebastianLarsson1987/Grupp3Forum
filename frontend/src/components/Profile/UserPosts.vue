<template>
    <div class="form">
        <form class="userprofile-form">
            <div class="userprofile-form-grid1">
                <img src="../../assets/emptyavatar2.png" alt="">
            </div>
            <div class="userprofile-form-grid2">
                <div class="userprofile-form-grid2-searchbar" >
                    <input type="text" placeholder="Sök efter meddelande..." v-model="keyword">
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
            <div class="userprofile-form-grid4">
                <div class="userprofile-form-grid4-wrapperscroll">
                    <ul class="userprofile-form-grid4-ul" v-for="(post, index) in localPosts" :key="index">
                        <li class="userprofile-form-grid4-list">
                            <p>Inlägg skapat: {{post.createdAt}}</p>
                            <p>Inlägg uppdaterat: {{post.updatedAt}}</p>
                            <textarea v-bind:disabled="post.isDisabled" class="userprofile-form-grid4-textarea" rows="4" cols="50" v-model="post.text"></textarea>
                            <div class="userprofile-form-grid4-buttons">
                                <button>Ta bort</button>
                                <button type="button" @click="post.isDisabled = false">Redigera</button>
                                <button @click="putMessageText(post.id, post.text)">Spara</button>
                                <button @click="post.isDisabled = true">Avbryt</button>
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
            isDisabled: true,
            keyword: ""
            
        }
    },
    computed:{
        userPosts(){
            return this.$store.state.userPosts;
        },

        localPosts(){
            if(this.keyword){
                return this.$store.state.localPosts.filter(item => {
                    return this.keyword
                    .toLowerCase()
                    .split(" ")
                    .every(v => item.text.toLowerCase().includes(v));
                })
            }
            else{
                return this.$store.state.localPosts;
            }
            
        }


    },
    methods:{
        
        getUserPosts(){
            return this.$store.dispatch('getUserPosts', this.$route.params.id)
        },
        
        putMessageText(id, text){
            return this.$store.dispatch('putMessageText', {id, text})
        },

        


       

    },
    created(){

        this.getUserPosts();
        
    },

    mounted(){
        
        
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


    .userprofile-form-grid2-button-amountOfPosts{
        margin-top: 15vh;
        margin-left: 2vw;
    }

    .userprofile-form-grid2-searchbar>input{
        display:block;
        margin: 0 auto;
        margin-top: 2vh;
        width:60%;
        padding: 1vw;
        border-radius: 20px;
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
        
    }

    .userprofile-form-grid3-contentNavbar{
        display:flex;
        flex-direction: column;
        
    }

    .userprofile-form-grid3-contentNavbar>div>a{
        text-decoration: none;
        color: white;
        font-size: 150%;
        margin-left: 2vw;
        
    }

    .userprofile-form-grid3>h2{
        color:white;
    }

    .userprofile-form-grid3-contentNavbar>a:active{
        color:#7aa7c7;
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