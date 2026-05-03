<template>
  <div class="space-y-6">
    <h2 class="text-2xl font-dancing text-brand-cyan">Fecha y Hora</h2>

    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
      <div>
        <label class="form-label">Fecha y hora de la boda</label>
        <input
          v-model="form.date.weddingDate"
          type="datetime-local"
          class="form-input"
        />
        <p class="text-xs text-brand-charcoal/50 mt-1">Esta fecha se usa para el countdown</p>
      </div>
      <div>
        <label class="form-label">Fecha para mostrar (formato libre)</label>
        <input v-model="form.date.displayDate" type="text" class="form-input" placeholder="04/10/2026" />
      </div>
      <div>
        <label class="form-label">Mes y anio del calendario</label>
        <input v-model="form.date.calendarMonthYear" type="text" class="form-input" placeholder="Octubre 2026" />
      </div>
      <div>
        <label class="form-label">Fecha limite RSVP</label>
        <input v-model="form.date.rsvpDeadline" type="text" class="form-input" placeholder="31 de Agosto del 2025" />
      </div>
      <div>
        <label class="form-label">Fecha del calendario (YYYY-MM-DD)</label>
        <input v-model="form.date.calendarSelectedDate" type="date" class="form-input" />
      </div>
    </div>

    <!-- Preview -->
    <div class="bg-brand-sand/30 rounded-xl p-4">
      <h3 class="text-sm font-semibold text-brand-charcoal/80 mb-2">Vista previa</h3>
      <p class="text-brand-charcoal/70 text-sm">
        La boda sera el <strong>{{ form.date.displayDate }}</strong>.
        Los invitados deben confirmar antes del <strong>{{ form.date.rsvpDeadline }}</strong>.
      </p>
    </div>
  </div>
</template>

<script setup lang="ts">
import type { WeddingConfig } from '~/types/wedding-config'

defineProps<{
  form: WeddingConfig
}>()
</script>
