<template>
  <div class="hello">
    <h1>Room Controller Komponente</h1>
    <FloorNavigator v-on:stateChanged="loadSVG"></FloorNavigator>
    <RoominfoBox>
      <h1>Testinformationen</h1>
    </RoominfoBox>
    <OutputController v-bind:svgId="svg"></OutputController>
  </div>
</template>

<script>
import FloorNavigator from '@/components/FloorNavigator.vue';
import OutputController from '@/components/OutputController.vue';
import RoominfoBox from '@/components/RoominfoBox.vue';

export default {
  name: 'RoomControllerComponent',
  components: {
    FloorNavigator,
    OutputController,
    RoominfoBox,
  },
  data() {
    return {
      svgId: '',
    };
  },
  computed: {
    svg() {
      return this.svgId;
    },
  },
  methods: {
    loadSVG(svgId) {
      console.log(`load: ${svgId}`);
      this.svgId = svgId;
    },
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
