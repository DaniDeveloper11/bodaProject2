<template>
    <div class="min-h-screen w-full max-w-6xl mx-auto px-4 py-12 flex flex-col gap-6">
        <div class="flex justify-end -mb-16">
            <NuxtImg :src="weddingConfig.images.flowerCorner" class="-scale-y-100 size-40"></NuxtImg>
        </div>

        <div class="mx-auto max-w-xl w-full">
            <h1 class="text-3xl md:text-4xl font-dancing mb-4 dark:text-white">{{ weddingConfig.texts.bankPage.title }}</h1>
            <p class="text-sm text-center text-gray-600 dark:text-gray-300 px-3 leading-relaxed">
                {{ weddingConfig.texts.bankPage.intro }}
            </p>
        </div>

        <datos-bancarios
            :bank-name="weddingConfig.bank.name"
            :account-holder="weddingConfig.bank.holder"
            :account-number="weddingConfig.bank.accountNumber"
        ></datos-bancarios>

        <div class="flex flex-col gap-4 mx-auto max-w-md w-full">
            <a class="relative bg-violet-500 text-white font-bold py-3 px-6 rounded-xl shadow-lg hover:bg-violet-600 transition duration-300 text-center"
                :href="weddingConfig.gifts.liverpoolUrlAlt">
                <GiftIcon class="inline-block w-5 h-5 mr-2" />
                {{ weddingConfig.texts.bankPage.giftButton }}
            </a>
        </div>

        <div class="mx-auto max-w-xl text-center">
            <p class="text-sm text-gray-600 dark:text-gray-300">{{ weddingConfig.texts.bankPage.footer }}</p>
            <p class="text-sm text-gray-600 dark:text-gray-300">{{ weddingConfig.texts.bankPage.footerThanks }}</p>
        </div>

        <div class="flex justify-start">
            <button @click="navigateToHome"
                class="inline-flex items-center gap-2 bg-brand-sage/10 dark:bg-white/10 hover:bg-brand-sage/20 dark:hover:bg-white/20 text-brand-sage dark:text-white border border-brand-sage/30 dark:border-white/20 font-semibold py-2 px-5 rounded-xl shadow transition duration-300">
                <ArrowLeftIcon class="w-5 h-5" />
                <span>{{ weddingConfig.texts.bankPage.backButton }}</span>
            </button>
        </div>
    </div>
</template>
<script setup>
import { GiftIcon, ArrowLeftIcon } from '@heroicons/vue/20/solid'
import { useRouter } from 'vue-router'
import weddingConfig from '~/wedding.config'

const router = useRouter()

const navigateToHome = () => {
    router.push('/')
}
</script>