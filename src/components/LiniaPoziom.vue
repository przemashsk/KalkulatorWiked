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
  <div class="line-top" :class="klasa">
    <div class="arrow-left" :style="{ 'border-right': '60px solid ' + lineColor }"></div>
    <div class="line" :style="{ background: lineColor }"></div>
    <span class="text" :style="{ color: lineColor }"> {{ wymiar }} </span>
    <div class="line" :style="{ background: lineColor }"></div>
    <div class="arrow-right" :style="{ 'border-left': '60px solid ' + lineColor }"></div>
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
.osc9t {
  width: calc(100% - 44px);
  left: 20px;
}
</style>
