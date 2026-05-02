<template>
    <div id="save-date" class="relative divide-y divide-brand-sand/50 overflow-hidden rounded-2xl shadow-lg mt-12 md:mt-16 lg:mt-20">
      <floralCorner position="top-left" size="size-14" />
      <floralCorner position="bottom-right" size="size-14" />
      <div class="flex px-4 py-5 sm:px-6 gap-3 items-center justify-center">
        <NuxtIcon name="my-icon:agave-rosette" class="text-brand-copper size-8" />
        <h2 class="text-brand-cyan font-dancing text-5xl md:text-6xl text-center">
          {{ config.texts.saveDate }}</h2>
        <NuxtIcon name="my-icon:agave-rosette" class="text-brand-copper size-8" />
      </div>
      <div class="px-4 py-5 sm:p-6">
        <CalendarComponent></CalendarComponent>
      </div>
    </div>
  </template>

<script setup>
import config from '~/wedding.config'
</script>