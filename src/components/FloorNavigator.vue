<template>
  <div>
    <h2>Navigator Komponente</h2>
    <div v-if="locations.length > 0">
      <select name="location" @change="changeLocation" v-model="selectedLocation">
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
      <h2>Etage: {{ currentFloor }}</h2>
    </div>
    <button @click="levelDown" class="navigator-button">Stockwerk tiefer &#8595;</button>
    <button @click="levelUp" class="navigator-button">Stockwerk höher &#8593;</button>
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
      locations: [],
      currentFloorIndex: 0,
    };
  },
  computed: {
    currentSVGId() {
      if (this.selectedLocation.floors) {
        return this.selectedLocation.floors[this.currentFloorIndex].svgId;
      }
      return '';
    },
    currentFloor() {
      if (this.selectedLocation.floors) {
        return this.selectedLocation.floors[this.currentFloorIndex].name;
      }
      return 'noch nicht geladen';
    },
    numberOfFloors() {
      return this.selectedLocation.floors.length;
    },
  },
  updated() {
    if (this.currentSVGId === '') return;
    this.$emit('stateChanged', this.currentSVGId);
  },
  methods: {
    changeLocation() {
      this.currentFloorIndex = 0;
    },
    levelUp() {
      // verschiebe diese Methode in Floor.js
      if (this.currentFloorIndex < this.numberOfFloors - 1) {
        this.currentFloorIndex += 1;
      }
    },
    levelDown() {
      // verschiebe diese Methode in Floor.js
      if (this.currentFloorIndex > 0) {
        this.currentFloorIndex -= 1;
      }
    },
    init() {
      const appController = new BaseController();
      /* hole location und die dazugehörigen Raumpläne */
      fetch(`${appController.apiBaseUrl}/floorplan/locations`)
        .then((locationResponse) => locationResponse.json())
        .then((locationData) => {
          locationData.forEach((location) => {
            // find floors by LocationID
            fetch(`${appController.apiBaseUrl}/floorplan/floors/${location.id}`)
              .then((floorplanResponse) => floorplanResponse.json())
              .then((floorplanData) => {
                const floorArray = [];

                floorplanData.forEach((floor) => {
                  floorArray.push(new Floor(floor.id, floor.svg_id, floor.level, floor.name));
                });

                this.locations.push(
                  new Location(
                    location.id,
                    location.description,
                    floorArray,
                  ),
                );
                /* set first Location as selected */
                if (Object.keys(this.selectedLocation).length === 0) {
                  this.selectedLocation = {
                    id: location.id,
                    description: location.description,
                    floors: floorArray,
                  };
                  console.log('IS EMPTY!');
                }
              });

            // this.locations.push(new Location(location.id, location.description));
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
