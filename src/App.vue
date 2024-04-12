<script setup>
import HelloWorld from "./components/HelloWorld.vue";
import TheWelcome from "./components/TheWelcome.vue";
import Typy from "./components/Typy.vue";
import C from "./components/C.vue";
import LiniaPion from "./components/LiniaPion.vue";
import LiniaPoziom from "./components/LiniaPoziom.vue";
// import Serie from "./components/Seriex.vue";
import Drzwi from "./components/Drzwi.vue";
import Dostawka from "./components/Dostawka.vue";
import Naswietle from "./components/Naswietle.vue";
import NaswietleG from "./components/NaswietleG.vue";
import Serie from "./components/Serie.vue";
import Oscieznice from "./components/Oscieznice.vue";
import ProfilRamy from "./components/ProfilRamy.vue";
import Rozmiary from "./components/Rozmiary.vue";
import { store } from "./store.js";
</script>

<template>
  <!-- Modal -->
  <div class="modal fade" id="sizing" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Wymiarowanie</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="col-sm-12 mb-3">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner">
                <div class="carousel-item active" v-if="store.osc == '9'">
                  <h5 class="mb-3">Ościeżnica Stalowa 9</h5>
                  <img class="rzut d-block m-auto" src="/images/os9bok.jpg" />
                </div>
                <div class="carousel-item active" v-else-if="store.s1 == 66">
                  <h5 class="mb-3">Ościeżnica Alu Hybrid</h5>
                  <img class="rzut d-block m-auto" src="/images/osalubok.jpg" />
                </div>
                <div class="carousel-item active" v-else>
                  <h5 class="mb-3">Ościeżnica Termo, Aluminiowo-kompozytowa, Stalowa 11 i 12</h5>
                  <img class="rzut d-block m-auto" src="/images/ostermobok.jpg" />
                </div>
              </div>
              <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <!-- <span class="carousel-control-prev-icon" aria-hidden="true"></span> -->
                <i class="bi bi-arrow-left-circle-fill text-dark xl"></i>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <!-- <span class="carousel-control-next-icon" aria-hidden="true"></span> -->
                <i class="bi bi-arrow-right-circle-fill text-dark xl"></i>
                <span class="sr-only">Next</span>
              </a>
            </div>
          </div>
        </div>
        <div class="modal-footer" hidden>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Zamknij</button>
          <!-- <button type="button" class="btn btn-primary">Zamknij</button> -->
        </div>
      </div>
    </div>
  </div>
  <nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand" href="https://wiked.pl" target="_blank">
      <img src="/images/Wiked_LOGO_KONTRA_RGB.png" height="60" class="d-inline-block align-top" alt="" />
    </a>
    <h1 class="text-light mr-auto mb-0">Kalkulator wymiarów drzwi zewnętrznych</h1>
  </nav>
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-6 p-3 opcje">
        <h4>Wybierz produkt</h4>
        {{ store.osc }}
        {{ store.s1 }}
        {{ store.s2 }}
        {{ store.szerokoscOtworu }}
        <Typy />

        <h4>Technologia</h4>
        <div class="row">
          <div class="col-sm-6 col-md-4 mb-3"><Serie /></div>
          <div class="col-sm-6 col-md-4 mb-3">
            <Oscieznice />
          </div>
          <div class="col-sm-6 col-md-4 mb-3" v-if="store.s2 == 0 || 1 > 0"><ProfilRamy /></div>
          <div class="col-sm-6 col-md-4 mb-3">
            <Rozmiary />
          </div>
          <div class="col-sm-6 col-md-4 mb-3" v-if="store.osc == '11kat'">
            <label>Podkucie pod puszki</label>
            <select class="custom-select" v-model="store.podkucie">
              <option value="Nie" selected>Nie</option>
              <option value="Tak">Tak</option>
            </select>
          </div>
          <div class="col-sm-6 col-md-4 mb-3" v-if="store.typ == 'D2'">
            <label>Szerokość skrzydła biernego</label>
            <select class="custom-select" v-model.number="store.rozmiarBierne">
              <option value="300">300mm</option>
              <option value="400">400mm</option>
              <option value="500">500mm</option>
              <option value="600" selected>600mm</option>
              <option value="700">700mm</option>
              <option value="800">800mm</option>
              <option value="900">900mm</option>
              <option value="1000">1000mm</option>
            </select>
          </div>
        </div>
        <section v-show="store.typ == 'D1N'">
          <!-- <section class="D1N D2"> -->
          <h4>Naświetla</h4>
          <div class="row">
            <div class="col-md-4 mb-3">
              <input v-model="store.naswietleGorne" type="checkbox" id="naswietleg" :checked="store.naswietleGorne" hidden />
              <label for="naswietleg" class="d-flex flex-row justify-content-between"
                >Górne
                <input v-model.lazy="store.naswietleGorneWys" title="Wysokość naświetla górnego" type="number" class="number wys" id="naswietlelszer" step="10" :min="store.naswietleWysMin" :max="store.naswietleWysMax" @keypress.enter.prevent />
              </label>
            </div>
            <div class="col-md-4 mb-3">
              <input v-model="store.naswietleLewe" type="checkbox" id="naswietlel" :checked="store.naswietleLewe" hidden />
              <label for="naswietlel" class="d-flex flex-row justify-content-between"
                >Lewe
                <input v-model.lazy="store.naswietleLeweSzer" title="Szerokość naświetla lewego" type="number" class="number" id="naswietlelszer" step="10" :min="store.naswietleSzerMin" :max="store.naswietleSzerMax" @keypress.enter.prevent />
              </label>
            </div>
            <div class="col-md-4 mb-3">
              <input v-model="store.naswietlePrawe" type="checkbox" id="naswietlep" :checked="store.naswietlePrawe" hidden />
              <label for="naswietlep" class="d-flex flex-row justify-content-between"
                >Prawe
                <input v-model.lazy="store.naswietlePraweSzer" title="Szerokość naświetla Prawego" type="number" class="number" id="naswietlelszer" step="10" :min="store.naswietleSzerMin" :max="store.naswietleSzerMax" @keypress.enter.prevent />
              </label>
            </div>
          </div>
        </section>
        <section v-show="store.typ == 'D1F'">
          <h4>Dostawki</h4>
          <div class="row align-items-end">
            <div class="col-md-4 mb-3">
              <input type="checkbox" id="dostawkal" hidden v-model="store.dostawkaLewa" :checked="store.dostawkaLewa" />
              <label for="dostawkal" class="d-flex justify-content-between mb-0">Lewa </label>
            </div>
            <div class="col-md-4 mb-3">
              <input type="checkbox" id="dostawkap" hidden v-model="store.dostawkaPrawa" :checked="store.dostawkaPrawa" />
              <label for="dostawkap" class="d-flex justify-content-between mb-0">Prawa </label>
            </div>
            <div class="col-md-4 mb-3">
              <div class="form-group mb-0" id="dostawkapw">
                <!-- <label>Rozmiar dostawek ({{ store.dostawkaSzer / 10 }}) </label> -->
                <!-- <input type="range" class="form-control-range" id="dostawkapszer" min="300" max="600" step="100" v-model="store.dostawkaSzer" /> -->
                <select title="Wybierz rozmiar dostawek" class="custom-select" id="rozmiard" name="rozmiard" v-model.number="store.dostawkaSzer">
                  <option value="300">30 (300mm)</option>
                  <option value="400">40 (400mm)</option>
                  <option value="500">50 (500mm)</option>
                  <option value="600" selected>60 (600mm)</option>
                </select>
              </div>
            </div>
          </div>
        </section>
        <section>
          <h4>{{ store.s2 == 0 ? "Skrót" : "Skrót / Przewyższenie" }}</h4>
          <div class="row">
            <div class="col-md-6 mb-3">
              <input type="checkbox" id="skrinput" hidden v-model="store.niestandard" :checked="store.niestandard" />
              <label for="skrinput" class="d-flex flex-row justify-content-between">
                <span v-if="store.skrot == 0">Niestandardowa wysokość</span>
                <span v-else>{{ store.skrot < 0 ? "Skrót" : "Przewyższenie" }}</span>
                <input class="number wys" type="number" id="skr" step="10" v-model.lazy="store.skrot" :max="store.skrotMax" :min="store.skrotMin" @keypress.enter.prevent />
              </label>
              <!-- Skrót {{ store.skrot }} Max {{ store.skrotMax }} -->
            </div>
          </div>
        </section>
        <section>
          <h4>Parametry produktu</h4>
          <div class="row">
            <div class="col-sm-6 mb-3">
              <label class="red" for="szer"
                >Szerokość Otworu <span>S<C :litera="`O`" /></span
              ></label>
              <div class="input-group">
                <input type="text" class="form-control" id="OWIDTH" disabled v-model="store.szerokoscOtworu" />
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
                <input type="text" class="form-control" id="OHEIGHT" disabled v-model="store.wysokoscOtworu" />
                <div class="input-group-append">
                  <span class="input-group-text" id="basic-addon2">mm</span>
                </div>
              </div>
            </div>
          </div>
          <div class="row align-items-end">
            <div class="col-sm-6 mb-3">
              <!-- <label class="green" for="szer">Całkowita Szerokość <span class="zes">Ościeżnicy</span> <span>SC</span></label> -->
              <label class="green" for="szer">Całkowita Szerokość {{ store.czego }}</label>
              <div class="input-group">
                <input type="text" class="form-control" disabled v-model="store.szerokoscZestawu" />
                <div class="input-group-append">
                  <span class="input-group-text" id="basic-addon2">mm</span>
                </div>
              </div>
            </div>
            <div class="col-sm-6 mb-3">
              <label class="green" for="wys">Całkowita Wysokość {{ store.czego }}</label>
              <div class="input-group">
                <input type="text" class="form-control" id="HC2" disabled v-model="store.wysokoscZestawu" />
                <div class="input-group-append">
                  <span class="input-group-text" id="basic-addon2">mm</span>
                </div>
              </div>
            </div>
          </div>
        </section>

        <div class="alert alert-success">JEST TO WSTĘPNY POMIAR - SKONTAKTUJ SIĘ Z WYBRANYM <a href="https://wiked.pl/gdzie-kupic/" target="_blank">SALONEM SPRZEDAŻY</a>, ABY UMÓWIĆ DOKŁADNY POMIAR OTWORU I DOKONAĆ PROFESJONALNEGO MONTAŻU</div>
      </div>
      <div class="col-lg-6 d-flex flex-column">
        <div id="myDiv" class="p-5 scianka d-flex justify-content-center align-items-end">
          <div class="sciana">
            <div class="otwor">
              <LiniaPoziom :pod="store.podkucie" :osc="store.osc" :lineColor="'red'" :klasa="(store.osc == 9) & (store.s2 == 0) || store.osc == '11kat' ? 'osc9t' : ''" :wymiar="'Szerokość otworu SO(' + store.szerokoscOtworu + ')'" />
              <LiniaPion :lineColor="'red'" :klasa="(store.osc == 9) & (store.s2 == 0) || store.osc == '11kat' ? 'osc9l' : ''" :wymiar="'Wysokość otworu HO(' + store.wysokoscOtworu + ')'" />
              <div class="zestaw" :style="{ width: store.szerokoscZestawu + 'px', height: store.wysokoscZestawu + 'px' }">
                <LiniaPion v-if="store.typ == 'D1N' && store.naswietleGorne" style="right: 230px; left: unset" :lineColor="'green'" :wymiar="'Całkowita Wysokość ' + store.czego + ' (' + store.wysokoscZestawu + ')'" />
                <LiniaPoziom
                  v-if="(store.typ == 'D1N' && (store.naswietleLewe || store.naswietlePrawe)) || (store.typ == 'D1F' && (store.dostawkaLewa || store.dostawkaPrawa)) || store.typ == 'D2'"
                  style="top: 100px"
                  :lineColor="'green'"
                  :wymiar="'Całkowita Szerokość ' + store.czego + ' (' + store.szerokoscZestawu + ')'"
                />
                <div class="gora" v-if="store.typ == 'D1N'">
                  <NaswietleG :szer="store.naswietleGorneWys" v-if="(store.typ == 'D1N') & store.naswietleGorne" />
                </div>
                <div class="dol">
                  <LiniaPion :lineColor="['D2', 'D1', 'D1F'].includes(store.typ) || (store.typ == 'D1N') & !store.naswietleGorne ? 'green' : 'blue'" :wymiar="String(store.wysokoscDrzwi)" />
                  <Naswietle :szer="store.naswietleLeweSzer" v-if="(store.typ == 'D1N') & store.naswietleLewe" />
                  <Dostawka :szer="store.dostawkaSzer" v-if="(store.typ == 'D1F') & store.dostawkaLewa" />
                  <Drzwi />
                  <Dostawka :szer="store.dostawkaSzer" v-if="(store.typ == 'D1F') & store.dostawkaPrawa" />
                  <Naswietle :szer="store.naswietlePraweSzer" v-if="(store.typ == 'D1N') & store.naswietlePrawe" />
                </div>
                <!-- <svg xmlns="http://www.w3.org/2000/svg" :viewBox="'0 -' + store.wysokoscSkrzydla + ' ' + store.gruboscSkrzydla + ' ' + store.wysokoscSkrzydla + ''">
                  <path :d="'M 0 0 L 0 -' + store.wysokoscSkrzydla + ' l18 0 l0 14.5 L' + store.gruboscSkrzydla + ' -' + (store.wysokoscSkrzydla - 14.5) + ' L' + store.gruboscSkrzydla + ' 0 Z'" stroke="#f00" stroke-width="1" fill="#fff" />
                </svg> -->
              </div>
              <!-- <div :style="{ width: store.gruboscOscieznicy + 'px', height: store.wysokoscDrzwi + 'px', right: -100 - store.gruboscOscieznicy + 'px' }" class="rzutZboku" hidden>
                <img style="width: 92px; transform: scaleX(-1)" src="/images/Ościeżnica 9.svg" alt="" />
                <img style="left: calc(92px - 54px + 18px); position: relative; top: -26px; width: 56px" src="/images/PREMIUM.svg" alt="" /> -->
              <!-- <div title="Grubość ościeżnicy" class="wymiar">
                  {{ store.gruboscOscieznicy }}
                </div> -->
              <!-- <div :style="{ width: store.gruboscSkrzydla + 'px', height: store.wysokoscSkrzydla + 'px', top: store.p / 2 + 'px', left: store.gruboscOscieznicy - store.gruboscSkrzydla + 20 + 'px' }" class="drzwirze"></div> -->
              <!-- </div> -->
              <!-- <div class="klip" :style="{ 'clip-path': store.path, width: store.gruboscSkrzydla + 'px', height: store.wysokoscSkrzydla + 'px' }"></div> -->
              <!-- <div class="klip"></div> -->
            </div>
          </div>
        </div>
        <div class="mt-3 buttons px-3 d-flex justify-content-between">
          <a href="https://wiked.pl/technologia/" target="_blank" class="btn btn-success w-100">Technologia</a>
          <!-- <button class="btn btn-info" @click="savePdf">Save Pdf</button> -->
          <button type="button" class="btn btn-success w-100" data-toggle="modal" data-target="#sizing">Wymiarowanie</button>
        </div>
      </div>
    </div>
    <div id="fota"></div>
  </div>
