<template>
  <div id="our-parents" class="relative divide-y divide-brand-sand/50 overflow-hidden rounded-2xl shadow-lg my-12 md:my-16 bg-white/50">
    <floralCorner position="top-right" size="size-16" />
    <floralCorner position="bottom-left" size="size-16" />
    <div class="px-4 py-5 sm:px-6 flex justify-center text-balance">
      <span class="lora text-center mx-auto font-semibold text-2xl text-brand-charcoal">{{ config.texts.parentsIntro }}</span>
    </div>
    <div class="px-4 py-5 sm:p-6">
      <section class="flex flex-col items-center my-10 px-4">
        <div class="flex flex-col md:flex-row items-center justify-center gap-5">
          <div class="text-center font-playfair text-brand-cyan text-xl leading-snug">
            <p>{{ config.couple.parentNames1.father }}</p>
            <p>{{ config.couple.parentNames1.mother }}</p>
          </div>

          <div class="flex flex-col items-center gap-1 md:hidden">
            <div class="w-px h-6 bg-brand-cyan/30"></div>
            <NuxtIcon name="my-icon:agave-rosette" class="text-brand-copper size-10 z-20" />
            <div class="w-px h-6 bg-brand-cyan/30"></div>
          </div>
          <NuxtIcon name="my-icon:agave-rosette" class="text-brand-copper size-10 z-20 hidden md:block" />

          <div class="text-center font-playfair text-brand-cyan text-xl leading-snug">
            <p>{{ config.couple.parentNames2.father }}</p>
            <p>{{ config.couple.parentNames2.mother }}</p>
          </div>
        </div>
      </section>
    </div>
  </div>
</template>

<script setup>
import config from '~/wedding.config'
</script>