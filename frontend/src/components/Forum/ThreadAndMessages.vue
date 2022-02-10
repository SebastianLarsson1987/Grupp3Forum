<template>
    <div>
    
        <form class="threadmessages-wrapper-form"
        v-for="item in oneThreadAndMessages2" :key="item.id">
            <div class="threadmessages-wrapper-form-threadAndMessages">
                <div class="threadmessages-wrapper-form-thread">
                    <ul>
                    <div class="group-admin-buttons-remove-thread" v-if="item.userUid==uid">
                        
                        <div v-if="item.blocked==false">
                             
                             <input type="submit" @click="blockThread(item.id)" value="Stäng tråd"/> 
                        </div>
                        
                        
                        <input type="submit" @click="removeThread(item.id)" value="Ta bort tråd"/>
                        
                    </div>
                        <li class="threadmessages-wrapper-form-thread-list">
                            <h1>{{ item.topic }}</h1>
                            <i>Tråd Skapad {{ item.createadAt }}</i>
                            <i>Tråd senast uppdaterad {{ item.updatedAt }}</i>
                        </li>
                    </ul>
                </div>
                <div class="threadmessages-wrapper-form-messages-scroll"> 
                    <div class="threadmessages-wrapper-form-messages"
                    v-for="message in paginatedData" :key="message.id">
                    <div >
                        <ul>
                            <li class="threadmessages-wrapper-form-messages-list">
                                <div class="threadmessages-wrapper-form-messages-list-header">
                                    <i>Skapad {{message.createdAt}}</i>
                                    <i>Uppdaterad {{message.updatedAt}}</i>
                                    <div v-if="item.userUid === uid">
                                        <div class="buttons">
                                            <input type="submit" @click="deleteMessage(message.id)" value="Ta bort meddelande"/>
                                    <i>#{{message.id}}</i>
                                        </div>
                                </div>
                                            
                                </div>
                                <div class="threadmessages-wrapper-form-messages-list-content">
                                    <i>Medlem: {{message.userU.userName}}</i>
                                    <p>{{message.text}}</p>
                                    <div class="buttons-for-all">
                                        <input type="submit" @click="reportMessage(message.id)" value="Anmäl inlägg"/>
                                        
                                    </div>
                                </div>
                                
                            </li>
                        </ul>
                    </div>
                    </div>
                    <div class="threadmessages-wrapper-form-messages-scroll-buttons">
                        <button type="button" @click="firstPage" :disabled="pageNumber === 0">
                            <i class="fas fa-angle-double-left"></i>
                        </button>
                        <button type="button" @click="prevPage" :disabled="pageNumber === 0">
                            <i class="fas fa-chevron-left"></i>
                        </button>
                        <p>sida {{ pageNumber + 1 }} av {{ pageCount }}</p>
                        <button
                            type="button"
                            @click="nextPage"
                            :disabled="pageNumber >= pageCount - 1"
                        >
                            <i class="fas fa-chevron-right"></i>
                        </button>
                        <button
                            type="button"
                            @click="lastPage"
                            :disabled="pageNumber >= pageCount - 1"
                        >
                            <i class="fas fa-angle-double-right"></i>
                        </button>
                    </div>
                </div>
                <div class="threadmessages-wrapper-form-messages-writeMessage" v-if="item.blocked==false">
                    
                    <div v-if="!writeMessageDisabled">
                        <textarea
                            class="threadmessages-wrapper-form-messages-writeMessage-textArea"
                            rows="5"
                            cols="100"
                            placeholder="Skriv ditt meddelande här..."
                            v-model="newMessage.mtext"
                        ></textarea>
                        <button @click="postMessage()">Skapa meddelande</button>
                    </div>
                </div>
                <div v-else>
                    <h4>Tråden är blockad av gruppadmin</h4>
                </div>
            </div>
        </form>
    </div>
</template>

<script>

