<template>
<div>
  <!--<h2>Hier die SVG laden</h2>-->
  <!--<h3>{{ svgId }}</h3>-->
  <div v-html="svgString" @mouseover="selectRoom" @mouseout="unselectRoom"></div>
</div>
</template>

<script>
import BaseController from '@/classes/BaseController';

export default {
  name: 'OutputController',
  props: {
    svgId: {
      String,
    },
  },
  mounted() {
    console.log('Hier die SVG initialisieren ...');
    this.setSvgString(this.svgId);
  },
  watch: {
    /* Wenn sich die svgId ändert, erfährt diese Watchfunktion das */
    svgId(newVal, oldVal) {
      console.log(`Value changed from ${oldVal} to ${newVal}`);
      this.setSvgString(newVal);
    },
  },
  data() {
    return {
      /* SVG als String, wird durch v-html gerendert */
      svgString: '',
      uniqueSVGId: '',
    };
  },
  computed: {
    getSVGId() {
      return this.svgId;
    },
  },
  methods: {
    selectRoom(event) {
      const mouseOverRoomEvent = event;

      if (mouseOverRoomEvent.target.className.baseVal === 'room') {
        // console.log(mouseOverRoomEvent.target.id);

        /* eindeutige RaumID setzen und per $emit an RoomController schicken */
        this.uniqueSVGId = mouseOverRoomEvent.target.id;
        console.log('emit method!');
        this.$emit('roomSelected', this.uniqueSVGId);

        mouseOverRoomEvent.target.style.fill = 'rgb(0, 255, 0)';
      }
    },
    unselectRoom(event) {
      const mouseOutRoomEvent = event;

      if (mouseOutRoomEvent.target.className.baseVal === 'room') {
        mouseOutRoomEvent.target.style.fill = 'rgb(255, 255, 255)';
      }
    },
    loadRoomData(floorId) {
      /* fetch all the room data by current floorID */
      console.log(floorId);
    },
    setSvgString(svgId) {
      const appController = new BaseController();
      if (svgId === '') return;

      fetch(`${appController.apiBaseUrl}/floorplan/svg/${svgId}`)
        .then((svgResponse) => svgResponse.text())
        .then((svgData) => {
          this.svgString = svgData;
          console.log(this.svgString);
        });
    },
  },
};
</script>
