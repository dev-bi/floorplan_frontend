/*
 Weil es schnell gehen musste, habe ich den Code fast vollständig von
    https://matthiashager.com/converting-snake-case-to-camel-case-object-keys-with-javascript
 übernommen. Bei Gelegenheit mal analysieren :)
*/

// hier habe ich "-" rausgenommen, weil es nur von snake -> camel konvertieren soll.
const toCamel = (s) => s.replace(/([_][a-z])/ig, ($1) => $1.toUpperCase().replace('_', ''));

// eslint-disable-next-line
const isArray = function (a) {
  return Array.isArray(a);
};
// eslint-disable-next-line
const isObject = function (o) {
  return o === Object(o) && !isArray(o) && typeof o !== 'function';
};
// eslint-disable-next-line
const keysToCamel = function (o) {
  if (isObject(o)) {
    const n = {};

    Object.keys(o)
      .forEach((k) => {
        n[toCamel(k)] = keysToCamel(o[k]);
      });

    return n;
  }
  if (isArray(o)) {
    return o.map((i) => keysToCamel(i));
  }

  return o;
};

export default keysToCamel;
