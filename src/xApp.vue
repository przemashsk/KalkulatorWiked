<script setup>
import Typy from "./components/Typy.vue";
import C from "./components/C.vue";
// import Serie from "./components/Seriex.vue";
import Drzwi from "./components/Drzwi.vue";
import Dostawka from "./components/Dostawka.vue";
import Naswietle from "./components/Naswietle.vue";
import NaswietleG from "./components/NaswietleG.vue";
import Serie from "./components/Serie.vue";
import Oscieznice from "./components/Oscieznice.vue";
import Rozmiary from "./components/Rozmiary.vue";
import { store } from "./store.js";
</script>

<template>
  <nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand" href="#">
      <img src="/images/Wiked_LOGO_KONTRA_RGB.png" height="60" class="d-inline-block align-top" alt="" />
    </a>
    <h1 class="text-light mr-auto mb-0">Kalkulator wymiarów drzwi zewnętrznych</h1>
  </nav>
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-6 p-3 opcje">
        <h4>Wybierz produkt</h4>
        <!-- <Typy /> -->

        <h4>Technologia</h4>
        <div class="row">
          <div class="col-sm-6 col-md-3 mb-3">
            <!-- <Serie /> -->
          </div>
          <div class="col-sm-6 col-md-3 mb-3">
            <!-- <Oscieznice /> -->
          </div>
          <div class="col-sm-6 col-md-3 mb-3">
            <!-- <Rozmiary /> -->
          </div>
          <div class="col-sm-6 col-md-3 mb-3" v-if="store.typ == 'D2'">
            <label>Rozmiar skrzydła biernego</label>
            <select class="custom-select" v-model.number="store.rozmiarBierne">
              <option value="300">30</option>
              <option value="400">40</option>
              <option value="500">50</option>
              <option value="600" selected>60</option>
              <option value="700">70</option>
              <option value="800">80</option>
              <option value="900">90</option>
              <option value="1000">100</option>
            </select>
          </div>
          <div class="col-sm-6 col-md-3 mb-3" v-if="store.s2 == 0">
            <label>MODEL OŚCIEŻNICY</label>
            <select class="custom-select" v-model.number="store.osc">
              <option value="9">9</option>
              <option value="11">11</option>
            </select>
          </div>
        </div>
        <section v-if="store.typ == 'D1N'">
          <!-- <section class="D1N D2"> -->
          <h4>Naświetla</h4>
          <div class="row">
            <div class="col-md-4 mb-3">
              <input v-model="store.naswietleGorne" type="checkbox" id="naswietleg" :checked="store.naswietleGorne" hidden />
              <label for="naswietleg" class="d-flex flex-row justify-content-between"
                >Górne
                <input v-model="store.naswietleGorneWys" title="Szerokość naświetla lewego" type="number" class="number" id="naswietlelszer" min="300" max="800" step="10" />
              </label>
            </div>
            <div class="col-md-4 mb-3">
              <input v-model="store.naswietleLewe" type="checkbox" id="naswietlel" :checked="store.naswietleLewe" hidden />
              <label for="naswietlel" class="d-flex flex-row justify-content-between"
                >Lewe
                <input v-model="store.naswietleLeweSzer" title="Szerokość naświetla lewego" type="number" class="number" id="naswietlelszer" min="300" max="800" step="10" />
              </label>
            </div>
            <div class="col-md-4 mb-3">
              <input v-model="store.naswietlePrawe" type="checkbox" id="naswietlep" :checked="store.naswietlePrawe" hidden />
              <label for="naswietlep" class="d-flex flex-row justify-content-between"
                >Prawe
                <input v-model="store.naswietlePraweSzer" title="Szerokość naświetla Prawego" type="number" class="number" id="naswietlelszer" min="300" max="800" step="10" />
              </label>
            </div>
          </div>
        </section>
        <section v-if="store.typ == 'D1F'">
          <h4>Dostawki</h4>
          <div class="row align-items-end">
            <div class="col-md-4 mb-3">
              <input type="checkbox" id="dostawkal" hidden v-model="store.dostawkaLewa" :checked="store.dostawkaLewa" />
              <label for="dostawkal" class="d-flex justify-content-between">Lewa </label>
            </div>
            <div class="col-md-4 mb-3">
              <input type="checkbox" id="dostawkap" hidden v-model="store.dostawkaPrawa" :checked="store.dostawkaPrawa" />
              <label for="dostawkap" class="d-flex justify-content-between">Prawa </label>
            </div>
            <div class="col-md-4 mb-3">
              <div class="form-group" id="dostawkapw">
                <label>Rozmiar dostawek ({{ store.dostawkaSzer / 10 }}) </label>
                <!-- <input type="range" class="form-control-range" id="dostawkapszer" min="300" max="600" step="100" v-model="store.dostawkaSzer" /> -->
                <select class="custom-select" id="rozmiard" name="rozmiard" v-model.number="store.dostawkaSzer">
                  <option value="300">30</option>
                  <option value="400">40</option>
                  <option value="500">50</option>
                  <option value="600" selected>60</option>
                </select>
              </div>
            </div>
          </div>
        </section>
        <!-- <img id="img9" class="mb-3" src="./Ościeżnica 9.jpg" alt="" height="450">
                <img id="img11" class="mb-3" src="./Reszta ościeżnic.jpg" alt="" height="450"> -->
        <h4>Parametry produktu</h4>
        <div class="row">
          <div class="col-sm-6 mb-3">
            <label class="red" for="szer"
              >Szerokość Otworu <span>S<C :litera="`O`" /></span
            ></label>
            <div class="input-group">
              <input type="text" class="form-control" id="OWIDTH" readonly v-model="store.szerokoscOtworu" />
              <div class="input-group-append">
                <span class="input-group-text" id="basic-addon2">mm</span>
              </div>
            </div>
          </div>
          <div class="col-sm-6 mb-3">
            <label class="red" for="wys"
              >Wysokość Otworu <span>H<C :litera="`O`" /></span
            ></label>
            <div class="input-group">
              <input type="text" class="form-control" id="OHEIGHT" readonly v-model="store.wysokoscOtworu" />
              <div class="input-group-append">
                <span class="input-group-text" id="basic-addon2">mm</span>
              </div>
            </div>
          </div>
        </div>
        <div class="row align-items-end">
          <div class="col-sm-6 mb-3">
            <label class="green" for="szer">Całkowita Szerokość {{ store.typ == "D1" ? "Drzwi" : "Zestawu" }}</label>
            <div class="input-group">
              <!-- <input type="text" class="form-control" readonly v-model="store.szerokoscZestawu" /> -->
              <input type="text" class="form-control" readonly :value="this.szerZes()" />
              <!-- <span hidden>{{ szerZes() }}</span> -->
              <div class="input-group-append">
                <span class="input-group-text" id="basic-addon2">mm</span>
              </div>
            </div>
          </div>
          <div class="col-sm-6 mb-3">
            <label class="green" for="wys">Całkowita Wysokość {{ store.typ == "D1" ? "Drzwi" : "Zestawu" }}</label>
            <div class="input-group">
              <input type="text" class="form-control" id="HC2" readonly v-model="store.wysokoscZestawu" />
              <!-- <input type="text" class="form-control" id="HC2" readonly :value="this.wysZes()" /> -->
              <!-- <span hidden>{{ wysZes() }}</span> -->
              <div class="input-group-append">
                <span class="input-group-text" id="basic-addon2">mm</span>
              </div>
              <!-- <button type="submit">s</button> -->
            </div>
          </div>
        </div>
        <section v-if="store.s2 == 1">
          <h4>Skrót / Przewyższenie</h4>
          <div class="row">
            <div class="col-md-6 mb-3">
              <input type="checkbox" id="skrinput" hidden v-model="store.niestandard" :checked="store.niestandard" />
              <label for="skrinput" class="d-flex flex-row justify-content-between">
                <span v-if="store.skrot == 0">Niestandardowa wysokość</span>
                <span v-else>{{ store.skrot < 0 ? "Skrót" : "Podwyższenie" }}</span>
                <input data-bs-toggle="tooltip" title="rfghj" class="number" type="number" id="skr" min="-100" max="300" step="10" v-model="store.skrot" />
              </label>
            </div>
          </div>
        </section>
        <div class="alert alert-success">JEST TO WSTĘPNY POMIAR - SKONTAKTUJ SIĘ Z WYBRANYM <a href="https://wiked.pl/gdzie-kupic/" target="_blank">SALONEM SPRZEDAŻY</a>, ABY UMÓWIĆ DOKŁADNY POMIAR OTWORU I DOKONAĆ PROFESJONALNEGO MONTAŻU</div>
      </div>
      <div class="col-lg-6 d-flex flex-column">
        <div class="p-5 scianka">
          <div class="sciana">
            <div class="otwor">
              <div class="line-top">
                <div class="arrow-left"></div>
                <div class="line"></div>
                <span class="text red"
                  >Szerokość otworu SO (<span class="text" id="OWIDTHTEXT">{{ store.szerokoscOtworu }}</span
                  >)</span
                >
                <div class="line"></div>
                <div class="arrow-right"></div>
              </div>
              <div class="line-left">
                <div class="arrow-top"></div>
                <div class="line2"></div>
                <span class="text tb red"
                  >Wysokość otworu HO(<span class="text" id="OHEIGHTTEXT">{{ store.wysokoscOtworu }}</span
                  >)</span
                >
                <div class="line2"></div>
                <div class="arrow-bottom"></div>
              </div>
              <div class="zestaw" :style="{ width: store.szerokoscZestawu + 'px', height: store.wysokoscZestawu + 'px' }">
                <!-- <div class="line-top">
                <div class="arrow-left"></div>
                <div class="line"></div>
                <span class="text green">SC (<span id="sc"></span>)</span>
                <div class="line"></div>
                <div class="arrow-right"></div>
              </div> -->
                <!-- <div class="line-left">
                <div class="arrow-top"></div>
                <div class="line2"></div>
                <span class="text tb green">HC (<span id="hc"></span>)</span>
                <div class="line2"></div>
                <div class="arrow-bottom"></div>
              </div> -->
                <div class="gora" v-if="store.typ == 'D1N'">
                  <NaswietleG :szer="store.naswietleGorneWys" v-if="(store.typ == 'D1N') & store.naswietleGorne" />
                </div>
                <div class="dol">
                  <div class="line-left">
                    <div class="arrow-top"></div>
                    <div class="line2"></div>
                    <span class="text tb green">{{ store.wysokoscDrzwi }}</span>
                    <div class="line2"></div>
                    <div class="arrow-bottom"></div>
                  </div>
                  <Naswietle :szer="store.naswietleLeweSzer" v-if="(store.typ == 'D1N') & store.naswietleLewe" />
                  <Dostawka :szer="store.dostawkaSzer" v-if="(store.typ == 'D1F') & store.dostawkaLewa" />
                  <Drzwi />
                  <Dostawka :szer="store.dostawkaSzer" v-if="(store.typ == 'D1F') & store.dostawkaPrawa" />
                  <Naswietle :szer="store.naswietlePraweSzer" v-if="(store.typ == 'D1N') & store.naswietlePrawe" />
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="mt-3 buttons px-3 d-flex justify-content-between">
          <a href="https://wiked.pl/technologia/" target="_blank" class="btn btn-success w-100">Technologia</a>
          <button type="button" class="btn btn-success w-100" data-toggle="modal" data-target="#sizing">Wymiarowanie</button>
        </div>
      </div>
    </div>
  </div>
