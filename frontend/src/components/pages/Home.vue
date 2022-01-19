<template>
  <div>
  <div>
    <h1>Hej och välkommen till FORUM.3</h1>
    <p>
      The best communication platform connecting minds around the globe
    </p>   
  </div>
  <div>
    <nav id="main-menu">
      <ul>
        <li v-for='categoryName in categoryNames' :key='categoryName'><a href="#">{{categoryName}}</a></li>
        <!-- <li><a href="#">Män</a></li>
        <li><a href="#">Barn</a></li>
        <li><a href="#">Idrott</a></li>
        <li><a href="#">Beauty</a></li>
        <li><a href="#">Home</a></li>         -->
      </ul>
    </nav>
  </div>
  </div>
</template>

<script>
export default {
   data(){
      return{
        categoryName: ""
      }
    },
    methods:{
      async submit(){
        
        await fetch("api/Thread/CreateThread", {
          method: "POST",
          headers:{
            'Content-Type': "application/json"
          },
          body: JSON.stringify({categoryName: this.categoryName})

        })
      }
    },
    created(){
      this.$store.dispatch('fetchCategories')
    },
    computed:{
      categories(){
        return this.$store.state.categories
      }
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
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

</style>
