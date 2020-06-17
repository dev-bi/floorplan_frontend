<template>
<div class="infobox">
  <div class="infobox__head-data">
    <h2>R-303 - Büro</h2>
    <h3>Frau Gallehr</h3>
    <h3>Herr Sigmund</h3>
  </div>
  <slot></slot>
</div>
</template>

<style lang="scss" scoped>
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

.infobox {
  border: solid 1px #ccc;
  width: 350px;
  margin: 0 auto;
}
</style>