</template>
<style scoped>
.dol {
  position: relative;
}
</style>
<script>
import $ from "jquery";
export default {
  computed: {
    typ() {
      return store.typ;
    },
    seria() {
      return store.s1;
    },
  },
  watch: {
    typ() {
      // console.log("store changed");
      // this.skaluj();
      // setTimeout(this.skaluj, 100);
      // store.s1 = store.serie.filter((el) => el.typy.includes(store.typ))[0].seria;
      // console.log(store.serie.filter((el) => el.typy.includes(store.typ))[0].seria);
      // console.log(this.szerZes());
    },
    seria() {
      // console.log("seria changed");
      // this.skaluj();
    },
  },
  methods: {
    szerZes() {
      var szer = store.szerokoscDrzwi;
      let oszer = 0;
      var wys = store.wysokoscDrzwi;
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
      this.skaluj();
      setTimeout(this.skaluj, 600);
      return szer;
    },
    wysZes() {
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
      this.skaluj();
      setTimeout(this.skaluj, 600);
      return wys;
    },
    dopasuj() {
      setTimeout(this.skaluj, 600);
    },
    dopasuj2() {
      var sciana_w = $(".otwor")[0].getBoundingClientRect().width;
      $(".sciana").width(sciana_w);
      var sciana_h = $(".otwor")[0].getBoundingClientRect().height;
      $(".sciana").height(sciana_h);
    },
    skaluj() {
      let bh = $("body").height();
      let bw = $("body").width();
      let oh = $(".otwor").height() - 50;
      let ow = $(".otwor").width() - 50;
      let scale = 1;
      if (bw > bh) {
        // desktop
        // console.log('desktop')
        // if (oh > ow) {
        scale = (bh - 260) / oh;
        // } else {
        //   scale = (bw / 2 - 240) / ow;
        // }
      } else {
        // mobile
        // console.log('mobile')
        // if ((bh / bw) < (oh / ow)) {
        //     scale = (bh - 354) / oh
        // } else {
        scale = (bw - 150) / ow;
        // }
      }
      $(".otwor").css("transform", "scale(" + scale + ")");
      setTimeout(this.dopasuj2, 500);
    },
  },
  mounted() {
    // console.log("created");
    // console.log($("body"));
    // this.skaluj();
    // setTimeout(this.skaluj, 600);
  },
  // watch: {
  //   store() {
  //     console.log("rty");
  //   },
  // },
};
</script>
