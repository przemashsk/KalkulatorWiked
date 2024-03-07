<script setup>
import { store } from "../store.js";
import LiniaPoziom from "../components/LiniaPoziom.vue";
//
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
  <div class="dostawka dprawa" :style="{ width: szer + 'px', height: store.product.HEIGHT + store.skrot + 'px' }">
    <div class="prog"></div>
    <div class="skrzydlo" :style="{ height: store.product.SSHEIGHT + store.skrot + 'px' }"></div>
    <LiniaPoziom :lineColor="'blue'" :wymiar="String(szer)" />
  </div>
</template>

<style scoped>
.dostawka {
  position: relative;
  background: white;
  background-size: 2400px;
  display: flex;
  gap: 0.5px;
  /* width: 1630px;
            width: 1025px; */
  /* width: 100%; */
  justify-content: center;
  height: 2080px;
  align-items: end;
  padding-bottom: 10px;
  /* padding-left: 34px;
  padding-right: 34px; */
  box-shadow: 0px 0px 5px rgb(0, 0, 0, 1);
  position: relative;
}
.dostawka .skrzydlo {
  width: 432px;
  width: calc(100% - 68px);
  height: 2032px;
  background: white;
  background-size: 2400px;
  box-shadow: 0 0 15px rgb(0, 0, 0, 0.75);
  display: block;
  /* bottom: -3.8px; */
  position: relative;
  /* left: 3.4px; */
}
.prog {
  background: lightgray;
  height: 20px;
  width: calc(100% - 110px);
  position: absolute;
  left: 50%;
  bottom: 0;
  /* box-shadow: 0 0 5px black; */
  box-shadow: inset 1px 0 2px black;
  transform: translateX(-50%);
}
</style>
