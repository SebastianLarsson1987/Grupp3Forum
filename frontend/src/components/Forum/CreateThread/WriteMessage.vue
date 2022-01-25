<template>
  <div>
    <form @submit.prevent="submit">
      <h1>Create Thread</h1>
      <label>Topic</label>
      <input type="text" name="Topic" v-model="topic"/>
      <label>Content</label>
      <textarea type="text" name="Content" v-model="content"></textarea>
      <select v-model="categoryId">
        <option>Välj kategori</option>
        <option v-for="item in categories" :key="item.id" :value="item.id" >{{item.categoryName}}</option>
      </select>
      <button>Tryck</button>
    </form>
   
  </div>
</template>

<script>
  export default {
    data(){
      return{
        msg: "",
        newThread:{
          topic: "",
          content:"",
          categoryId: 0
        }
      }
    },
    methods:{
      async submit(){
        await fetch("https://localhost:44362/api/Thread/CreateThread", {
          method: "POST",
          headers:{
            'Accept': 'application/json',
            'Content-Type': "application/json"
          },
          body: JSON.stringify({topic: this.topic,content: this.content,categoryId: this.categoryId})

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

<style lang="scss" scoped>

</style>

