<template>
    <div class="my-20 max-w-6xl mx-auto relative">
        <floralCorner position="top-left" size="size-20" />
        <floralCorner position="bottom-right" size="size-20" />
        <div class="w-full flex justify-end my-8">
            <NuxtImg :src="simpleFlowerImage" class="-scale-y-100 size-24 opacity-70"></NuxtImg>
        </div>
        <div class="flex flex-col  justify-center my-10">
            <h2 class="text-2xl font-dancing text-brand-charcoal mb-4 md:text-4xl">{{ confirmationData?.title }}</h2>
            <div class="flex flex-col w-full gap-6 mx-auto max-w-2xl">
                <div>
                    <label for="email" class="block text-sm/6 font-medium text-brand-charcoal">{{ confirmationData?.codeLabel }}</label>
                    <div class="mt-2">
                        <input type="text" name="code" id="code" v-model="code" @input="code = code.toUpperCase()"
                            class="block w-full h-14 text-center rounded-md bg-white px-3 py-1.5 text-base text-gray-900 outline outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400 focus:outline focus:outline-2 focus:-outline-offset-2 focus:outline-brand-cyan sm:text-sm/6"
                            :placeholder="confirmationData?.codePlaceholder" style="text-transform: uppercase;" />
                    </div>
                    <p class="mt-2 text-sm text-brand-charcoal/60" id="email-description">{{ confirmationData?.codeHelp }}
                    </p>

                </div>
                <button
                    class="relative flex gap-4 justify-center bg-brand-cyan text-white font-bold py-3 px-6 rounded-lg shadow hover:bg-brand-cyan/80 transition duration-300"
                    @click="buscarInvitado">

                    <NuxtImg class="size-11 absolute top-0 left-0" :src="disenoFloral1Image"></NuxtImg>

                    <div class="flex flex-col items-center justify-center">
                        <span class="text-lg">{{ confirmationData?.button }}</span>

                    </div>

                </button>
                <div v-if="guestStore.loading">{{ confirmationData?.loading }}</div>
                <div v-else-if="guestStore.error" class="text-red-600">{{ guestStore.error }}</div>

            </div>
        </div>
    </div>
</template>
<script setup lang="ts">
import { NuxtImg } from '#components';
import { ref, computed } from 'vue'
import { useGuestStore } from '@/stores/guest'
import { useRouter } from 'vue-router';
import { useWeddingConfigStore } from '~/stores/weddingConfig'

const configStore = useWeddingConfigStore()
const router = useRouter();
const guestStore = useGuestStore();
const code = ref('');

const confirmationData = computed(() => configStore.config?.texts?.confirmation)
const simpleFlowerImage = computed(() => configStore.config?.images?.simpleFlower ?? '')
const disenoFloral1Image = computed(() => configStore.config?.images?.disenoFloral1 ?? '')

const buscarInvitado = async () => {
    try {
        await guestStore.fetchGuestByCode(code.value)
        if (guestStore.guest) {
            router.push('/confirm')
        } else {
            guestStore.error = confirmationData.value?.notFound
        }

    } catch (error) {
        guestStore.error = confirmationData.value?.error
    }
}
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