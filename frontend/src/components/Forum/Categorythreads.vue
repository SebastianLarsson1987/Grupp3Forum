<template>
    <div>
        <form class="categorythreads-wrapper-form"
        v-for="oneCategeoryPlusThreads in categoryAndThreadsComputed" :key="oneCategeoryPlusThreads.id">
            <div class="categorythreads-wrapper-form-header">
                <h1>{{oneCategeoryPlusThreads.categoryName}}</h1>
            </div>
            <div class="categorythreads-wrapper-form-scroll">
                <div class="categorythreads-wrapper-form-threads" 
                v-for="thread in oneCategeoryPlusThreads.newThreads" :key="thread.id">
                    <ul class="categorythreads-wrapper-form-threads-unordered-list">
                        <li class="categorythreads-wrapper-form-threads-list">
                            <router-link :to="`/threadmessages/${thread.id}`" >{{thread.topic}}</router-link>
                            <i>Senast uppdaterad: {{thread.updatedAt}}</i>
                            <p>{{thread.text}}</p>
                        </li>
                    </ul>
                </div>
            </div>
        </form>
    </div>    
</template>

<script>

//import handlePagination from '../handlePagination.js'

export default {

    
    components: {
        
        
    },

    data(){
        return{
           categoryAndThreads: [],
           handlePaginationValue: []
        }
    },
    computed: {
        categoryAndThreadsComputed() {
            return this.$store.state.oneCategoryAndThreads
        }
    },

    setup() {
        
    },

    methods: {
        async getCategoryAndThreads(id){
            this.categoryAndThreadsComputed = await this.$store.dispatch('getCategoryThreadsPerCategoryId', id);
            //this.handlePaginationValue = handlePagination(this.oneCategoryAndThreads)
            
            return this.categoryAndThreadsComputed
        },

    

    },

    async created(){
        this.getCategoryAndThreads(this.$route.params.id);
    }
}
</script>

<style scoped>

.categorythreads-wrapper-form{
    margin: 0 auto;
    border: 1px solid black;
    width: 80vw;
    height: 80vh;
    border-radius: 20px;
}

.categorythreads-wrapper-form-header{
    border-bottom: 1px solid black;
}
.categorythreads-wrapper-form-header>h1{
    text-align: center;
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
}

.categorythreads-wrapper-form-threads{
        
}

.categorythreads-wrapper-form-scroll{
        overflow-x: hidden;
        overflow-y: auto;
        text-align: justify;
        height:72vh;
}

</style>