</template>
<style scoped>
.klip {
  transform: rotate(180deg);
  position: absolute;
  background: #1c1c1c;
  /* clip-path: pat\68 ("M 0 0 L 0 2032 l18 0 l0 -14.5 L54 2017.5 L54 0 Z"); */
  height: 2032px;
  width: 100px;
  top: 0;
  fill: black;
  stroke: aquamarine;
  z-index: 1000;
}
.wymiar {
  left: 50%;
  position: absolute;
  font-size: 60px;
  font-weight: bold;
  color: green;
  top: 50%;
  transform: translate(-50%);
}
.rzutZboku {
  /* background: white; */
  position: absolute;
  right: -186px;
  bottom: 0;
  /* width: 86px; */
  /* height: 2100px; */
  /* border: 1px solid; */
  /* box-shadow: 0px 0px 5px rgb(0, 0, 0, 1.25); */
}
.drzwirze {
  width: 100px;
  height: 100px;
  background: white;
  /* border: 1px solid; */
  /* box-shadow: 0px 0px 5px rgb(0, 0, 0, 1.25); */
  border: 1px solid;
  left: 120px;
  position: relative;
  top: 30px;
  z-index: -1;
}
.dol {
  position: relative;
}
</style>
<script>
// import $ from "jquery";
import { jsPDF } from "jspdf";
import html2canvas from "html2canvas";

