<template>
  <div>
    <HeaderComponent></HeaderComponent>

    <main class="flex mx-auto lg:mx-0 2xl:mx-40 max-w-8xl px-4 sm:px-6 lg:px-8">
      <div class="flex-1 min-w-0 overflow-hidden">
        <slot />


        <!-- Botón Back to Top -->
        <button v-if="showButton" @click="scrollToTop"
          class="fixed bottom-6 right-6 z-50 bg-brand-cyan/90 text-white w-11 h-11 rounded-full shadow-xl hover:bg-brand-cyan transition-all duration-300 backdrop-blur-sm flex items-center justify-center text-lg font-semibold">
          ↑
        </button>


      </div>
    </main>
  <footer class="border-t border-brand-sand mt-8">
    <div class="mx-auto max-w-7xl px-6 py-8 flex items-center justify-center gap-2 lg:px-8">
      <svg viewBox="0 0 32 48" class="w-4 h-6 opacity-40" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M16 48 Q12 32 8 22 Q4 14 0 8 Q6 10 10 4 Q14 0 16 0 Q18 0 22 4 Q26 10 32 8 Q28 14 24 22 Q20 32 16 48Z" fill="#2D6A5A"/>
      </svg>
      <p class="text-center text-sm text-brand-charcoal/60 font-poppins">{{ weddingConfig.texts.footer }}</p>
    </div>
  </footer>


    <LoaderOverlay :show="guestStore.loading"></LoaderOverlay>
  </div>
</template>
<script setup>
import { useGuestStore } from '@/stores/guest';
const guestStore = useGuestStore()
import { ref, onMounted, onUnmounted } from 'vue'
import weddingConfig from '~/wedding.config'

const showButton = ref(false)

const scrollToTop = () => {
  window.scrollTo({ top: 0, behavior: 'smooth' })
}

const handleScroll = () => {
  showButton.value = window.scrollY > 200
}

onMounted(() => {
  window.addEventListener('scroll', handleScroll)
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})

</script>
<style>
html {
  scroll-behavior: smooth;
}
</style>
