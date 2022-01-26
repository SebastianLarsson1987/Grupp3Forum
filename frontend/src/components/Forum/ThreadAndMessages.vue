<template>
    <div>
        <form class="threadmessages-wrapper-form"
        v-for="item in threadAndMessages" :key="item.id">
            <div class="threadmessages-wrapper-form-threadAndMessages">
                <div class="threadmessages-wrapper-form-thread">
                    <ul>
                        <li class="threadmessages-wrapper-form-thread-list">
                            <h1>{{item.topic}}</h1>
                            <i>Tråd Skapad {{item.createadAt}}</i>
                            <i>Tråd senast uppdaterad {{item.updatedAt}}</i>
                        </li>
                    </ul>
                </div>
                <div class="threadmessages-wrapper-form-messages-scroll"> 
                    <div class="threadmessages-wrapper-form-messages"
                    v-for="message in item.messages" :key="message.id">
                        <ul>
                            <li class="threadmessages-wrapper-form-messages-list">
                                <div class="threadmessages-wrapper-form-messages-list-header">
                                    <i>Skapad {{message.createdAt}}</i>
                                    <i>#{{message.id}}</i>
                                </div>
                                <div class="threadmessages-wrapper-form-messages-list-content">
                                    <p>{{message.text}}</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="threadmessages-wrapper-form-messages-writeMessage">
                    <div>
                        <textarea class="threadmessages-wrapper-form-messages-writeMessage-textArea" 
                        rows="5" cols="100" v-model="newMessage.text"></textarea>
                        <button type="button" @click="postMessage($route.params.id,newMessage.text,newMessage.userId)">Skapa meddelande</button>
                        <input type="text" v-model="newMessage.userId">
                    </div>
                </div>
            </div>
        </form>
    </div>
</template>

<script>
import {useArrayPagination} from 'vue-composable'

export default {
    data(){
        return{
           newMessage: {
               text: '',
               userId: 0
           }
        }
    },

    computed:{
        threadAndMessages(){
            return this.$store.state.oneThreadAndMessages
        },

        oneThreadAndMessages2:{
            get(){
                return this.$store.state.oneThreadAndMessages
            },
            set(value){
                this.$store.commit('setOneThreadAndMessages', value)
            }
        }
    },

    methods:{
        async getOneThreadAndMessages(id){
            this.threadAndMessages = await this.$store.dispatch('getThreadAndMessagesById', id);
            return this.threadAndMessages;
        },

        async postMessage(threadId, text, userId){
            return this.$store.dispatch('postMessageInThread', threadId, text, userId)
        }
    },

    async created(){
        this.getOneThreadAndMessages(this.$route.params.id)
        console.log(this.threadAndMessages)

       
        
    },

    setup(){
            const array = []
            const {result, next, prev, currentPage, lastPage} = useArrayPagination(
            array,
            {
                pageSize: 3
            }
        );
        console.log(result);
        return {result, next, prev, currentPage, lastPage}
    },
}
</script>

<style scoped>
.threadmessages-wrapper-form{
    margin: 0 auto;
    border: 1px solid black;
    width: 80vw;
    height: 80vh;
    border-radius: 20px;
}
.threadmessages-wrapper-form-thread{
    border: 1px solid black;
    border-top-right-radius: 20px;
    border-top-left-radius: 20px;
    height: 10vh;
}

.threadmessages-wrapper-form-messages-scroll{
    overflow-x: hidden;
    overflow-y: auto;
    text-align: justify;
    height:50vh;
}

.threadmessages-wrapper-form-thread-list>i{
    display:flex;
    flex-direction: row;
    font-size: 70%;
}

.threadmessages-wrapper-form-messages-list{
    margin: 0 auto;
    margin-left: 1vw;
    margin-top: 0.5vw;
}

.threadmessages-wrapper-form-messages-list>div{
    display:flex;
    flex-direction: row;
    justify-content: space-between;
    width: 77vw;
    border: 1px solid black;
}

.threadmessages-wrapper-form-messages-list>div>i{
    font-size: 70%;
}

.threadmessages-wrapper-form-messages-list>div>i:nth-child(2){
    margin-right: 2vw;
}
.threadmessages-wrapper-form-messages-list>div>i:nth-child(1){
    margin-left: 1vw;
}

.threadmessages-wrapper-form-messages-list-content>p{
    margin-left:1vw;
}

.threadmessages-wrapper-form-messages-writeMessage{
    border: 1px solid black;
    height: 20vh;
    border-bottom-left-radius: 20px;
    border-bottom-right-radius: 20px;
}

.threadmessages-wrapper-form-messages-writeMessage-textArea{
    resize: none;
    display:block;
    margin: 0 auto;
    margin-top: 2vh;
}


</style>