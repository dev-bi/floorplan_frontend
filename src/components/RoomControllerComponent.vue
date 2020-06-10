<template>
  <div class="hello">
    <h1>Room Controller Komponente</h1>
    <FloorNavigator></FloorNavigator>
  </div>
</template>

<script>
import FloorNavigator from '@/components/FloorNavigator.vue';

export default {
  name: 'RoomControllerComponent',
  components: {
    FloorNavigator,
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
