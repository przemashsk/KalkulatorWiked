<script setup>
import { store } from "../store.js";
//
</script>
//
<script>
export default {
  props: {
    lineColor: { type: String, default: "pink" },
    wymiar: { type: String, default: "0" },
    klasa: { type: String, default: "" },
  },
};
</script>

<template>
  <div class="line-left" :class="klasa">
    <div class="arrow-top" :style="{ 'border-bottom': '60px solid ' + lineColor }"></div>
    <div class="line2" :style="{ background: lineColor }"></div>
    <span class="text tb" :style="{ color: lineColor }"> {{ wymiar }} </span>
    <div class="line2" :style="{ background: lineColor }"></div>
    <div class="arrow-bottom" :style="{ 'border-top': '60px solid ' + lineColor }"></div>
  </div>
</template>

<style scoped>
.text {
  font-weight: bold;
  padding: 15px 0;
}
.tb {
  writing-mode: tb;
}
.osc9l {
  height: calc(100% - 24px);
  top: 20px;
}
</style>
