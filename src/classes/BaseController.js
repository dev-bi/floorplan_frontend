export default class BaseController {
  /*
   * BaseController contains all environment data
   */
  constructor() {
    this.apiBaseUrl = this.envList.devHome;
    // this.apiBaseUrl = 'http://localhost/bi-kompass/bi-kompass-component-service/api';
  }

  envList = {
    devBI: 'http://localhost/bi-kompass-component-service/api',
    devHome: 'http://localhost/bi-kompass/bi-kompass-component-service/api',
  }
}
