<template>
<div>
  <h2>Hier die SVG laden</h2>
  <h3>{{ svgId }}</h3>
  <div v-html="svgString"></div>
</div>
</template>

<script>
import BaseController from '@/classes/BaseController';

export default {
  name: 'OutputController',
  props: {
    svgId: {
      String,
    },
  },
  watch: {
    svgId(newVal, oldVal) {
      console.log(`Value changed from ${oldVal} to ${newVal}`);
      this.setSvgString(newVal);
    },
  },
  data() {
    return {
      svgString: '',
    };
  },
  computed: {
    getSVGId() {
      return this.svgId;
    },
  },
  methods: {
    setSvgString(svgId) {
      const appController = new BaseController();
      if (svgId === '') return;

      fetch(`${appController.apiBaseUrl}/floorplan/svg/${svgId}`)
        .then((svgResponse) => svgResponse.text())
        .then((svgData) => {
          this.svgString = svgData;
          console.log(this.svgString);
        });
    },
  },
};
</script>
