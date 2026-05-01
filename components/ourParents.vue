<template>
  <div id="our-parents" class="divide-y divide-gray-200 dark:divide-white/10 overflow-hidden rounded-2xl shadow-lg my-12 md:my-16 dark:shadow-black/30">
    <div class="px-4 py-5 sm:px-6 flex justify-center text-balance">
      <span class="lora text-center mx-auto font-semibold text-2xl dark:text-white">{{ config.texts.parentsIntro }}</span>
    </div>
    <div class="px-4 py-5 sm:p-6">
      <section class="flex flex-col items-center my-10 px-4">
        <div class="flex flex-col md:flex-row items-center justify-center gap-5">
          <div class="text-center font-playfair text-brand-sage dark:text-brand-sage text-xl leading-snug">
            <p>{{ config.couple.parentNames1.father }}</p>
            <p>{{ config.couple.parentNames1.mother }}</p>
          </div>

          <div class="flex flex-col items-center gap-1 md:hidden">
            <div class="w-px h-6 bg-brand-sage/30"></div>
            <NuxtImg alt="Flor" :src="config.images.decorativeT" class="size-10 object-cover z-20" />
            <div class="w-px h-6 bg-brand-sage/30"></div>
          </div>
          <NuxtImg alt="Flor" :src="config.images.decorativeT" class="size-10 object-cover z-20 hidden md:block" />

          <div class="text-center font-playfair text-brand-sage dark:text-brand-sage text-xl leading-snug">
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