<template>
    <div class="flex flex-col  px-4 gap-4 my-10 w-screen text-brand-charcoal">
        <div class="flex justify-end -mb-20">
            <NuxtImg :src="flowerCornerImage" class="-scale-y-100 size-40"></NuxtImg>
        </div>

        <h1 data-tour="confirm-title" class="text-3xl font-dancing mb-4 text-brand-charcoal">{{ confirmPageData?.title }}</h1>
        <p v-if="isFamily" data-tour="confirm-message" class="text-md mb-6 mx-auto text-center text-xs px-3">
            {{ confirmPageData?.familyMessage }}
        </p>
        <p v-else data-tour="confirm-message" class="text-md mb-6 mx-auto text-center text-xs px-3">
            {{ confirmPageData?.companionMessage }}
        </p>
        <p></p>

        <!-- TABLE -->
        <div data-tour="confirm-table" class="px-6 sm:px-6 lg:px-8 mx-auto">
            <div class="sm:flex sm:items-center">
                <div class="sm:flex-auto">
                    <h1 v-if="isFamily" class="text-lg font-lora text-gray-900">{{ guest.fullName }}</h1>
                    <p class="mt-2 text-sm text-brand-charcoal/70">Favor de confirmar antes del <span class="font-semibold"> {{ dateData?.rsvpDeadline }}</span></p>
                </div>
            </div>
            <div class="mt-8 flow-root">
                <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                    <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
                        <div class="overflow-hidden shadow ring-1 ring-black/5 sm:rounded-lg">
                            <table class="min-w-full divide-y divide-gray-300">
                                <thead class="bg-gray-50">
                                    <tr>
                                        <th scope="col"
                                            class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6">
                                            {{ confirmPageData?.nameLabel }}</th>

                                        <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
                                            <span class="sr-only">Edit</span>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody data-tour="confirm-switches" class="divide-y divide-gray-200 bg-white">
                                    <tr v-if="!isFamily">
                                        <td
                                            class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-6">
                                            {{ guest.fullName }}</td>
                                        <td class="py-4 pl-3 pr-4 text-center text-sm font-medium sm:pr-6">
                                            <Switch v-model="guest.confirmed"
                                                :class="[guest.confirmed ? 'bg-green-600' : 'bg-gray-400', 'relative inline-flex h-6 w-11 shrink-0 cursor-pointer rounded-full border-2 border-transparent transition-colors duration-200 ease-in-out focus:outline-none focus:ring-2 focus:ring-green-600 focus:ring-offset-2']">
                                                <span class="sr-only">Use setting</span>
                                                <span aria-hidden="true"
                                                    :class="[guest.confirmed ? 'translate-x-5' : 'translate-x-0', 'pointer-events-none inline-block size-5 transform rounded-full bg-white shadow ring-0 transition duration-200 ease-in-out']" />
                                            </Switch>
                                            <p v-if="guest.confirmed" class=" text-xs font-thin text-green-500">
                                                {{ confirmPageData?.confirmedLabel }}</p>
                                        </td>

                                    </tr>
                                    <tr v-for="person in people" :key="person.email">
                                        <td
                                            class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-6">
                                            {{ person.name }}</td>

                                        <td class="py-4 pl-3 pr-4 text-center text-sm font-medium sm:pr-6">
                                            <Switch v-model="person.confirmed"
                                                :class="[person.confirmed ? 'bg-green-600' : 'bg-gray-400', 'relative inline-flex h-6 w-11 shrink-0 cursor-pointer rounded-full border-2 border-transparent transition-colors duration-200 ease-in-out focus:outline-none focus:ring-2 focus:ring-green-600 focus:ring-offset-2']">
                                                <span class="sr-only">Use setting</span>
                                                <span aria-hidden="true"
                                                    :class="[person.confirmed ? 'translate-x-5' : 'translate-x-0', 'pointer-events-none inline-block size-5 transform rounded-full bg-white shadow ring-0 transition duration-200 ease-in-out']" />
                                            </Switch>
                                            <p v-if="person.confirmed" class=" text-xs font-thin text-green-500">
                                                {{ confirmPageData?.confirmedLabel }}</p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="flex justify-end mt-6 mx-auto px-4 sm:px-20 w-full max-w-2xl">
            <button
                data-tour="confirm-submit"
                class="w-full relative bg-brand-cyan text-white font-bold py-3 px-6 rounded-xl shadow-lg hover:bg-brand-cyan/80 transition duration-300 text-center overflow-hidden"
                @click="confirmarAsistencia">
                <NuxtImg class="size-11 absolute bottom-0 right-0 -scale-y-100 -scale-x-100 pointer-events-none" :src="disenoFloral3Image"></NuxtImg>
                {{ confirmPageData?.submitButton }}
            </button>
        </div>

        <!-- Aviso adultos -->
        <div data-tour="confirm-adults" class="mt-8 rounded-2xl border border-red-200 bg-red-50/60 px-5 py-4 max-w-lg">
            <p class="text-brand-charcoal text-base font-semibold">
                {{ confirmPageData?.adultsOnly }}
            </p>
            <a class="text-xs text-brand-cyan underline mt-1 inline-block" :href="confirmPageData?.adultsOnlyLink">
                ¿Por qué? →
            </a>
        </div>

        <div class="mt-6">
            <p class="text-brand-charcoal/70 text-sm">{{ confirmPageData?.footer }}</p>
            <p class="text-brand-charcoal/70 text-sm">{{ confirmPageData?.footerThanks }}</p>
        </div>

        <div class="flex justify-start mt-8">
            <button data-tour="confirm-back" @click="navigateToHome"
                class="inline-flex items-center gap-2 bg-brand-cyan/10 hover:bg-brand-cyan/20 text-brand-cyan border border-brand-cyan/30 font-semibold py-2 px-5 rounded-xl shadow transition duration-300">
                <ArrowLeftIcon class="w-5 h-5" />
                <span>{{ confirmPageData?.backButton }}</span>
            </button>
        </div>
        <ModalConfirmAlert v-model="showModal" :title="confirmPageData?.modalTitle"
            :message="confirmPageData?.modalMessage" @confirm="handleConfirm"></ModalConfirmAlert>

    </div>
