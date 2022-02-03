<template>
  <div>
    <h1>Sökresultat</h1>
    <div v-for="item in Result" :key="item.id">
      <p>{{item.topic}}</p>
      {{item}}

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

<style lang="scss" scoped>

</style>