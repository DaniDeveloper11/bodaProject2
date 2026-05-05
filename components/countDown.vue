<template>
    <div class="text-center text-brand-charcoal space-y-2 py-5 px-4 rounded-2xl bg-brand-sky/90 backdrop-blur-sm">
      <h2 class="text-3xl font-bold font-dancing">
        {{ isWeddingTime ? countdownTexts.celebration : countdownTexts.remaining }}
      </h2>

      <div v-if="!isWeddingTime" class="flex justify-center gap-6 text-2xl font-semibold">
        <div>
          <span class="block text-4xl text-brand-cyan">{{ countdown.days }}</span>
          <span class="font-dancing">{{ countdownTexts.days }}</span>
        </div>
        <div>
          <span class="block text-4xl text-brand-cyan">{{ countdown.hours }}</span>
          <span class="font-dancing">{{ countdownTexts.hours }}</span>
        </div>
        <div>
          <span class="block text-4xl text-brand-cyan">{{ countdown.minutes }}</span>
          <span class="font-dancing">{{ countdownTexts.minutes }}</span>
        </div>
        <div>
          <span class="block text-4xl text-brand-cyan">{{ countdown.seconds }}</span>
          <span class="font-dancing">{{ countdownTexts.seconds }}</span>
        </div>
      </div>
    </div>
  </template>
  
  <script setup lang="ts">
  import { ref, computed, watch, onMounted, onUnmounted } from 'vue'
  import config from '~/wedding.config'
  import { useWeddingConfigStore } from '~/stores/weddingConfig'

  const configStore = useWeddingConfigStore()
  const weddingDateStr = computed(() => configStore.config?.date?.weddingDate ?? config.date.weddingDate)
  const weddingDate = computed(() => new Date(weddingDateStr.value))
  
  const countdownTexts = computed(() => configStore.config?.texts?.countdown ?? config.texts.countdown)

  const countdown = ref({
    days: '00',
    hours: '00',
    minutes: '00',
    seconds: '00'
  })
  
  const isWeddingTime = ref(false)
  let intervalId: NodeJS.Timer
  
  const updateCountdown = () => {
    const now = new Date()
    const distance = weddingDate.value.getTime() - now.getTime()
  
    if (distance <= 0) {
      isWeddingTime.value = true
      clearInterval(intervalId)
      return
    }
  
    const days = Math.floor(distance / (1000 * 60 * 60 * 24))
    const hours = Math.floor((distance / (1000 * 60 * 60)) % 24)
    const minutes = Math.floor((distance / (1000 * 60)) % 60)
    const seconds = Math.floor((distance / 1000) % 60)
  
    countdown.value = {
      days: String(days).padStart(2, '0'),
      hours: String(hours).padStart(2, '0'),
      minutes: String(minutes).padStart(2, '0'),
      seconds: String(seconds).padStart(2, '0')
    }
  }
  
  watch(weddingDateStr, () => {
    isWeddingTime.value = false
    clearInterval(intervalId)
    updateCountdown()
    intervalId = setInterval(updateCountdown, 1000)
  })

  onMounted(() => {
    updateCountdown()
    intervalId = setInterval(updateCountdown, 1000)
  })
  
  onUnmounted(() => {
    clearInterval(intervalId)
  })
  </script>