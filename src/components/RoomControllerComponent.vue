<template>
  <div class="hello">
    <h1>Room Controller Komponente</h1>
    <FloorNavigator v-on:stateChanged="initSVGAndFloor"></FloorNavigator>
    <RoominfoBox :room="currentRoom">
    </RoominfoBox>
    <OutputController
      v-on:roomSelected="setRoomInfo"
      v-bind:svgId="svg">
    </OutputController>
  </div>
</template>

<script>
import BaseController from '@/classes/BaseController';
import FloorNavigator from '@/components/FloorNavigator.vue';
import OutputController from '@/components/OutputController.vue';
import RoominfoBox from '@/components/RoominfoBox.vue';
import Person from '@/classes/Person';
import Room from '@/classes/Room';
import keysToCamel from '@/helpers/snaketocamel';

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
      uniqueSVGId: '',
      currentRoom: null,
      floorId: 0,
      rooms: {},
    };
  },
  computed: {
    svg() {
      return this.svgId;
    },
  },
  methods: {
    initSVGAndFloor(svgId, floorId) {
      console.log(`load: ${svgId} AND set floorId: ${floorId}`);
      this.svgId = svgId;
      // INIT CURRENT ROOM DATA
      if (this.floorId !== floorId) {
        this.floorId = floorId;
        this.rooms = {};
        this.loadRoomData(floorId);
      }
    },
    setRoomInfo(uniqueSVGId) {
      console.log(`load Room: ${uniqueSVGId}`);
      this.currentRoom = this.rooms[uniqueSVGId];
      console.log(this.currentRoom);
    },
    loadRoomData(floorId) {
      const bc = new BaseController();
      fetch(`${bc.apiBaseUrl}/floorplan/rooms/${floorId}`)
        .then((roomsResponse) => roomsResponse.json())
        .then((roomsData) => {
          console.log(roomsData);

          roomsData.forEach((roomJson) => {
            fetch(`${bc.apiBaseUrl}/floorplan/room/${roomJson.id}/persons`)
              .then((personResponse) => personResponse.json())
              .then((personData) => {
                const persons = [];
                personData.forEach((p) => {
                  const person = new Person(keysToCamel(p));
                  console.log(person);
                  persons.push(person);
                });
                console.log('PUSH');
                const roomObj = new Room(keysToCamel(roomJson), persons);
                const roomKey = roomObj.svgUniqueName;
                this.rooms[roomKey] = roomObj;
                // this.rooms.push(new Room(keysToCamel(roomJson), persons));
              })
              .catch((e) => {
                console.log(e);
              });
          });
          console.log('Rooms: ... ');
          console.log(this.rooms);
        })
        .catch();
    },
    setCurrentRoom() {
      //
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
