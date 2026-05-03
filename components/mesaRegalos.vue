<template>
    <div id="mesa-regalos" class="my-20 max-w-6xl mx-auto">
        <div class="w-full flex justify-end -mb-28 -mr-20  ">
            <NuxtImg :src="flowerCornerImage" class="-scale-y-100 size-40"></NuxtImg>
        </div>
        <div class="flex flex-col  justify-center my-10">
            <h2 class="text-6xl font-dancing text-brand-charcoal mb-4">{{ giftsData?.title }}</h2>
            <p class="text-brand-charcoal/70 mb-6">{{ giftsData?.intro }}</p>
            <div class="flex flex-col w-full gap-6 mx-auto max-w-2xl">
                <a class="relative bg-brand-cyan text-white font-bold py-3 px-6 rounded-lg shadow hover:bg-brand-cyan/80 transition duration-300 text-center"
                    :href="giftsConfig?.liverpoolUrl">
                    <NuxtImg class="size-11 absolute top-0 left-0" :src="disenoFloral3Image"></NuxtImg>
                    <GiftIcon class="inline-block w-6 h-6 mr-2" />
                    {{ giftsData?.giftButton }}

                </a>
                <button class="relative bg-brand-cyan text-white font-bold py-3 px-6 rounded-lg shadow hover:bg-brand-cyan/80 transition duration-300 text-center"
                    @click="navigateToBanco">
                     <NuxtImg class="size-11 absolute bottom-0 right-0 -scale-y-100 -scale-x-100" :src="disenoFloral3Image"></NuxtImg>

                    <CreditCardIcon class="inline-block w-6 h-6 mr-2" />
                    {{ giftsData?.bankButton }}
                </button>
            </div>
        </div>
        <div class="text-center mt-10">
            <p class="text-brand-charcoal/70">{{ giftsData?.footer }}</p>
            <p class="text-brand-charcoal/70">{{ giftsData?.footerThanks }}</p>
        </div>
    </div>
</template>
<script setup lang="ts">
import { computed } from 'vue'
import { GiftIcon, CreditCardIcon } from '@heroicons/vue/20/solid'
import { useRouter } from 'vue-router'
import { useWeddingConfigStore } from '~/stores/weddingConfig'

const configStore = useWeddingConfigStore()
const router = useRouter()

const giftsData = computed(() => configStore.config?.texts?.gifts)
const giftsConfig = computed(() => configStore.config?.gifts)
const flowerCornerImage = computed(() => configStore.config?.images?.flowerCorner ?? '')
const disenoFloral3Image = computed(() => configStore.config?.images?.disenoFloral3 ?? '')

const navigateToBanco = () => {
    router.push('/banco')
}
</script>
