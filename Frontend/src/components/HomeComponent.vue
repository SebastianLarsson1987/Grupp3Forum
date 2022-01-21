<template>
  <div class="row d-flex justify-content-center">
    <div class="col-md-8 mt-5">
    <h5 class="card-header">Create Thread</h5>
    <br>
    <form @submit.prevent="submit">
      <label><strong>Topic</strong></label>
      <div class="form-group mb-3">
      <input class="form-control form-control-lg" type="text" name="Topic" v-model="topic"/>
      </div>
      <label><strong>Content</strong></label>
      <div class="form-group mb-3">
      <textarea class="form-control form-control-lg" type="text" name="Content" v-model="content"></textarea>
      </div>
      
      <div class="d-grid">
      <button class="btn btn-primary btn-lg btn-block">Sumit</button>
      </div>
    </form>
    <br>
    <h5 class="card-title">{{topic}}</h5>
    <p class="card-text">{{content}}</p>
    </div>
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
    
  }
</script>

<style lang="scss" scoped>

</style>