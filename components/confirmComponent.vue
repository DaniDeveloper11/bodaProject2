<template>
    <div class="my-20 max-w-6xl mx-auto">
        <div class="w-full flex justify-end -mb-28 -mr-20">
            <NuxtImg :src="config.images.flowerCorner" class="-scale-y-100 size-40"></NuxtImg>
        </div>
        <div class="flex flex-col  justify-center my-10">
            <h2 class="text-2xl font-dancing text-gray-800 mb-4 md:text-4xl dark:text-white">{{ config.texts.confirmation.title }}</h2>
            <div class="flex flex-col w-full gap-6 mx-auto max-w-2xl">
                <div>
                    <label for="email" class="block text-sm/6 font-medium text-gray-900 dark:text-white">{{ config.texts.confirmation.codeLabel }}</label>
                    <div class="mt-2">
                        <input type="text" name="code" id="code" v-model="code" @input="code = code.toUpperCase()"
                            class="block w-full h-14 text-center rounded-md bg-white px-3 py-1.5 text-base text-gray-900 outline outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400 focus:outline focus:outline-2 focus:-outline-offset-2 focus:outline-indigo-600 sm:text-sm/6"
                            :placeholder="config.texts.confirmation.codePlaceholder" style="text-transform: uppercase;" />
                    </div>
                    <p class="mt-2 text-sm text-gray-500 dark:text-white" id="email-description">{{ config.texts.confirmation.codeHelp }}
                    </p>

                </div>
                <button
                    class="relative flex gap-4 justify-center bg-orange-500 text-white font-bold py-3 px-6 rounded-lg shadow hover:bg-orange-600 transition duration-300"
                    @click="buscarInvitado">

                    <NuxtImg class="size-11 absolute top-0 left-0" :src="config.images.disenoFloral1"></NuxtImg>

                    <div class="flex flex-col items-center justify-center">
                        <span class="text-lg">{{ config.texts.confirmation.button }}</span>

                    </div>

                </button>
                <div v-if="guestStore.loading">{{ config.texts.confirmation.loading }}</div>
                <div v-else-if="guestStore.error" class="text-red-600">{{ guestStore.error }}</div>

            </div>
        </div>
    </div>
</template>
<script setup>
import { NuxtImg } from '#components';
import { ref } from 'vue'
import { useGuestStore } from '@/stores/guest'
import { useRouter } from 'vue-router';
import config from '~/wedding.config'

const router = useRouter();
const guestStore = useGuestStore();
const code = ref('');

const buscarInvitado = async () => {
    try {
        await guestStore.fetchGuestByCode(code.value)
        if (guestStore.guest) {
            router.push('/confirm')
        } else {
            guestStore.error = config.texts.confirmation.notFound
        }

    } catch (error) {
        guestStore.error = config.texts.confirmation.error
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