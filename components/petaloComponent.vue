<template>
    <div class="petalos-container pointer-events-none">
      <span
        v-for="(petalo, index) in petalos"
        :key="index"
        :class="petalo.type === 'agave' ? 'petalo-agave' : 'petalo'"
        :style="{
          left: petalo.left + '%',
          animationDuration: petalo.duration + 's',
          animationDelay: petalo.delay + 's',
          transform: `rotate(${petalo.rotation}deg)`,
          backgroundImage: petalo.type === 'petalo' ? `url(${weddingConfig.images.petalo})` : 'none'
        }"
      >
        <svg
          v-if="petalo.type === 'agave'"
          viewBox="0 0 40 50"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
          class="agave-leaf-svg"
        >
          <path d="M20 50 Q16 35 12 25 Q8 15 4 10 Q2 7 0 5 Q8 8 12 5 Q16 2 20 0 Q24 2 28 5 Q32 8 40 5 Q38 7 36 10 Q32 15 28 25 Q24 35 20 50Z" fill="#2D6A5A" opacity="0.7"/>
          <path d="M20 50 Q18 38 15 28 Q12 20 8 14 Q12 18 16 12 Q18 8 20 4 Q22 8 24 12 Q28 18 32 14 Q28 20 25 28 Q22 38 20 50Z" fill="#2D6A5A" opacity="0.3"/>
        </svg>
      </span>
    </div>
  </template>
  
<script setup lang="ts">
import { ref, onMounted } from 'vue'
import weddingConfig from '~/wedding.config'

interface Petalo {
  left: number
  duration: number
  delay: number
  rotation: number
  type: 'petalo' | 'agave'
}

const TOTAL_DESKTOP_PETALOS = 22
const TOTAL_DESKTOP_AGAVE = 8
const TOTAL_MOBILE_PETALOS = 10
const TOTAL_MOBILE_AGAVE = 5
const petalos = ref<Petalo[]>([])

onMounted(() => {
  const isMobile = window.innerWidth < 768
  const petaloCount = isMobile ? TOTAL_MOBILE_PETALOS : TOTAL_DESKTOP_PETALOS
  const agaveCount = isMobile ? TOTAL_MOBILE_AGAVE : TOTAL_DESKTOP_AGAVE

  const items: Petalo[] = []

  for (let i = 0; i < petaloCount; i++) {
    items.push({
      left: Math.random() * 100,
      duration: 6 + Math.random() * 5,
      delay: Math.random() * 5,
      rotation: Math.random() * 360,
      type: 'petalo'
    })
  }

  for (let i = 0; i < agaveCount; i++) {
    items.push({
      left: Math.random() * 100,
      duration: 8 + Math.random() * 6,
      delay: Math.random() * 7,
      rotation: Math.random() * 360,
      type: 'agave'
    })
  }

  petalos.value = items
})
</script>
  
<style scoped>
.petalos-container {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  overflow: hidden;
  z-index: 50;
  pointer-events: none;
}

.petalo {
  position: absolute;
  top: -40px;
  width: 30px;
  height: 30px;
  background-size: cover;
  background-repeat: no-repeat;
  opacity: 0.8;
  animation-name: caer;
  animation-timing-function: linear;
  animation-iteration-count: infinite;
}

.petalo-agave {
  position: absolute;
  top: -50px;
  width: 24px;
  height: 30px;
  opacity: 0.6;
  animation-name: caer;
  animation-timing-function: linear;
  animation-iteration-count: infinite;
}

.agave-leaf-svg {
  width: 100%;
  height: 100%;
}

@keyframes caer {
  0% {
    transform: translateY(0) rotate(0deg);
    opacity: 1;
  }
  100% {
    transform: translateY(110vh) rotate(360deg);
    opacity: 0;
  }
}
</style>