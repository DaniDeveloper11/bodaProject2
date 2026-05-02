<template>
    <div id="mesa-regalos" class="my-20 max-w-6xl mx-auto">
        <div class="w-full flex justify-end -mb-28 -mr-20  ">
            <NuxtImg :src="weddingConfig.images.flowerCorner" class="-scale-y-100 size-40"></NuxtImg>
        </div>
        <div class="flex flex-col  justify-center my-10">
            <h2 class="text-6xl font-dancing text-brand-charcoal mb-4">{{ weddingConfig.texts.gifts.title }}</h2>
            <p class="text-brand-charcoal/70 mb-6">{{ weddingConfig.texts.gifts.intro }}</p>
            <div class="flex flex-col w-full gap-6 mx-auto max-w-2xl">
                <a class="relative bg-brand-cyan text-white font-bold py-3 px-6 rounded-lg shadow hover:bg-brand-cyan/80 transition duration-300 text-center"
                    :href="weddingConfig.gifts.liverpoolUrl">
                    <NuxtImg class="size-11 absolute top-0 left-0" :src="weddingConfig.images.disenoFloral3"></NuxtImg>
                    <GiftIcon class="inline-block w-6 h-6 mr-2" />
                    {{ weddingConfig.texts.gifts.giftButton }}

                </a>
                <button class="relative bg-brand-cyan text-white font-bold py-3 px-6 rounded-lg shadow hover:bg-brand-cyan/80 transition duration-300 text-center"
                    @click="navigateToBanco">
                     <NuxtImg class="size-11 absolute bottom-0 right-0 -scale-y-100 -scale-x-100" :src="weddingConfig.images.disenoFloral3"></NuxtImg>

                    <CreditCardIcon class="inline-block w-6 h-6 mr-2" />
                    {{ weddingConfig.texts.gifts.bankButton }}
                </button>
            </div>
        </div>
        <div class="text-center mt-10">
            <p class="text-brand-charcoal/70">{{ weddingConfig.texts.gifts.footer }}</p>
            <p class="text-brand-charcoal/70">{{ weddingConfig.texts.gifts.footerThanks }}</p>
        </div>
    </div>
</template>
<script setup>
import { GiftIcon, CreditCardIcon } from '@heroicons/vue/20/solid'
import { useRouter } from 'vue-router'
import weddingConfig from '~/wedding.config'

const router = useRouter()

const navigateToBanco = () => {
    router.push('/banco')
}
</script>
