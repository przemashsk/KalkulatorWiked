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
      let rozmiar = store.rozmiar;
      if (store.s1 == 4) {
        rozmiary = rozmiary.filter((el) => el.rozmiar != 100);
        // store.rozmiar = 90;
      }else if(store.s1 == 23) {
        rozmiary = rozmiary.filter((el) => el.rozmiar == 90);
        // store.rozmiar = 90;
      }
      
      if(!rozmiary.find((el)=>el.rozmiar == rozmiar)){
        console.log('Nie znaleziono')
        store.rozmiar = 90;
      }
      return rozmiary;
    },
  },
  watch: {
    "store.s1"(a,b) {
      console.log("S1 changed");
      console.log(a);
      console.log(b);
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
