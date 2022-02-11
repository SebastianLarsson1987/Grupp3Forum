<template>
  <div>
    <h4>Tryck på en användare för att se vilka trådar användaren har skapat</h4>
    <div v-for="item in threads" :key="item.id">
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

    },
    computed: {
      threads(){
        return this.$store.state.threadsByUser
      }
    }
  }
</script>

<style lang="scss" scoped>

</style>