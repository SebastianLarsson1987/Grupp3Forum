<template>
    <div>
        <form class="threadmessages-wrapper-form"
        v-for="item in threadAndMessages" :key="item.id">
            <div class="threadmessages-wrapper-form-threadAndMessages">
                <div class="threadmessages-wrapper-form-thread">
                    <ul>
                        <li class="threadmessages-wrapper-form-thread-list">
                            <h1>{{item.topic}}</h1>
                        </li>
                    </ul>
                </div>
            </div>
        </form>
    </div>
</template>

<script>
export default {
    computed:{
        threadAndMessages(){
            return this.$store.state.oneThreadAndMessages
        }
    },

    methods:{
        async getOneThreadAndMessages(id){
            this.threadAndMessages = await this.$store.dispatch('getThreadAndMessagesById', id);
            return this.threadAndMessages;
        }
    },

    async created(){
        this.getOneThreadAndMessages(this.$route.params.id)
        console.log(this.threadAndMessages)
    }
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
    height: 20vh;
}

</style>