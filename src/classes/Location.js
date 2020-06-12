export default class Location {
  constructor(id, description, floors) {
    this.id = id;
    this.description = description;
    this.floors = floors;
  }

  getFloor(index) {
    return this.floors[index];
  }
}
