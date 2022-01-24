<template>
<div>
<ul>
  <li>
    <div ref="">
    <a class="overview-button hover:underline" @click="scrollPageTo('')"></a>
    </div>
  </li>
  <li>
    <div ref="amenities">
      <a class="amenities-button text-green-500 hover:text-green-800 hover:underline" @click="scrollPageTo('amenities')">Amenities</a>
  </div>
  </li>
  <li>
<div ref="extras">
    <a class="rooms-button text-green-500 hover:text-green-800 hover:underline" @click="scrollPageTo('')">Extras</a>
    </div>  
    </li>
</ul>
</div>
</template>

<script>

export default{
    methods: {

  scrollPageTo(refName) {
    
    var element = this.$refs[refName];
    var top = element.offsetTop;

    window.scrollTo(0, top);
  }
 }
}
</script>
