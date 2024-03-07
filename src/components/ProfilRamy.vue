<script setup>
import { store } from "../store.js";
//
</script>
//
<script>
export default {
  methods: {
    osciezniceFilter() {
      store.gruboscOscieznicy = parseInt(store.profilRamy.find((el) => el.oscieznica == store.osc).grubosc);
      return store.profilRamy.filter((el) => el.serie.includes(store.seria)) || store.profilRamy;
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
    <label>Profil Ramy</label>
    <!-- <pre>{{ this.osciezniceFilter() }}</pre> -->
    <select title="Nr profilu (Grubość ościeżnicy)" class="custom-select" id="osc" name="osc" v-model="store.osc">
      <option :value="osc.oscieznica" v-for="osc in osciezniceFilter()" :key="'Profil' + osc.oscieznica">{{ osc.opis }} ({{ osc.grubosc }}mm)</option>
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
