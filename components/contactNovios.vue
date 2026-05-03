<template>
    <section class="w-full ">
        <div class="py-12 md:py-16 lg:py-20 max-w-6xl mx-auto">
            <div class="w-full flex justify-end -mb-28 -mr-20">
                <NuxtImg :src="flowerCornerImage" class="-scale-y-100 size-40 md:size-60"></NuxtImg>
            </div>
            <div class="flex flex-col  justify-center my-10">
                <h2 class="text-2xl font-dancing text-brand-charcoal mb-4 md:text-4xl">{{ contactTitle }}</h2>
                <div class="flex flex-col w-full gap-6 mx-auto max-w-2xl my-8">
                    <a class="relative flex gap-4 justify-center bg-green-500 text-white font-bold py-3 px-6 rounded-lg shadow hover:bg-green-600 transition duration-300"
                        :href="groomWhatsappLink">
                        <NuxtImg class="size-11 absolute top-0 left-0" :src="disenoFloral2Image"></NuxtImg>

                        <NuxtIcon class="text-white" name="whatsapp"></NuxtIcon>
                        <div class="flex flex-col items-center justify-center">
                            <span class="text-xs">{{ contactData?.groom?.label }}</span>
                            <span class="text-xs font-bold">{{ contactData?.groom?.phone }}</span>
                        </div>

                    </a>
                    <a class="relative flex gap-4 justify-center bg-green-500 text-white font-bold py-3 px-6 rounded-lg shadow hover:bg-green-600 transition duration-300"
                        :href="brideWhatsappLink">
                        <NuxtImg class="size-11 absolute bottom-0 right-0 -scale-y-100 -scale-x-100"
                            :src="disenoFloral2Image"></NuxtImg>

                        <NuxtIcon class="text-white" name="whatsapp"></NuxtIcon>
                        <div class="flex flex-col items-center justify-center">
                            <span class="text-xs">{{ contactData?.bride?.label }}</span>
                            <span class="text-xs font-bold">{{ contactData?.bride?.phone }}</span>
                        </div>

                    </a>
                </div>
            </div>
        </div>
    </section>
</template>
<script setup lang="ts">
import { computed } from 'vue'
import { useWeddingConfigStore } from '~/stores/weddingConfig'

const configStore = useWeddingConfigStore()

const contactData = computed(() => configStore.config?.contact)
const flowerCornerImage = computed(() => configStore.config?.images?.flowerCorner ?? '')
const contactTitle = computed(() => configStore.config?.texts?.contact?.title ?? '')
const disenoFloral2Image = computed(() => configStore.config?.images?.disenoFloral2 ?? '')

const groomWhatsappLink = computed(() => {
  const c = contactData.value?.groom
  if (!c) return '#'
  return `https://wa.me/${c.phoneRaw}?text=${encodeURIComponent(c.whatsappMessage)}`
})

const brideWhatsappLink = computed(() => {
  const c = contactData.value?.bride
  if (!c) return '#'
  return `https://wa.me/${c.phoneRaw}?text=${encodeURIComponent(c.whatsappMessage)}`
})
</script>
<style>
.nuxt-icon svg {
    width: 1.8em;
    height: 1.8em;
    margin-bottom: 0.125em;
    vertical-align: middle;
    color: white;
}
</style>