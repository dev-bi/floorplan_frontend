export default class Room {
  constructor(
    {
      id,
      roomFunction,
      name,
      nickname,
      description,
      svgUniqueName,
      floorId,
    },
    persons = [],
  ) {
    Object.assign(this, {
      id,
      roomFunction,
      name,
      nickname,
      description,
      svgUniqueName,
      floorId,
    });
    if (Array.isArray(persons)) {
      this.persons = persons;
    }
  }
}
