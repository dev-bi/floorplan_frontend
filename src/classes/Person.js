export default class Person {
  constructor({
    id,
    firstname,
    lastname,
    personFunction,
    phone,
  }) {
    Object.assign(this, {
      id,
      firstname,
      lastname,
      personFunction,
      phone,
    });
  }
}
