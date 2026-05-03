<template>
  <div class="flex justify-between items-center mt-8 pt-6 border-t border-brand-sand">
    <button
      v-if="currentStep > 1"
      type="button"
      class="inline-flex items-center gap-2 bg-brand-cyan/10 hover:bg-brand-cyan/20 text-brand-cyan border border-brand-cyan/30 font-semibold py-2.5 px-5 rounded-xl transition"
      @click="$emit('prev')"
    >
      <ArrowLeftIcon class="w-4 h-4" />
      Anterior
    </button>
    <div v-else />

    <div class="flex gap-3">
      <button
        type="button"
        class="inline-flex items-center gap-2 bg-brand-agave/10 hover:bg-brand-agave/20 text-brand-agave border border-brand-agave/30 font-semibold py-2.5 px-5 rounded-xl transition"
        :disabled="saving"
        @click="$emit('save')"
      >
        <span v-if="saving">Guardando...</span>
        <span v-else>Guardar</span>
      </button>

      <button
        v-if="currentStep < totalSteps"
        type="button"
        class="inline-flex items-center gap-2 bg-brand-cyan hover:bg-brand-cyan/90 text-white font-semibold py-2.5 px-5 rounded-xl shadow transition"
        @click="$emit('next')"
      >
        Siguiente
        <ArrowRightIcon class="w-4 h-4" />
      </button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ArrowLeftIcon, ArrowRightIcon } from '@heroicons/vue/20/solid'

defineProps<{
  currentStep: number
  totalSteps: number
  showSave?: boolean
  saving?: boolean
}>()

defineEmits<{
  prev: []
  next: []
  save: []
  submit: []
}>()
</script>
