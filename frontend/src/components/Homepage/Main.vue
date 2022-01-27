<template>
  <div class="content">
    <div>
      <h1>Hej och välkommen till FORUM.3</h1>
      <p>
        The best communication platform connecting minds around the globe
      </p>   
  </div>
  <div>
    <nav id="main-menu">
      <ul>
        <li v-for='categoryName in categoryNames' :key='categoryName'><a :href="`#${categoryName.categoryName}`">{{categoryName.categoryName}}</a></li>
      </ul>
    </nav>
  </div>
    <!-- <h1>Main</h1> -->
    <div v-for="item in AllCategoriesAndThreads" :key="item.id" class="content-item">
      <div class="name">
         <router-link :id="item.categoryName" :to="`/categorythreads/${item.id}`" class="category-header">{{item.categoryName}}</router-link>
         <p>Antal trådar: {{item.newThreads.length}}</p>
      </div>
      <div v-for="item2 in item.newThreads.slice(0,2) " :key="item2.id" class="threads">
        <div class="left">
          <h4 class="thread-name">{{item2.topic}}</h4>
          <p>Antal svar i tråd:{{item2.messages.length}}</p>a
        </div>
        <div v-for="item3 in item2.messages.slice(0,1)" :key="item3.id" class="right">
          <h4>{{item3.text}}</h4>
          <p>{{item3.createdAt}}</p>
        </div>        
      
      </div>
    </div>
   
  </div>
</template>

<script>
  export default {
    components:{
    },
    data(){
      return{
        categoryNames: [],
      }
    },
    async created(){
      await this.loadCategories()
      await this.$store.dispatch('fetchCategoriesAndThreads')
    },
    methods:{
    async loadCategories(){
        await this.$store.dispatch('fetchCategories')
        this.categoryNames=this.$store.state.categories
      }
    },
    computed:{
      categories(){
        return this.$store.state.categories
      },

      AllCategoriesAndThreads(){
        return this.$store.state.AllCategoriesAndThreads
      }
    }
  }
</script>

<style>
*{
  padding:0;
  margin:0;
  box-sizing:border-box;
}

h1 {
  font-size: 100;
  color: #044e74;
}
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #FB8500;
}
.content{
  display:flex;
  flex-direction:column;
  align-items:center;
  width:100%;
}
.threads{
  border:1px solid black;
  width:75%;
  display:flex;
  flex-direction: row;
  justify-content: flex-start;
}

.thread-name{
  display:flex;
  justify-content: flex-start;
  
}

.name{
  width:75%;
  background-color:#333; 
  color:white;
  display:flex;
  flex-direction:column;
  align-items:start;
}
.left{
  width:50%;
  border-right:1px solid black;
  display:flex;
  flex-direction:column;
  align-items:start;
  background-color:#eff0f1;
}
.right{
  width:50%;
  background-color:#e3e3e3;
  display:flex;
  flex-direction:column;
  align-items:start;

}
.content-item{
  width:100%;
  display:flex;
  flex-direction:column;
  align-items:center;
}

.category-header{
  font-size: 150%;
  text-decoration: none;
}
</style>