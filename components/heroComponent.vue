<template>
  <div id="hero" class="relative w-screen h-screen overflow-hidden my-5">
    <countDown
      class="hidden sm:block absolute top-0 left-1/2 -translate-x-1/2 z-10 pt-6"
    ></countDown>
    <NuxtImg
      alt="HeroImage"
      :src="config.images.hero"
      class="absolute  inset-0 w-full h-full object-cover object-[75%_center] sm:object-[center_25%]"
    />
    <div class="absolute inset-0 bg-gradient-to-t from-black/10 via-transparent to-transparent pointer-events-none"></div>
    <NamesComponent class="absolute bottom-0 left-1/2 -translate-x-1/2 w-full"></NamesComponent>
  </div>
  <div class="sm:hidden flex justify-center py-4">
    <countDown></countDown>
  </div>
</template>

<script setup>
const config = useWeddingConfig()
</script>
