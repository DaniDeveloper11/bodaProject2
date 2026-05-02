<template>
    <div id="promise" class="md:flex justify-center items-center py-12 md:py-16 lg:py-24 px-4 mx-auto gap-8">
        <div class=" flex justify-center items-center w-full mx-auto h-[70vh]">
            <NuxtImg :src="weddingConfig.images.promise" class=" object-cover"></NuxtImg>
        </div>
        <div class=" w-full my-4">
            <h2 class="text-3xl sm:text-4xl md:text-5xl text-left font-playfair text-brand-cyan my-2">{{ weddingConfig.texts.promise.title }}</h2>
            <div>
                <p class="lora text-left text-lg mr-14 text-brand-charcoal">{{ weddingConfig.texts.promise.text }}</p>
            </div>
            <div class="flex justify-end -mt-28 md:-mt-20 -mr-9">
                <NuxtImg :src="weddingConfig.images.flowerCorner" class="size-52"></NuxtImg>
            </div>
        </div>
    </div>
</template>

<script setup>
import weddingConfig from '~/wedding.config'
</script>