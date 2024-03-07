<script setup>
import { store } from "../store.js";
//
</script>
//
<script>
export default {
  data() {
    return {
      typy: [
        { artnr: "D1", opis: "Drzwi jednoskrzydłowe" },
        { artnr: "D2", opis: "Drzwi dwuskrzydłowe" },
        { artnr: "D1N", opis: "Drzwi z naświetlem" },
        { artnr: "D1F", opis: "Drzwi z dostawką" },
      ],
    };
  },
  methods: {
    typyFilter() {
      // console.log("typki");
      // console.log(szer);
      // this.skaluj();
      // console.log(store.serie.filter((el) => el.typy.includes(store.typ))[0].seria);
      return this.typy;
    },
  },
  watch: {
    "store.typ"() {},
  },
};
</script>

<template>
  <section class="row">
    <div class="col-xl-3 col-6 mb-3" v-for="typ in typyFilter()" :key="typ.artnr">
      <input class="form-check-input" type="radio" :id="typ.artnr" :value="typ.artnr" v-model="store.typ" :checked="store.typ == typ.artnr" />
      <label class="form-check-label w-100 text-center" :for="typ.artnr">
        <div>
          <img class="img img-fluid" :src="`../images/` + typ.artnr + `.png`" alt="" />
          <!-- <img class="img img-fluid" :src="`asset(assets/images/)` + typ.artnr + `.png`" alt="" /> -->
        </div>
        <span>{{ typ.opis }}</span>
      </label>
    </div>
  </section>
</template>