import axios from "axios";
import router from '../../router/index'
import { auth } from "../../assets/js/firebase";
export default {

    props: {
        size: {
            type: Number,
            required: false,
            default: 10
        }
    },
    components: {
        
    },
    data(){
        return{
           newMessage:{
                mtext: "",
            },
            messages: [],
            pageNumber: 0,
            writeMessageDisabled: false

        }
    },

    computed: {

        oneThreadAndMessages2: {
            get() {
                return this.$store.state.oneThreadAndMessages
            },
            set(value) {
                this.$store.commit('setOneThreadAndMessages', value)
            }
        },

        pageCount() {
            let l = this.$store.state.messages.length,
                s = this.size;
            return Math.ceil(l / s);
        },
        paginatedData() {
            const start = this.pageNumber * this.size,
                end = start + this.size;

            let array = this.$store.state.messages.slice(start, end)
                .sort((a, b) => a.updatedAt - b.updatedAt);
            console.log("paginateddata", array)
            return array;
        },
        uid() {
            let user = auth.currentUser;
            if (!user) {
                return console.log("not logged in")
            }
            else {
                return user.uid
            }

        },

        banned() {
            return this.$store.state.bannedUser
        }



    },

    methods: {
        async getOneThreadAndMessages(id) {
            this.threadAndMessages = await this.$store.dispatch('getThreadAndMessagesById', id);
            return this.threadAndMessages;
        },
        async reportMessage(id){  
            
            console.log(id)  
            
            axios
            .put(`https://localhost:44362/api/Message/ReportMessage?id=`+id)
            .then(response=>{
                console.log(response)
            })
            .then(error=>{
                console.log(error)
            })
            
           
        },
        async removeThread(id){
            console.log(id)
            axios
            .delete(`https://localhost:44362/api/Thread/RemoveThread?id=`+id)
            .then(response=>{
                console.log(response)
            })
            .then(error=>{
                console.log(error)
            })
            router.push("/main")
        },
        async deleteMessage(id){
            console.log(id)
            axios
            .delete(`https://localhost:44362/api/Message/DeleteMessage?id=`+id)
            .then(response=>{
                console.log(response)
            })
            .then(error=>{
                console.log(error)
            })

            router.push("/forum")
        },
        
        postMessage(){
            
            let payload = {
                mtext: this.newMessage.mtext,
                threadId: this.$route.params.id,
                userId: auth.currentUser.uid
            }
            if (payload.mtext == "") {
                return alert("Fältet får inte vara tomt")
            }
            else {
                return this.$store.dispatch('postMessageInThread', payload)
            }


        },


        nextPage() {
            this.pageNumber++;
        },
        prevPage() {
            this.pageNumber--;
        },
        lastPage() {
            let length = this.$store.state.messages.length
            let size = this.size;

            let pageCount = Math.ceil(length / size);

            this.pageNumber = pageCount - 1;
            return this.pageNumber;

        },
        firstPage() {
            this.pageNumber = 0;
        },

        async stateChanged() {
            auth.onAuthStateChanged(user => {
                if (!user) {
                    this.writeMessageDisabled = true;
                    this.uid == user.uid
                }
            })
        },
        blockThread(id){
            
            axios
            .put("https://localhost:44362/api/Thread/BlockThread?id=" +id)
            .then(response => {
                console.log(response)
            })
            .then(error => {
                console.log(error)
            })
        },
        
        
            
        async removeMessage(id) {
            await this.$store.dispatch("deleteMessage", id);
        },
        async GetUser() {
            return await fetch(`https://localhost:44362/GetOneUser?id=${this.uid}`);
        }
    },

    async created() {

        await this.getOneThreadAndMessages(this.$route.params.id)
        await this.stateChanged();
        await this.GetUser();
        this.messages = this.$store.getters.getMessages;
    }



}
</script>

<style scoped>
.threadmessages-wrapper-form {
    margin: 0 auto;
    border: 1px solid black;
    width: 80vw;
    height: 80vh;
    border-radius: 20px;
}
.threadmessages-wrapper-form-thread {
    border: 1px solid black;
    border-top-right-radius: 20px;
    border-top-left-radius: 20px;
    height: 10vh;
    position:relative;
}

.threadmessages-wrapper-form-messages-scroll {
    overflow-x: hidden;
    overflow-y: auto;

    text-align: justify;
    height: 50vh;
}

.threadmessages-wrapper-form-messages-scroll-buttons > button {
    display: block;
    margin: 0 auto;
}
.threadmessages-wrapper-form-messages-scroll-buttons {
    display: flex;
    flex-direction: row;
}

.threadmessages-wrapper-form-thread-list > i {
    display: flex;
    flex-direction: row;
    font-size: 70%;
}

.threadmessages-wrapper-form-messages-list {
    margin: 0 auto;
    margin-left: 1vw;
    margin-top: 0.5vw;
}

.threadmessages-wrapper-form-messages-list > div {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    width: 76vw;
    border: 1px solid black;
}

.threadmessages-wrapper-form-messages-list > div > i {
    font-size: 70%;
}

.threadmessages-wrapper-form-messages-list > div > i:nth-child(2) {
    margin-right: 2vw;
}

.threadmessages-wrapper-form-messages-list-content > p {
    margin-left: 1vw;
    inline-size: 70vw;
    overflow-wrap: break-word;
}

.threadmessages-wrapper-form-messages-list-content > i {
    border-right: 1px solid black;
    width: 10vw;
    background-color: aliceblue;
}

.threadmessages-wrapper-form-messages-writeMessage {
    border: 1px solid black;
    height: 20vh;
    border-bottom-left-radius: 20px;
    border-bottom-right-radius: 20px;
}

.threadmessages-wrapper-form-messages-writeMessage-textArea {
    resize: none;
    display: block;
    margin: 0 auto;
    margin-top: 2vh;
}

.threadmessages-wrapper-form-messages-writeMessage > div {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.threadmessages-wrapper-form-messages-writeMessage > div > button {
    width: 55%;
}
.group-admin-buttons-remove-thread{
    float:right;
}

.remove-thread-button{
   cursor:pointer;
}
.bicons{
    width:25%;
    
}
.threadmessages-wrapper-form-messages-list-header{
    display:flex;
    flex-direction: row;
}
.far, .fas{
    font-size: 1.5em;
    margin-right: 0.5em;
    margin-top: 0.3em;
    cursor:pointer;
}

</style>