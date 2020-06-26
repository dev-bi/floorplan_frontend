<template>
<div class="infobox">
  <div class="infobox__head-data">
    <div v-if="roominfo != null">
      <h2>{{ roominfo.name }} - {{ roominfo.roomFunction }}</h2>
      <h3>{{ roominfo.nickname }}</h3>
    <!-- for each person in roominfo.persons -->

      <h3 v-for="person in roominfo.persons" v-bind:key="person.id">
       {{ person.firstname }} {{ person.lastname }} ({{ person.personFunction }})
      </h3>
    </div>
  </div>
  <slot></slot>
</div>
</template>

<script>
import BaseController from '@/classes/BaseController';
import Room from '@/classes/Room';
import keysToCamel from '@/helpers/snaketocamel';
import Person from '@/classes/Person';

export default {
  name: 'RoominfoBox',
  props: {
    uniqueId: String,
  },
  watch: {
    uniqueId(newVal, oldVal) {
      console.log(`ROOMINFO: Value changed from ${oldVal} to ${newVal}`);
      this.getRoomData();
    },
  },
  computed: {
    getRoomIdString() {
      return this.uniqueId;
    },
  },
  data() {
    return {
      roominfo: null,
    };
  },
  methods: {
    getRoomData() {
      const bc = new BaseController();
      fetch(`${bc.apiBaseUrl}/floorplan/room/${this.getRoomIdString}`)
        .then((roomInfoResponse) => roomInfoResponse.json())
        .then((roomInfoData) => {
          console.log(roomInfoData);

          const roomId = roomInfoData[0].id;
          fetch(`${bc.apiBaseUrl}/floorplan/room/${roomId}/persons`)
            .then((personResponse) => personResponse.json())
            .then((personData) => {
              const persons = [];
              personData.forEach((p) => {
                const person = new Person(keysToCamel(p));
                console.log(person);
                persons.push(person);
              });
              this.roominfo = new Room(keysToCamel(roomInfoData[0]), persons);
              console.log(this.roominfo);
            })
            .catch((e) => {
              console.log(e);
            });
        })
        .catch((e) => {
          console.log(e);
        });
    },
    getPersonData(roomId) {
      const bc = new BaseController();
      fetch(`${bc.apiBaseUrl}/floorplan/room/${roomId}/persons`)
        .then((personResponse) => personResponse.json())
        .then((personData) => {
          const persons = [];
          personData.forEach((p) => {
            const person = new Person(keysToCamel(p));
            console.log(person);
            persons.push(person);
          });
          return persons;
        })
        .catch();
    },
    setRoomData() {
      // do something
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
