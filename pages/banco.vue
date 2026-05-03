<template>
    <div class="min-h-screen w-full max-w-6xl mx-auto px-4 py-12 flex flex-col gap-6">
        <div class="flex justify-end -mb-16">
            <NuxtImg :src="flowerCornerImage" class="-scale-y-100 size-40"></NuxtImg>
        </div>

        <div data-tour="banco-title" class="mx-auto max-w-xl w-full">
            <h1 class="text-3xl md:text-4xl font-dancing mb-4 text-brand-charcoal">{{ bankData?.title }}</h1>
            <p class="text-sm text-center text-brand-charcoal/70 px-3 leading-relaxed">
                {{ bankData?.intro }}
            </p>
        </div>

        <datos-bancarios
            data-tour="banco-datos"
            :bank-name="bankConfig?.name"
            :account-holder="bankConfig?.holder"
            :account-number="bankConfig?.accountNumber"
        ></datos-bancarios>

        <div class="flex flex-col gap-4 mx-auto max-w-md w-full">
            <a data-tour="banco-regalo" class="relative bg-brand-cyan text-white font-bold py-3 px-6 rounded-xl shadow-lg hover:bg-brand-cyan/80 transition duration-300 text-center"
                :href="giftsConfig?.liverpoolUrlAlt">
                <GiftIcon class="inline-block w-5 h-5 mr-2" />
                {{ bankData?.giftButton }}
            </a>
        </div>

        <div class="mx-auto max-w-xl text-center">
            <p class="text-sm text-brand-charcoal/70">{{ bankData?.footer }}</p>
            <p class="text-sm text-brand-charcoal/70">{{ bankData?.footerThanks }}</p>
        </div>

        <div class="flex justify-start">
            <button data-tour="banco-back" @click="navigateToHome"
                class="inline-flex items-center gap-2 bg-brand-cyan/10 hover:bg-brand-cyan/20 text-brand-cyan border border-brand-cyan/30 font-semibold py-2 px-5 rounded-xl shadow transition duration-300">
                <ArrowLeftIcon class="w-5 h-5" />
                <span>{{ bankData?.backButton }}</span>
            </button>
        </div>
    </div>
</template>
<script setup lang="ts">
import { computed } from 'vue'
import { GiftIcon, ArrowLeftIcon } from '@heroicons/vue/20/solid'
import { useRouter } from 'vue-router'
import { TOURS } from '~/constants/tours'

const { startTour } = useDriverTour()
const router = useRouter()

const t = useWeddingConfig()

const bankData = computed(() => t.value.texts?.bankPage)
const bankConfig = computed(() => t.value.bank)
const giftsConfig = computed(() => t.value.gifts)
const flowerCornerImage = computed(() => t.value.images?.flowerCorner ?? '')

onMounted(() => {
  const seen = localStorage.getItem('boda_banco_tour_seen') === 'true'
  if (!seen) {
    setTimeout(() => {
      startTour(TOURS.banco, {
        onDestroyed: () => {
          localStorage.setItem('boda_banco_tour_seen', 'true')
        },
      })
    }, 800)
  }
})

const navigateToHome = () => {
    router.push('/')
}
</script>