</template>
<script setup lang="ts">
import { useRouter } from 'vue-router'
import { useGuestStore } from '@/stores/guest'
import { ArrowLeftIcon } from '@heroicons/vue/20/solid'
import { Switch } from '@headlessui/vue'

import { ref, computed } from 'vue'
import ModalConfirmAlert from '~/components/modal/modalConfirmAlert.vue'
import { TOURS } from '~/constants/tours'

const { startTour } = useDriverTour()
const router = useRouter()
const guestStore = useGuestStore()
const t = useWeddingConfig()

const confirmPageData = computed(() => t.value.texts?.confirmPage)
const dateData = computed(() => t.value.date)
const flowerCornerImage = computed(() => t.value.images?.flowerCorner ?? '')
const disenoFloral3Image = computed(() => t.value.images?.disenoFloral3 ?? '')

onMounted(() => {
  const seen = localStorage.getItem('boda_confirm_tour_seen') === 'true'
  if (!seen) {
    setTimeout(() => {
      startTour(TOURS.confirm, {
        onDestroyed: () => {
          localStorage.setItem('boda_confirm_tour_seen', 'true')
        },
      })
    }, 800)
  }
})

const showModal = ref(false)
const guest = guestStore.guest
const isFamily = computed(() => guest.code.startsWith('FAM'));

const people = ref([]);

people.value.push(...guest.companions);


const navigateToHome = () => {
    router.push('/')
}

const confirmarAsistencia = async () => {
    showModal.value = true;
}
const handleConfirm = async () => {
    showModal.value = false;
    const payload = {
        code: guest.code,
        confirmed: isFamily.value ? true : guest.confirmed,
        notes: guest.notes || '',
        companions: people.value.map((c) => ({
            id: c.id,
            confirmed: c.confirmed ?? false
        }))
    }
     await guestStore.confirmGuest(payload);
    if (guestStore.error) {
        alert(confirmPageData.value?.errorMessage)
    } else {
        alert(confirmPageData.value?.successMessage)
        navigateToHome();
    }
}
</script>
