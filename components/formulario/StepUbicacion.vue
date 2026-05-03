<template>
  <div class="space-y-6">
    <h2 class="text-2xl font-dancing text-brand-cyan">Ubicacion</h2>

    <div>
      <label class="form-label">Ciudad</label>
      <input v-model="form.location.city" type="text" class="form-input" placeholder="Etzatlan Jalisco" />
    </div>

    <!-- Iglesia / Ceremonia -->
    <div class="bg-brand-sand/30 rounded-xl p-4 space-y-4">
      <h3 class="text-sm font-semibold text-brand-charcoal/80">Ceremonia</h3>
      <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div>
          <label class="form-label">Nombre corto</label>
          <input v-model="form.location.church.name" type="text" class="form-input" placeholder="Templo" />
        </div>
        <div>
          <label class="form-label">Nombre completo</label>
          <input v-model="form.location.church.fullName" type="text" class="form-input" placeholder="Templo de la Purisima Concepcion" />
        </div>
        <div>
          <label class="form-label">Latitud</label>
          <input v-model.number="form.location.church.position.lat" type="number" step="any" class="form-input" />
        </div>
        <div>
          <label class="form-label">Longitud</label>
          <input v-model.number="form.location.church.position.lng" type="number" step="any" class="form-input" />
        </div>
        <div class="sm:col-span-2">
          <label class="form-label">URL de Google Maps</label>
          <input v-model="form.location.church.mapsUrl" type="url" class="form-input" placeholder="https://maps.app.goo.gl/..." />
          <p class="text-xs text-brand-charcoal/50 mt-1">Abre Google Maps, busca el lugar, clic en "Compartir" y pega el enlace</p>
        </div>
      </div>
    </div>

    <!-- Recepcion -->
    <div class="bg-brand-sand/30 rounded-xl p-4 space-y-4">
      <h3 class="text-sm font-semibold text-brand-charcoal/80">Recepcion</h3>
      <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div>
          <label class="form-label">Nombre corto</label>
          <input v-model="form.location.reception.name" type="text" class="form-input" placeholder="Recepcion" />
        </div>
        <div>
          <label class="form-label">Nombre completo</label>
          <input v-model="form.location.reception.fullName" type="text" class="form-input" placeholder="El Ranchito, Escobedo #7" />
        </div>
        <div>
          <label class="form-label">Latitud</label>
          <input v-model.number="form.location.reception.position.lat" type="number" step="any" class="form-input" />
        </div>
        <div>
          <label class="form-label">Longitud</label>
          <input v-model.number="form.location.reception.position.lng" type="number" step="any" class="form-input" />
        </div>
        <div class="sm:col-span-2">
          <label class="form-label">URL de Google Maps</label>
          <input v-model="form.location.reception.mapsUrl" type="url" class="form-input" placeholder="https://maps.app.goo.gl/..." />
        </div>
      </div>
    </div>

    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
      <div>
        <label class="form-label">Centro del mapa</label>
        <select v-model="form.location.mapCenter" class="form-input">
          <option value="church">Ceremonia</option>
          <option value="reception">Recepcion</option>
        </select>
      </div>
      <div>
        <label class="form-label">Zoom del mapa (1-20)</label>
        <input v-model.number="form.location.mapZoom" type="number" min="1" max="20" class="form-input" />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import type { WeddingConfig } from '~/types/wedding-config'

defineProps<{
  form: WeddingConfig
}>()
</script>
