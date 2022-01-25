<template>
  <div class="row d-flex justify-content-center">
    <div class="col-md-8 mt-5">
    <h5 class="card-header"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
  <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
</svg>
Create Thread</h5>
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