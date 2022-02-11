<template>
  <div>
    <h1>De 10 senast skapade trådarna</h1>
      <div v-for="item in threads.slice(-10)" :key="item.id">
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
    async created(){
      await this.loadThreads()
        
   },
    methods:{
      async loadThreads(){
        await this.$store.dispatch('fetchThreads')
      }
    },
    computed:{
      threads(){
        return this.$store.state.threadsFromBackend
      }
    }
  }
</script>

<style lang="scss" scoped>

</style>