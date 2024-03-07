<script setup>
import { store } from "../store.js";
import LiniaPion from "../components/LiniaPion.vue";
//
</script>
//
<script>
export default {
  props: {
    szer: { type: Number, default: 500 },
  },
  data() {
    return {
      serie: [
        { PRODUKTTYP: 10, SERIA: "Normal", WIDTH: 1008, HEIGHT: 2070, SHEIGHT: 2018, SWIDTH: 927, SSWIDTH: 957, SSHEIGHT: 2032 },
        { PRODUKTTYP: 20, SERIA: "Premium", WIDTH: 1008, HEIGHT: 2070, SHEIGHT: 2018, SWIDTH: 927, SSWIDTH: 957, SSHEIGHT: 2032 },
        { PRODUKTTYP: 21, SERIA: "Premium Termo", WIDTH: 1025, HEIGHT: 2080, SHEIGHT: 2018, SWIDTH: 927, SSWIDTH: 957, SSHEIGHT: 2032 },
        { PRODUKTTYP: 22, SERIA: "Premium Aluminiowo - Kompozytowa", WIDTH: 1008, HEIGHT: 2070, SHEIGHT: 2018, SWIDTH: 927, SSWIDTH: 957, SSHEIGHT: 2032 },
        { PRODUKTTYP: 30, SERIA: "Optimum", WIDTH: 1034, HEIGHT: 2087, SHEIGHT: 2018, SWIDTH: 951, SSWIDTH: 981, SSHEIGHT: 2047.5 },
        { PRODUKTTYP: 31, SERIA: "Optimum Termo", WIDTH: 1061, HEIGHT: 2100, SHEIGHT: 2018, SWIDTH: 951, SSWIDTH: 981, SSHEIGHT: 2047.5 },
        { PRODUKTTYP: 32, SERIA: "Optimum Aluminiowo - Kompozytowa", WIDTH: 1034, HEIGHT: 2087, SHEIGHT: 2018, SWIDTH: 951, SSWIDTH: 981, SSHEIGHT: 2047.5 },
        { PRODUKTTYP: 41, SERIA: "Termo Prestige Lux", WIDTH: 1083, HEIGHT: 2100, SHEIGHT: 2015, SWIDTH: 968, SSWIDTH: 1004, SSHEIGHT: 2056 },
        { PRODUKTTYP: 60, SERIA: "Akustyczne", WIDTH: 1023, HEIGHT: 2072, SHEIGHT: 2018, SWIDTH: 927, SSWIDTH: 972.5, SSHEIGHT: 2034.5 },
        { PRODUKTTYP: 65, SERIA: "Akustyczne + Antywłamaniowe", WIDTH: 1023, HEIGHT: 2072, SHEIGHT: 2018, SWIDTH: 927, SSWIDTH: 957, SSHEIGHT: 2032 },
        { PRODUKTTYP: 70, SERIA: "Przeciwpożarowe + Akustyczne", WIDTH: 1023, HEIGHT: 2072, SHEIGHT: 2018, SWIDTH: 927, SSWIDTH: 957, SSHEIGHT: 2032 },
        { PRODUKTTYP: 75, SERIA: "Przeciwpożarowe + Akustyczne + Antywłamaniowe", WIDTH: 1023, HEIGHT: 2072, SHEIGHT: 2018, SWIDTH: 927, SSWIDTH: 957, SSHEIGHT: 2032 },
        { PRODUKTTYP: 661, SERIA: "Alu Hybrid", WIDTH: 1114, HEIGHT: 2100, SHEIGHT: 2005, SWIDTH: 978, SSWIDTH: 980, SSHEIGHT: 2028.5 },
      ],
    };
  },
  state: {
    ja: "ty",
  },
  created() {},
};
</script>

<template>
  <div :style="{ height: szer + 'px' }" class="naswietle">
    <div class="szyba"></div>
    <LiniaPion :lineColor="'blue'" :wymiar="String(szer)" />
  </div>
</template>

<style scoped>
.naswietle {
  position: relative;
  background: white;
  /* background-size: 2400px; */
  width: 100%;
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
