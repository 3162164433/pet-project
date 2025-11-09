<template>
  <div style="overflow-y:hidden;overflow-x: hidden">
    <router-view />
<!--    头部-->

  </div>

</template>

<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }
  
  body,
  html {
    background-color: #f0f9ff;
    min-height: 100vh;
    width: 100%;
    overflow-x: hidden;
  }
  
  #app {
    background-color: #f0f9ff;
    min-height: 100vh;
    width: 100%;
  }
</style>
<script>


  export default {
    name:"App",

  }
</script>