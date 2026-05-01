<template>
  <div class="flex justify-center pb-10 px-4 w-full">
    <span
      class="text-white text-center text-5xl xs:text-6xl sm:text-7xl md:text-8xl leading-tight mx-auto mb-4"
      :style="{ fontFamily: config.couple.namesFont, textShadow: '0 2px 16px rgba(0,0,0,0.45)' }"
    >
      {{ config.couple.name1 }} <br> &amp; <br> {{ config.couple.name2 }}
    </span>
  </div>
</template>

<script setup>
import config from '~/wedding.config'
</script>