import domtoimage from "dom-to-image";

import VueHtml2pdf from "vue-html2pdf";
export default {
  computed: {
    rozmiar() {
      return store.rozmiar;
    },
    rozmiary() {
      return store.rozmiary;
    },
    typ() {
      return store.typ;
    },
    s1() {
      return store.s1;
    },
    s2() {
      return store.s2;
    },
    seria() {
      return store.seria;
    },
    szerokoscZestawu() {
      return store.szerokoscZestawu;
    },
    wysokoscZestawu() {
      return store.wysokoscZestawu;
    },
    naswietleLeweSzer() {
      return store.naswietleLeweSzer;
    },
    naswietlePraweSzer() {
      return store.naswietlePraweSzer;
    },
    naswietleGorneWys() {
      return store.naswietleGorneWys;
    },
    skrot() {
      return store.skrot;
    }, //   store.skrot = store.skrotMax;
    skrotMax() {
      return store.skrotMax;
    }, //   store.skrot = store.skrotMax;
  },
  watch: {
    rozmiary(newVal, val) {
      // console.log(val)
      // console.log(newVal)
    },
    naswietleLeweSzer(newVal, val) {
      store.naswietleLeweSzer = Math.ceil(newVal / 10) * 10;
      if (newVal > store.naswietleSzerMax) {
        store.naswietleLeweSzer = store.naswietleSzerMax;
      }
      if (newVal < store.naswietleSzerMin) {
        store.naswietleLeweSzer = store.naswietleSzerMin;
      }
    },
    naswietlePraweSzer(newVal, val) {
      store.naswietlePraweSzer = Math.ceil(newVal / 10) * 10;
      if (newVal > store.naswietleSzerMax) {
        store.naswietlePraweSzer = store.naswietleSzerMax;
      }
      if (newVal < store.naswietleSzerMin) {
        store.naswietlePraweSzer = store.naswietleSzerMin;
      }
    },
    naswietleGorneWys(newVal, val) {
      store.naswietleGorneWys = Math.ceil(newVal / 10) * 10;
      if (newVal > store.naswietleWysMax) {
        store.naswietleGorneWys = store.naswietleWysMax;
      }
      if (newVal < store.naswietleWysMin) {
        store.naswietleGorneWys = store.naswietleWysMin;
      }
    },
    skrotMax(newVal, val) {
      $("[title]").tooltip();
    },
    skrot(newVal, val) {
      // store.skrot = Math.round(newVal / 10) * 10;
      store.skrot = Math.ceil(newVal / 10) * 10;
      console.log(newVal);
      console.log(val);
      if (newVal > store.skrotMax) {
        store.skrot = store.skrotMax;
        // console.log("Wartość za wysoka");
      }
      if (newVal < store.skrotMin) {
        store.skrot = store.skrotMin;
        // console.log("Wartość za wysoka");
      }
    },
    szerokoscZestawu() {
      setTimeout(this.skaluj, 600);
    },
    wysokoscZestawu() {
      setTimeout(this.skaluj, 600);
    },
    typ() {
      // console.log("store changed");
      // this.skaluj();

      // setTimeout(this.skaluj, 100);
      store.s1 = store.serie.filter((el) => el.typy.includes(store.typ))[0].seria;
      // console.log(store.serie.filter((el) => el.typy.includes(store.typ))[0].seria);
      // console.log(this.szerZes());
    },
    s1() {
      store.seria = parseInt(store.s1 + String(store.s2));
      return store.s1;
    },
    s2() {
      store.seria = parseInt(store.s1 + String(store.s2));
      // store.osc = store.profilRamy.filter((el) => el.serie.includes(parseInt(store.s1 + String(store.s2))))[0].oscieznica;
      return store.s2;
    },
    seria() {
      // store.osc = store.profilRamy.filter((el) => el.serie.includes(parseInt(store.s1 + String(store.s2))))[0].oscieznica || "";
      let filtr = store.profilRamy.filter((el) => el.serie.includes(store.seria)) || store.profilRamy;
      if (filtr.length > 0) {
        store.osc = filtr[0].oscieznica;
      }
      // if (filtr != "undefined") {
      //   console.log(filtr[0]);
      // }
      // store.osc = filtr[0].oscieznica || store.profilRamy[0].oscieznica;
      // console.log("seria changed");
      // this.skaluj();
    },
  },
  methods: {
    savePdf() {
      console.log("savePdf");
      // const scianka = $(".scianka")[0];

      var node = document.getElementById("myDiv");
      // var node = document.getElementById('my-node');

      const pdf = new jsPDF();
      domtoimage
        .toPng(node)
        .then(function (dataUrl) {
          var img = new Image();
          img.src = dataUrl;
          // document.body.appendChild(img);
          // console.log(dataUrl);
          console.log(img);
          // document.body.appendChild(canvas);
          $("#fota").append(img);
          pdf.addImage(img, "PNG", 0, 0, 200, 100); // Skaluj obraz według potrzeb
          html2pdf(document.getElementById("fota"), {
            margin: 1,
            filename: "i-was-html.pdf",
          });
        })
        .catch(function (error) {
          console.error("oops, something went wrong!", error);
        });
      // return;
      // html2canvas(document.body).then(function (canvas) {
      // document.body.appendChild(canvas);
      // console.log(canvas);

      // pdf.text("Hello world!", 10, 10);
      // pdf.save("a4.pdf");
      // });
      // const { jsPDF } = require("jspdf"); // will automatically load the node version

      // Default export is a4 paper, portrait, using millimeters for units
    },
    // szerZes() {
    //   var szer = store.szerokoscDrzwi;
    //   let oszer = 0;
    //   var wys = store.wysokoscDrzwi;
    //   if (store.typ == "D1F") {
    //     if (store.dostawkaLewa) {
    //       szer += store.dostawkaSzer;
    //     }
    //     if (store.dostawkaPrawa) {
    //       szer += store.dostawkaSzer;
    //     }
    //   }
    //   if (store.typ == "D1N") {
    //     if (store.naswietleLewe) {
    //       szer += store.naswietleLeweSzer;
    //     }
    //     if (store.naswietlePrawe) {
    //       szer += store.naswietlePraweSzer;
    //     }
    //   }
    //   if (store.typ == "D2") {
    //     szer += store.rozmiarBierne;
    //   }
    //   store.szerokoscZestawu = szer;
    //   oszer = store.szerokoscZestawu + 2 * store.luz;
    //   if (store.s2 == 0 && store.osc == 9) {
    //     // oszer -= 60;
    //   }
    //   console.log(store.osc)
    //   if (store.s2 == 3 && store.osc == '11kat') {
    //     alert('ytu')
    //     oszer -= 60;
    //   }

    //   store.szerokoscOtworu = oszer;
    //   this.skaluj();
    //   setTimeout(this.skaluj, 600);
    //   return szer;
    // },
    // wysZes() {
    //   var wys = store.wysokoscDrzwi;
    //   let owys = 0;
    //   let luz = store.osc == 9 ? -20 : 10;
    //   if (store.typ == "D1N") {
    //     if (store.naswietleGorne) {
    //       wys += store.naswietleGorneWys;
    //     }
    //   }
    //   store.wysokoscZestawu = wys;
    //   store.wysokoscOtworu = wys + luz;
    //   this.skaluj();
    //   setTimeout(this.skaluj, 600);
    //   return wys;
    // },
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
        scale = (bw - 100) / ow;
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
    setTimeout(this.skaluj, 600);
  },
};
</script>
