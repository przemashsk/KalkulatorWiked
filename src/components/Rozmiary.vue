<script setup>
import { store } from "../store.js";
//
</script>
//
<script>
export default {
  methods: {
    rozmiaryFilter() {
      let rozmiary = store.rozmiary;
      if (store.s1 == 4) {
        rozmiary = rozmiary.filter((el) => el.rozmiar != 100);
        // store.rozmiar = 90;
      }
      return rozmiary;
    },
  },
  watch: {
    "store.s1"() {
      console.log("S1 changed");
      this.rozmiaryFilter();
    },
  },
};
</script>

<template>
  <div>
    <label>Szerokość drzwi</label>
    <select class="custom-select" v-model="store.rozmiar">
      <option v-for="item in rozmiaryFilter()" :value="item.rozmiar" :key="item.rozmiar">{{ item.opis }} ({{ store.product.WIDTH - (90 - item.rozmiar) * 10 }}mm)</option>
    </select>
  </div>
</template>
