<template>
  <div>
    <h2>Navigator Komponente</h2>
    <div v-if="locations.length > 0">
      <select name="location" v-model="selectedLocation">
        <option
          v-for="location in locations"
          :key="location.id"
          :value="{
            id: location.id,
            description: location.description,
            floors: location.floors
          }"
        >
          {{ location.description }}
        </option>
      </select>
    </div>
    <div v-else>
      <p>Daten werden geladen ...</p>
    </div>
    <div>
      <h3>{{ selectedLocation }}</h3>
    </div>
    <button class="navigator-button">Stockwerk höher</button>
    <button class="navigator-button">Stockwerk tiefer</button>
    <div>
      <button @click="init">Init</button>
    </div>
  </div>
</template>

<script>
import Floor from '@/classes/Floor';
import Location from '@/classes/Location';
import BaseController from '@/classes/BaseController';

export default {
  name: 'FloorNavigator',
  data() {
    return {
      selectedLocation: {},
      currentFloor: 1,
      locations: [],
    };
  },
  methods: {
    init() {
      const bc = new BaseController();
      /* hole location und die dazugehörigen Raumpläne */
      fetch(`${bc.apiBaseUrl}/floorplan/locations`)
        .then((response) => response.json())
        .then((data) => {
          data.forEach((element) => {
            fetch(`${bc.apiBaseUrl}/floorplan/floors/${element.id}`)
              .then((responseFloors) => responseFloors.json())
              .then((dataFloors) => {
                const floorArray = [];

                dataFloors.forEach((floor) => {
                  floorArray.push(new Floor(floor.id, floor.svg_id, floor.level, floor.name));
                });

                this.locations.push(new Location(element.id, element.description, floorArray));
                if (Object.keys(this.selectedLocation).length === 0) {
                  this.selectedLocation = {
                    id: element.id,
                    description: element.description,
                    floors: floorArray,
                  };
                  console.log('IS EMPTY!');
                }
              });

            // this.locations.push(new Location(element.id, element.description));
          });
          console.log(this.locations);
        });
    },
  },
};
</script>

<style scoped lang="scss">
.navigator-button {
  font-size: 1em;
}
</style>
