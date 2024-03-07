<script setup>
import { store } from "../store.js";
//
</script>
//
<script>
export default {
  props: {
    litera: { type: String, default: "" },
  },
};
</script>

<template>
  <span>{{ litera }}</span>
</template>

<style scoped></style>
