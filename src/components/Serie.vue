<script setup>
import { store } from "../store.js";
//
</script>
//
<script>
export default {
  methods: {
    serieFilter() {
      let product = store.serie.filter((el) => el.typy.includes(store.typ));
      store.s2 = parseInt(store.oscieznice.find((el) => el.serie.includes(parseInt(store.s1)) && el.typy.includes(store.typ)).oscieznica);
      store.gruboscSkrzydla = parseInt(store.serie.find((el) => el.seria == store.s1).grubosc);
      return product;
    },
  },
};
</script>

<template>
  <div>
    <label>Skrzydło</label>
    <select title="Linia (Grubość skrzydła)" class="custom-select" id="osc" name="osc" v-model.number="store.s1">
      <option :value="item.seria" v-for="item in serieFilter()" :key="item.seria">{{ item.opis }} ({{ item.grubosc }}mm)</option>
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
