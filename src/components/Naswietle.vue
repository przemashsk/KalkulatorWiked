<script setup>
import { store } from "../store.js";
import LiniaPoziom from "../components/LiniaPoziom.vue";
</script>
//
<script>
export default {
  props: {
    szer: { type: Number, default: 500 },
  },
};
</script>

<template>
  <div :style="{ width: szer + 'px' }" class="naswietle">
    <div class="szyba"></div>

    <LiniaPoziom :lineColor="'blue'" :wymiar="String(szer)" />
  </div>
</template>

<style scoped>
.naswietle {
  position: relative;
  background: white;
  /* background-size: 2400px; */
  width: 500px;
  /* height: 2080px; */
  display: block;
  padding: 45px;
  box-shadow: 0px 0px 5px rgb(0, 0, 0, 1);
  border: 1px solid;
}

.szyba {
  width: 100%;
  height: 100%;
  display: block;
  /* background-image: url(../images/./naswietla/w.jpg); */
  box-shadow: inset 0 0 50px rgb(0, 0, 0, 0.5);
  border: 1px solid;
}
</style>
