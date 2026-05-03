<template>
  <div class="space-y-6">
    <h2 class="text-2xl font-dancing text-brand-cyan">Timeline del Evento</h2>
    <p class="text-sm text-brand-charcoal/60">Define los eventos del dia de tu boda en orden cronologico.</p>

    <div class="space-y-4">
      <div
        v-for="(event, index) in form.texts.timeline.events"
        :key="index"
        class="bg-brand-sand/30 rounded-xl p-4 space-y-3"
      >
        <div class="flex items-center justify-between">
          <h3 class="text-sm font-semibold text-brand-charcoal/80">Evento {{ index + 1 }}</h3>
          <button
            v-if="form.texts.timeline.events.length > 1"
            type="button"
            class="text-red-400 hover:text-red-600 text-xs font-medium transition"
            @click="removeEvent(index)"
          >
            Eliminar
          </button>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
          <div>
            <label class="form-label">Hora</label>
            <input v-model="event.time" type="text" class="form-input" placeholder="1:00 PM" />
          </div>
          <div>
            <label class="form-label">Titulo</label>
            <input v-model="event.title" type="text" class="form-input" placeholder="Misa Religiosa" />
          </div>
          <div>
            <label class="form-label">Descripcion</label>
            <input v-model="event.description" type="text" class="form-input" placeholder="Ceremonia religiosa" />
          </div>
        </div>

        <div>
          <label class="form-label">Icono del evento</label>
          <select v-model="event.icon" class="form-input">
            <option value="gettingReady">Preparacion</option>
            <option value="ceremony">Ceremonia</option>
            <option value="reception">Recepcion</option>
            <option value="banquet">Banquete</option>
            <option value="firstDance">Primer Vals</option>
            <option value="party">Fiesta</option>
            <option value="end">Fin</option>
          </select>
        </div>
      </div>
    </div>

    <button
      type="button"
      class="inline-flex items-center gap-2 text-brand-cyan hover:text-brand-cyan/80 text-sm font-medium transition"
      @click="addEvent"
    >
      <PlusIcon class="w-4 h-4" />
      Agregar evento
    </button>
  </div>
</template>

<script setup lang="ts">
import { PlusIcon } from '@heroicons/vue/20/solid'
import type { WeddingConfig } from '~/types/wedding-config'

const props = defineProps<{
  form: WeddingConfig
}>()

const addEvent = () => {
  props.form.texts.timeline.events.push({
    time: '',
    title: '',
    description: '',
    icon: 'ceremony',
  })
}

const removeEvent = (index: number) => {
  props.form.texts.timeline.events.splice(index, 1)
}
</script>
