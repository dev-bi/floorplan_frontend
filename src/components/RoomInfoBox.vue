<template>
<div class="infobox">
  <div class="infobox__head-data">
    <h2>R-303 - Büro</h2>
    <h3>Frau Gallehr</h3>
    <h3>Herr Sigmund</h3>
  </div>
  <slot></slot>
</div>
</template>

<script>
import BaseController from '@/classes/BaseController';
import Room from '@/classes/Room';
// import Person from '@/classes/Person';

export default {
  name: 'RoominfoBox',
  props: {
    uniqueId: String,
  },
  watch: {
    uniqueId(newVal, oldVal) {
      console.log(`ROOMINFO: Value changed from ${oldVal} to ${newVal}`);
      // this.setSvgString(newVal);
    },
  },
  computed: {
    getRoomIdString() {
      return this.uniqueSVGId;
    },
  },
  data() {
    return {
      roominfo: Room,
    };
  },
  methods: {
    getRoomData() {
      const bc = new BaseController();
      fetch(`${bc.apiBaseUrl}/floorplan/room/${this.getRoomIdString}`)
        .then((roomInfoResponse) => roomInfoResponse.json())
        .then((roomInfoData) => {
          console.log(roomInfoData);
        });
    },
  },
};
</script>

<style lang="scss" scoped>
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

.infobox {
  border: solid 1px #ccc;
  width: 350px;
  margin: 0 auto;
}
</style>
