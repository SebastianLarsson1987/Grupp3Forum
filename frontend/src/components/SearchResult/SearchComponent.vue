<template>
  <div class="content">
    
   
    <h1>Sökresultat</h1>
    <div v-for="item in Result" :key="item.id" class="content-item">
      <div class="threads">
        <div class="left">
        <h4><router-link :id="item.categoryName" :to="`/threadmessages/${item.id}`" class="thread-name">{{item.topic}}</router-link></h4>
        <p>Skapad {{item.createadAt}}</p>
        <div class="right"></div>
        </div>
          <p class="">{{item.text}}</p>
      </div>
      
    </div>
   
  </div>
</template>

<script>
  export default {
    data(){
      return{ 

      }
    },
    computed:{
      Result(){
        return this.$store.state.threadsBySearch
      }
    },


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
  flex-direction: column;
  
 
  
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