<template>
  <div>
    <form @submit.prevent="submit">
      <h1>Create Thread</h1>
      <label>Topic</label>
      <input type="text" name="Topic" v-model="topic"/>
      <label>Content</label>
      <textarea type="text" name="Content" v-model="content"></textarea>
      <select>
        <option>Välj kategori</option>
        <option v-for="item in categories" :key="item.id" value="item.id">{{item.categoryName}}</option>
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
        topic: "",
        content:""
      }
    },
    methods:{
      async submit(){
        console.log("Hello world")
        await fetch("api/Thread/CreateThread", {
          method: "POST",
          headers:{
            'Content-Type': "application/json"
          },
          body: JSON.stringify({topic: this.topic, content: this.content})

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

