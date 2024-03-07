<script setup>
import { store } from "../store.js";
import LiniaPoziom from "../components/LiniaPoziom.vue";
import LiniaPion from "../components/LiniaPion.vue";
//
</script>
//
<script>
export default {
  props: {
    p: { type: Number, default: 34 },
  },
  watch: {
    s1() {
      test();
    },
    s2() {
      test();
    },
  },
  methods: {
    test() {
      let product = store.products.find((el) => el.PRODUKTTYP == String(store.s1) + store.s2) || { WIDTH: 0 };
      store.product = product;
      // store.path='pat\68 ("'
      console.log(product.SSHEIGHT + store.skrot);
      store.path = 'pat\\68 ("M 0 0 L 0 ' + store.wysokoscSkrzydla + " l18 0 l0 -14.5 L54 " + store.wysokoscSkrzydla - 14.5 + ' L54 0 Z")';
      let rozmiar = (90 - parseInt(store.rozmiar)) * 10;
      store.skrotMax = 2400 - product.HEIGHT;
      // store.seria = product.PRODUKTTYP;
      // store.osc = store.profilRamy.filter((el) => el.serie.includes(store.seria))[0].oscieznica;
      if (store.s2 == 0) {
        store.skrotMax = 0;
      }

      if (store.skrot > 0 && store.s2 == 0) {
        // store.niestandard = false;
        store.skrot = 0;
      }
      // if (store.niestandard == false) {
      //   store.skrot = 0;
      // }
      let skrot = store.skrot;

      store.szerokoscDrzwi = product.WIDTH - rozmiar;
      store.szerokoscSkrzydla = product.SSWIDTH - rozmiar;
      store.p = product.WIDTH - product.SSWIDTH;
      store.wysokoscDrzwi = product.HEIGHT + skrot;
      store.wysokoscSkrzydla = product.SSHEIGHT + skrot;

      // szer
      var szer = store.szerokoscDrzwi;
      let oszer = 0;
      var wys = store.wysokoscDrzwi;
      if (["D1", "D2"].includes(store.typ)) {
        store.czego = "Drzwi";
      } else {
        store.czego = "Zestawu";
      }
      if (store.typ == "D1F") {
        if (store.dostawkaLewa) {
          szer += store.dostawkaSzer;
        }
        if (store.dostawkaPrawa) {
          szer += store.dostawkaSzer;
        }
      }
      if (store.typ == "D1N") {
        if (store.naswietleLewe) {
          szer += store.naswietleLeweSzer;
        }
        if (store.naswietlePrawe) {
          szer += store.naswietlePraweSzer;
        }
      }
      if (store.typ == "D2") {
        szer += store.rozmiarBierne;
      }
      store.szerokoscZestawu = szer;
      oszer = store.szerokoscZestawu + 2 * store.luz;
      if (store.s2 == 0 && store.osc == 9) {
        oszer -= 60;
      }

      store.szerokoscOtworu = oszer;

      // wys
      var wys = store.wysokoscDrzwi;
      let owys = 0;
      let luz = store.osc == 9 ? -20 : 10;
      if (store.typ == "D1N") {
        if (store.naswietleGorne) {
          wys += store.naswietleGorneWys;
        }
      }
      store.wysokoscZestawu = wys;
      store.wysokoscOtworu = wys + luz;
      // this.skaluj();
    },
  },
  mutations: {
    product() {
      // console.log(data);
    },
  },
};
</script>

<template>
  <div>
    <pre hidden>{{ test() }}</pre>
    <!-- <div :style="{ width: store.szerokoscDrzwi + 'px' }" class="drzwi"> -->
    <!-- <div :style="{ width: store.szerokoscDrzwi + 'px', height: store.product.HEIGHT + 'px' }" class="drzwi"> -->
    <div :style="{ height: store.product.HEIGHT + store.skrot + 'px', 'padding-left': store.p / 2 + 'px', 'padding-right': store.p / 2 + 'px' }" class="drzwi">
      <div class="prog"></div>
      <div :style="{ width: store.szerokoscSkrzydla + 'px', height: store.product.SSHEIGHT + store.skrot + 'px' }" class="skrzydlo">
        <div @tick="console.log('tick')" class="klamka"></div>
      </div>
      <div class="bierne bprawe" v-if="store.typ == 'D2'" :style="{ width: store.rozmiarBierne + 'px', height: store.product.SSHEIGHT + store.skrot + 'px' }"></div>

      <LiniaPoziom v-if="store.typ != 'D2'" :lineColor="store.typ == 'D1' ? 'green' : 'blue'" :wymiar="String(store.szerokoscDrzwi)" />

      <LiniaPion :lineColor="['D2', 'D1'].includes(store.typ) ? 'green' : 'blue'" :wymiar="String(store.wysokoscDrzwi)" v-if="store.typ == 'D1N' && store.naswietleGorne && !store.naswietleLewe" />
    </div>
  </div>
</template>

<style scoped>
.drzwi {
  position: relative;
  background: white;
  background-size: 2400px;
  display: flex;
  gap: 0.5px;
  justify-content: center;
  align-items: end;
  padding-left: 34px;
  padding-right: 34px;
  box-shadow: 0px 0px 5px rgb(0, 0, 0, 1);
  border: 1px solid;
  position: relative;
}
.drzwi .skrzydlo {
  /* width: 957px;
  height: 2032px; */
  background: white;
  background-size: 2400px;
  box-shadow: 0 0 15px rgb(0, 0, 0, 0.75);
  border: 1px solid;
  display: block;
  /* bottom: -3.8px; */
  position: relative;
  bottom: 12px;
  background-position: right;
  display: flex;
  /* left: 3.4px; */
  flex-direction: column;
  justify-content: end;
  /* left: 3.4px; */
}
.bierne {
  width: 600px;
  height: 2032px;
  background: white;
  background-size: 2400px;
  display: block;
  /* bottom: -3.8px; */
  position: relative;
  bottom: 12px;
  box-shadow: 0 0 15px rgb(0, 0, 0, 0.75);
  border: 1px solid;
  /* left: 3.4px; */
}
</style>
