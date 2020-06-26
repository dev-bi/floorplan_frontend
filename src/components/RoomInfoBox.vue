<template>
<div class="infobox">
  <div class="infobox__head-data">
    <div v-if="room !== null">
      <h2>{{ room.name }} - {{ room.roomFunction }}</h2>
      <h3>{{ room.nickname }}</h3>
    <!-- for each person in roominfo.persons -->

      <h3 v-for="person in room.persons" v-bind:key="person.id">
       {{ person.firstname }} {{ person.lastname }} ({{ person.personFunction }})
      </h3>
    </div>
  </div>
  <slot></slot>
</div>
</template>

<script>
import Room from '@/classes/Room';

export default {
  name: 'RoominfoBox',
  props: {
    room: Room,
  },
};
</script>
