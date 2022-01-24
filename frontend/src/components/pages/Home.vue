<template>
  <div>
  <div>
    <nav id="register">
      <!-- <i class=""></i> add some icons -->
      <router-link :to="'/Register'">Bli medlem</router-link>
      <router-link :to="'/LogIn'">Logga In</router-link>
    </nav>
  </div>
  <div>
    <h1>Hej och välkommen till FORUM.3</h1>
    <p>
      The best communication platform connecting minds around the globe
    </p>   
  </div>
  <div>
    <nav id="main-menu">
      <ul>
        <li v-for='categoryName in categoryNames' :key='categoryName'><a href="#">{{categoryName.categoryName}}</a></li>
      </ul>
    </nav>
  </div>
  </div>
</template>

<script>
export default {
   data(){
      return{
        categoryNames: [],
      }
    },
    methods:{

    async loadCategories(){
        await this.$store.dispatch('fetchCategories')
        this.categoryNames=this.$store.state.categories

      }
    },
    async created(){
      await this.loadCategories()
    },
    computed:{
      categories(){
        return this.$store.state.categories
      }
     },
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
nav {
  display: block;
}
#register {
    display: inline-block;
}

</style>
