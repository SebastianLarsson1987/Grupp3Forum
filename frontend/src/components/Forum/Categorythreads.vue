<template>
    <div class="div-wrapper">
        <form class="categorythreads-wrapper-form"
        v-for="oneCategeoryPlusThreads in categoryAndThreadsComputed" :key="oneCategeoryPlusThreads.id">
            <div class="categorythreads-wrapper-form-header">
                <h1>{{oneCategeoryPlusThreads.categoryName}}</h1>
            </div>
            <div class="categorythreads-wrapper-form-scroll">
                <div class="categorythreads-wrapper-form-threads" 
                v-for="thread in paginatedData" :key="thread.id">
                    <ul class="categorythreads-wrapper-form-threads-unordered-list">
                        <li class="categorythreads-wrapper-form-threads-list">
                            <router-link :to="`/threadmessages/${thread.id}`" >{{thread.topic}}</router-link>
                            <i>Senast uppdaterad: {{thread.updatedAt}}</i>
                            <p>{{thread.text}}</p>
                        </li>
                    </ul>
                </div>
                <div v-if="paginatedData.length != 0" class="categorythreads-wrapper-form-scroll-buttons">
                    <button type="button" @click="firstPage" :disabled="pageNumber === 0"><i class="fas fa-angle-double-left"></i></button>
                    <button type="button" @click="prevPage" :disabled="pageNumber === 0"><i class="fas fa-chevron-left"></i></button>
                    <p>sida {{pageNumber +1}} av {{pageCount}}</p>
                    <button type="button" @click="nextPage" :disabled="pageNumber >= pageCount -1"><i class="fas fa-chevron-right"></i></button>
                    <button type="button" @click="lastPage" :disabled="pageNumber >= pageCount -1"><i class="fas fa-angle-double-right"></i></button>
                </div>
            </div>
            <div class="categorythreads-wrapper-form-writeMessage">
                <WriteMessage/>
            </div>
        </form>
    </div>    
</template>

<script>

import WriteMessage from '../Forum/CreateThread/WriteMessage.vue'

export default {
    components:{
        WriteMessage
    },

    props:{
        size: {
            type: Number,
            required: false,
            default: 10
        }
    },

    data(){
        return{
           categoryAndThreads: [],
           handlePaginationValue: [],
           pageNumber: 0
        }
    },
    computed: {
        categoryAndThreadsComputed() {
            return this.$store.state.oneCategoryAndThreads
        },
        pageCount(){
            let length = this.$store.state.newThreads.length
            let size = this.size;
            
            return Math.ceil(length/size);
        },
        paginatedData(){
            const start = this.pageNumber * this.size,
            end = start + this.size;
            return this.$store.state.newThreads.slice(start,end);
        }
    },


    methods: {
        async getCategoryAndThreads(id){
            this.categoryAndThreadsComputed = await this.$store.dispatch('getCategoryThreadsPerCategoryId', id);
            //this.handlePaginationValue = handlePagination(this.oneCategoryAndThreads)
            
            return this.categoryAndThreadsComputed
        },

        nextPage(){
            this.pageNumber++;
        },
        prevPage(){
            this.pageNumber--;
        },
        lastPage(){
            let length = this.$store.state.newThreads.length
            let size = this.size;
            
            let pageCount = Math.ceil(length/size);

            this.pageNumber = pageCount-1;
            return this.pageNumber;
            
        },
        firstPage(){
            this.pageNumber = 0;
        }
    

    },

    async created(){
        this.getCategoryAndThreads(this.$route.params.id);
    }
}
</script>

<style scoped>

.div-wrapper{
    margin-bottom: 5vh;
}

.categorythreads-wrapper-form{
    margin: 0 auto;
    border: 1px solid black;
    width: 80vw;
    min-height: 80vh;
    border-radius: 20px;
}

.categorythreads-wrapper-form-header{
    border-bottom: 1px solid black;
}
.categorythreads-wrapper-form-header>h1{
    text-align: center;
}

.categorythreads-wrapper-form-writeMessage{
    border-top: 1px solid black;
    padding-bottom: 2vh;
}

.categorythreads-wrapper-form-threads-unordered-list{
    padding: 2vw;
}

.categorythreads-wrapper-form-threads-list{
    border: 1px solid black;
    padding: 2vw;
    width: 60%;
}

.categorythreads-wrapper-form-threads-list>a{
    font-size: 150%;
    text-decoration: none;
    border-bottom: 1px solid black;
    display: flex;
    justify-content: space-between;
    
}

.categorythreads-wrapper-form-threads-list>i{
    font-size: 70%;
}

.categorythreads-wrapper-form-threads-list>p{
    margin-top: 2vh;
    border:1px solid black;
    min-height: 5vh;
    inline-size: 40vw;
    overflow-wrap: break-word
}

.categorythreads-wrapper-form-scroll{
        overflow-x: hidden;
        overflow-y: auto;
        text-align: justify;
        height:72vh;
}

.categorythreads-wrapper-form-scroll-buttons{
    display:flex;
    flex-direction: row;
    
}

.categorythreads-wrapper-form-scroll-buttons>button{
    margin: 0 auto;
}

</style>