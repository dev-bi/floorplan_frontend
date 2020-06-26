export default class Room {
  constructor(
    id,
    uniqueSVGId,
    roomName,
    roomNickname,
    roomFunction,
    description,
    personArray = [],
  ) {
    this.id = id;
    this.uniqueSVGId = uniqueSVGId;
    this.nickname = roomNickname;
    this.name = roomName;
    this.roomFunction = roomFunction;
    this.description = description;
    if (Array.isArray(personArray)) {
      this.persons = personArray;
    }
  }
}
