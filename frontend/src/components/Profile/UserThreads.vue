<template>
    <div class="form">
        <form class="userprofile-form">
            <div class="userprofile-form-grid1">
                <img src="../../assets/emptyavatar2.png" alt="">
            </div>
            <div class="userprofile-form-grid2">
                <div class="userprofile-form-grid2-searchbar" >
                    <input type="text" placeholder="Sök efter tråd..." v-model="keyword">
                </div>
                <div class="userprofile-form-grid2-button-amountOfPosts">
                    
                </div>
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
                        <router-link :to="`/profilesettings/${$route.params.id}`">Profilinställningar</router-link>
                    </div>
                </nav>
            </div>
            <div class="userprofile-form-grid4" >
                <div class="userprofile-form-grid4-no-threads-message" v-if="localThreads.length == 0">
                        <p>Inga trådar att visa</p>
                </div>
                <div v-else class="userprofile-form-grid4-wrapperscroll">
                    <div v-for="thread in localThreads" :key="thread.id">
                        <ul class="userprofile-form-grid4-wrapperscroll-unordered-list">
                            <li class="userprofile-form-grid4-wrapperscroll-list">
                                <router-link :to="`/threadmessages/${thread.id}`" >{{thread.topic}}</router-link>
                                <i>Senast uppdaterad: {{thread.updatedAt}}</i>
                                <p>{{thread.text}}</p>
                            </li>
                        </ul>
                        <ul class="userprofile-form-grid4-wrapperscroll-unordered-list-reportedmessages" v-for="msg in thread.messages" :key="msg">
                            <li class="userprofile-form-grid4-wrapperscroll-list-reportedmessages" v-if="msg.isReported">
                                <h1>Anmält innehåll</h1>
                                <button class="" @click="deleteAndReportMessage( msg)">XX</button>
                                <button class="fas fa-ban" @click="deleteMessage(msg.id)"></button>
                                <!-- <p>{{msg.userU.userName}}</p> -->
                                <p>{{msg.text}}</p>
                                <button 
                                class="btn btn-primary btn-lg btn-block" 
                                @click="restoreMessage(msg.id)">Återställ meddelande</button>
                            </li>
                        </ul>
                   </div>
                </div>
            </div>
        </form>
    </div>
</template>



<script>

import { auth } from "../../assets/js/firebase";


export default {

    data(){
        return{
            keyword: "",
            isReported: [],
            
        }
    },


    computed: {
        user(){
                return this.$store.state.user;
        },
        uid(){
            let user = auth.currentUser;
            
            
            console.log(user.uid)
            return user.uid
        },
        localThreads(){
            if(this.keyword){
                return this.$store.state.userThreads.filter(item => {
                    return this.keyword
                    .toLowerCase()
                    .split(" ")
                    .every(v => item.topic.toLowerCase().includes(v));
                })
            }
            else{
                return this.$store.state.userThreads;
            }
            
            
        },

      

        
    },

    methods:{
        getUserThreadsByUid(id){
            return this.$store.dispatch('getThreadByUserId', id)
        },

        restoreMessage(id){
            return this.$store.dispatch('putMessageAsNotReported', id)
        },

        deleteMessage(id){
            return this.$store.dispatch('putDeleteMessage', id)
        },
        async deleteAndReportMessage(msg){
            // const body = JSON.stringify({Id:msg.id, Text:msg.text,  ThreadId:msg.threadId, UserUid:msg.uid,})
            
            await fetch("https://localhost:44362/api/Message/DeleteAndRepportMessage", {
                headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
                },
                method: "POST",
                body: JSON.stringify({Id:msg.id, Text:msg.text,  ThreadId:msg.threadId, UserUid:msg.userUid, Email:""})
            })
         
           
        }
    },


    created(){
            auth.onAuthStateChanged(user => {
                if(user){
                    this.$route.params.id = user.uid
                }
            }),
            this.getUserThreadsByUid(this.$route.params.id);
        
            
           
            
            
    },

   

    
}
</script>

<style scoped>
.form{
        padding-top: 5vh;
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
        background-color:#eff0f1;
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
        color: black;
        font-size: 150%;
        margin-left: 2vw;
        
    }

    .userprofile-form-grid3>h2{
        color:black;
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
        background-color:#eff0f1;
        border-bottom-right-radius: 20px;

        
    }

    .userprofile-form-grid4-wrapperscroll{
        overflow-x: hidden;
        overflow-y: auto;
        text-align: justify;
        height:53vh;
    }

    .userprofile-form-grid4-wrapperscroll-unordered-list{
        padding: 2vw;
    }

    .userprofile-form-grid4-wrapperscroll-list{
        border: 1px solid black;
        padding: 2vw;
        width: 60%;
    }

    .userprofile-form-grid4-wrapperscroll-list>a{
        font-size: 150%;
        text-decoration: none;
        border-bottom: 1px solid black;
        display: flex;
        justify-content: space-between;
    
    }

    .userprofile-form-grid4-wrapperscroll-list>i{
        font-size: 70%;
    }

    .userprofile-form-grid4-wrapperscroll-list>p{
        margin-top: 2vh;
        border:1px solid black;
        min-height: 5vh;
    }


    .userprofile-form-grid4-wrapperscroll{
        overflow-x: hidden;
        overflow-y: auto;
        text-align: justify;
        height:55vh;
    }

    .userprofile-form-grid4-wrapperscroll-unordered-list-reportedmessages{
        padding-bottom: 0.5vh;
    }

    .userprofile-form-grid4-wrapperscroll-list-reportedmessages{
        border: 1px solid black;
        padding: 2vw;
        width: 60%;
        margin-left: 10vw;
        
    }

    .userprofile-form-grid4-wrapperscroll-list-reportedmessages>p{
        margin-top: 2vh;
        border:1px solid black;
        min-height: 5vh;
    }

    .userprofile-form-grid4-wrapperscroll-list-reportedmessages>h1{
        color:red;
        font-size: 100%;
        display: inline-block;
    }

    .fa-ban{
        float:right;
        background-color: red;
        color: white;
    }

    .userprofile-form-grid4-no-threads-message>p{
        text-align: center;
        font-size: 200%;

    }

    .red{
        color: red;
    }

</style>