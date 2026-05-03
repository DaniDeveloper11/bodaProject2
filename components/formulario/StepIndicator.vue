<template>
  <nav aria-label="Progreso del formulario" class="mb-8">
    <ol class="flex items-center w-full">
      <li
        v-for="(step, index) in steps"
        :key="index"
        class="flex items-center"
        :class="index < steps.length - 1 ? 'w-full' : ''"
      >
        <button
          type="button"
          class="flex flex-col items-center gap-1"
          @click="$emit('goToStep', index + 1)"
        >
          <span
            class="flex items-center justify-center w-8 h-8 rounded-full text-xs font-semibold shrink-0 transition-colors"
            :class="stepClass(index + 1)"
          >
            <CheckIcon v-if="index + 1 < currentStep" class="w-4 h-4" />
            <span v-else>{{ index + 1 }}</span>
          </span>
          <span
            class="text-[10px] text-center leading-tight max-w-[60px] hidden sm:block"
            :class="index + 1 === currentStep ? 'text-brand-cyan font-semibold' : 'text-brand-charcoal/50'"
          >
            {{ step }}
          </span>
        </button>
        <div
          v-if="index < steps.length - 1"
          class="flex-1 h-0.5 mx-1"
          :class="index + 1 < currentStep ? 'bg-brand-cyan' : 'bg-brand-sand'"
        />
      </li>
    </ol>
    <p class="mt-3 text-sm text-brand-charcoal/70 sm:hidden text-center">
      Paso {{ currentStep }} de {{ steps.length }}: <span class="font-semibold text-brand-cyan">{{ steps[currentStep - 1] }}</span>
    </p>
  </nav>
</template>

<script setup lang="ts">
import { CheckIcon } from '@heroicons/vue/20/solid'

const props = defineProps<{
  currentStep: number
  steps: string[]
}>()

defineEmits<{
  goToStep: [step: number]
}>()

const stepClass = (step: number) => {
  if (step < props.currentStep) return 'bg-brand-cyan text-white'
  if (step === props.currentStep) return 'bg-brand-cyan text-white ring-2 ring-brand-cyan/30'
  return 'bg-brand-sand text-brand-charcoal/50'
}
</script>
