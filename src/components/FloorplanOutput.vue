<template>
<div>
  <h2>Hier die SVG laden</h2>
  <h3>{{ svgId }}</h3>
</div>
</template>

<script>
export default {
  name: 'FloorplanOutput',
  props: {
    svgId: {
      String,
    },
  },
  data() {
    return {
      muh: 'muh macht die Kuh',
      svgString: '',
    };
  },
};
</script>
