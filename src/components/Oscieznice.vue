<script setup>
import { store } from "../store.js";
//
</script>
//
<script>
export default {
  methods: {
    osciezniceFilter() {
      return store.oscieznice.filter((el) => el.serie.includes(parseInt(store.s1)) && el.typy.includes(store.typ));
    },
  },
  watch: {
    "store.s1"() {
      console.log("S1 changed");
      this.osciezniceFilter();
    },
  },
};
</script>

<template>
  <div>
    <label>Ościeżnica</label>
    <!-- <pre>{{ this.osciezniceFilter() }}</pre> -->
    <select title="Mateiał wykonania ościeżnicy" class="custom-select" id="osc" name="osc" v-model.number="store.s2">
      <option :value="osc.oscieznica" v-for="osc in osciezniceFilter()" :key="osc.oscieznica">{{ osc.opis }}</option>
    </select>
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
}

.szyba {
  width: 100%;
  height: 100%;
  display: block;
  /* background-image: url(../images/./naswietla/w.jpg); */
  box-shadow: inset 0 0 50px rgb(0, 0, 0, 0.5);
}
</style>
