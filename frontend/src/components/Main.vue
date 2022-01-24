<template>
  <div class="content">
    <h1>Main</h1>
    <div v-for="item in AllCategoriesAndThreads" :key="item.id" class="content-item">
      <div class="name">
         <h1 class="category-header">{{item.categoryName}}</h1>
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

      }
    },
    created(){
      this.$store.dispatch('fetchCategoriesAndThreads')
    },
    computed:{
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
</style>