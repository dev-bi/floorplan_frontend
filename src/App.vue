<template>
  <div id="app">
    <RoomControllerComponent></RoomControllerComponent>
  </div>
</template>

<script>
import RoomControllerComponent from './components/RoomControllerComponent.vue';

export default {
  name: 'App',
  components: {
    RoomControllerComponent,
  },
};
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
