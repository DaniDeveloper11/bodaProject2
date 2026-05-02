<template>
  <section>
  <div class="mt-12 md:mt-16 lg:mt-20 mx-auto w-full">
    <div>
      <h2 class="text-brand-cyan font-dancing text-5xl md:text-6xl text-center md:my-8">{{ weddingConfig.texts.dressCode.title }}</h2>
      <p class="text-center text-brand-charcoal font-lora text-md mt-2 font-medium">
        {{ weddingConfig.texts.dressCode.intro }}
      </p>
    </div>

    <div>
      <h3 class="font-dancing text-center text-3xl my-4 text-brand-charcoal">{{ weddingConfig.texts.dressCode.level }}</h3>

      <div class="flex justify-center gap-4">
        <div class="flex flex-col items-center">
          <h3 class="tex-center text-lg font-dancing text-brand-charcoal md:text-4xl">{{ weddingConfig.texts.dressCode.womenLabel }}</h3>
          <p class="text-center text-brand-charcoal font-lora text-xs mt-2 font-medium md:text-md">
            {{ weddingConfig.texts.dressCode.womenDescription }}
          </p>
          <p class="text-center text-brand-cyan font-lora text-xs mt-2 font-medium md:text-sm">
            {{ weddingConfig.texts.dressCode.womenRestriction }}
          </p>
          <ul class="flex gap-3 justify-center mt-3">
            <li class="bg-black size-6 md:size-8 rounded-full border-2 border-white/40 shadow-md ring-1 ring-gray-400/30"></li>
            <li class="bg-red-500 size-6 md:size-8 rounded-full border-2 border-white/40 shadow-md"></li>
            <li class="bg-brand-cyan-light size-6 md:size-8 rounded-full border-2 border-white/40 shadow-md"></li>
          </ul>
        </div>
        <div class="">
          <NuxtImg :src="weddingConfig.images.dressCodeImg" class="rounded-lg shadow-lg object-cover max-w-60 flat " />
        </div>
        <div class="flex flex-col items-center">
          <h3 class="tex-center text-lg font-dancing text-brand-charcoal md:text-4xl">{{ weddingConfig.texts.dressCode.menLabel }}</h3>
          <p class="text-center text-brand-charcoal font-lora text-xs mt-2 font-medium md:text-md">
            {{ weddingConfig.texts.dressCode.menDescription }}
          </p>
          <p class="text-center text-brand-cyan font-lora text-xs mt-2 font-medium md:text-sm">
            {{ weddingConfig.texts.dressCode.menRestriction }}
          </p>
          <ul class="flex gap-3 justify-center mt-3">
            <li class="bg-green-600 size-6 md:size-8 rounded-full border-2 border-white/40 shadow-md"></li>
          </ul>
        </div>
      </div>
      <div class="mt-6 rounded-2xl border border-brand-cyan/20 bg-brand-sky px-6 py-5 text-center">
        <h2 class="font-dancing text-3xl md:text-4xl text-brand-charcoal mb-2">{{ weddingConfig.texts.dressCode.danceTitle }}</h2>
        <p class="text-brand-cyan font-lora text-sm md:text-base mt-1 font-medium">
          {{ weddingConfig.texts.dressCode.danceDescription }}
        </p>
        <p class="text-brand-cyan font-lora text-sm md:text-base mt-1 font-semibold">
          {{ weddingConfig.texts.dressCode.danceSuggestion }}
        </p>
      </div>
    </div>

    <div class="mt-10 md:grid md:grid-cols-2 md:gap-8">
      <div>
        <h3 class="text-2xl md:text-3xl font-dancing text-brand-charcoal mb-1">{{ weddingConfig.texts.dressCode.womenCarouselTitle }}</h3>
        <CarouselDressCode :photos="weddingConfig.images.dressCodeWomen"></CarouselDressCode>
      </div>
      <div class="mt-10 md:mt-0">
        <h3 class="text-2xl md:text-3xl font-dancing text-brand-charcoal mb-1">{{ weddingConfig.texts.dressCode.menCarouselTitle }}</h3>
        <CarouselDressCode :photos="weddingConfig.images.dressCodeMen"></CarouselDressCode>
      </div>
    </div>
    
  </div>
  </section>
</template>
<script setup lang="ts">
import weddingConfig from '~/wedding.config'
</script>