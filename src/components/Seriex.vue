<script setup>
import { store } from "../store.js";
//
</script>
//
<script>
export default {
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
  <section class="D1 D2 D1N D1F row mb-3">
    <div class="form-check col-md-3 col-6 mb-3" v-for="seria in serie" :key="seria.PRODUKTTYP">
      <input class="form-check-input" type="radio" :id="seria.PRODUKTTYP" :value="seria.PRODUKTTYP" v-model="store.seria" />
      <label class="form-check-label w-100 text-center" :for="seria.PRODUKTTYP">
        <div>
          <img class="img img-fluid" :src="`../src/assets/images/` + seria.PRODUKTTYP + `.jpg`" alt="" />
        </div>
        <span>{{ seria.SERIA }}</span>
      </label>
    </div>
  </section>
</template>

<style scoped>
h1 {
  font-weight: 500;
  font-size: 2.6rem;
  position: relative;
  top: -10px;
}

h3 {
  font-size: 1.2rem;
}

.greetings h1,
.greetings h3 {
  text-align: center;
}

@media (min-width: 1024px) {
  .greetings h1,
  .greetings h3 {
    text-align: left;
  }
}
</style>
