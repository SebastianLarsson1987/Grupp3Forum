<template>
  <div v-if="disableWriteThread" class="row d-flex justify-content-center">
    <!-- <h1>Create Thread</h1> -->
    <div class="col-md-8 mt-5">
      <form @submit="submit">
        <div class="form-group mb-3">
          <label>Ämne</label>
          <input
            type="text"
            name="Topic"
            class="form-control form-control-lg"
            v-model="thread.topic"
          />
        </div>
        <div class="form-group mb-3">
          <label>Innehåll</label>
          <textarea
            type="text"
            class="form-control form-control-lg"
            name="Content"
            v-model="thread.content"
          ></textarea>
        </div>
        <!-- <div class="form-group mb-3">
          <select v-model="thread.categoryId">
            <option>Välj kategori</option>
            <option
              v-for="item in this.categories"
              :key="item.id"
              :value="item.id"
            >{{ item.categoryName }}</option>
          </select>
        </div> -->
        <div class="d-grid">
          <input type="submit" class="btn btn-primary" value="Skapa tråd"/>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import { auth } from "../../../assets/js/firebase"
//import router from "../../../router";
export default {
  data() {
    return {
      msg: "",
      thread: {
        "topic": "",
        "content": "",
        "createdAt": "",
        "updatedAt": "",
        "userId": "",
        "categoryId": 0
      },
      categories: [],
      disableWriteThread: false,
    }
  },
  methods: {

    async submit() {
      this.thread.userId = auth.currentUser.uid;
      this.thread.createdAt = Date.now().toString();
      this.thread.updatedAt = Date.now().toString();
      this.thread.categoryId = this.$route.params.id
      console.log("Thread: ", this.thread)
      await fetch("https://localhost:44362/api/Thread/CreateThread", {
        method: "POST",
        headers: {
          'Accept': 'application/json',
          'Content-Type': "application/json"
        },
        body: JSON.stringify(this.thread)

      });
      //router.push("/")
    },

    onStateChanged(){
      auth.onAuthStateChanged(user => {
          if(user){
            this.disableWriteThread = true
          }
          else {
            this.disableWriteThread = false
          }
      })
    }
  },
  async created() {
    await this.$store.dispatch('fetchCategories')
    this.categories = this.$store.state.categories
    this.onStateChanged();
  },
  computed: {
    // categories() {
    //   return this.$store.state.categories
    // }
  }
}
</script>

<style lang="scss" scoped>
</style>
