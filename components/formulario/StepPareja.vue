<template>
  <div class="space-y-6">
    <h2 class="text-2xl font-dancing text-brand-cyan">Datos de la Pareja</h2>

    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
      <div>
        <label class="form-label">Nombre de ella</label>
        <input v-model="form.couple.name1" type="text" class="form-input" placeholder="Joselyn" />
      </div>
      <div>
        <label class="form-label">Nombre de el</label>
        <input v-model="form.couple.name2" type="text" class="form-input" placeholder="Paul" />
      </div>
      <div>
        <label class="form-label">Nombre completo de ella</label>
        <input v-model="form.couple.fullName1" type="text" class="form-input" placeholder="Nombre completo novia" />
      </div>
      <div>
        <label class="form-label">Nombre completo de el</label>
        <input v-model="form.couple.fullName2" type="text" class="form-input" placeholder="Nombre completo novio" />
      </div>
      <div>
        <label class="form-label">Iniciales (ej: J&P)</label>
        <input v-model="form.couple.initials" type="text" class="form-input" placeholder="J&P" maxlength="5" />
      </div>
      <div>
        <label class="form-label">Fuente para nombres</label>
        <select v-model="form.couple.namesFont" class="form-input">
          <option value="'Alex Brush', cursive">Alex Brush</option>
          <option value="'Dancing Script', cursive">Dancing Script</option>
          <option value="'Pacifico', cursive">Pacifico</option>
          <option value="'Playfair Display', serif">Playfair Display</option>
        </select>
      </div>
    </div>

    <!-- Padres de ella -->
    <div class="bg-brand-sand/30 rounded-xl p-4 space-y-3">
      <h3 class="text-sm font-semibold text-brand-charcoal/80">Padres de ella</h3>
      <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div>
          <label class="form-label">Padre</label>
          <input v-model="form.couple.parentNames1.father" type="text" class="form-input" placeholder="Nombre del padre" />
        </div>
        <div>
          <label class="form-label">Madre</label>
          <input v-model="form.couple.parentNames1.mother" type="text" class="form-input" placeholder="Nombre de la madre" />
        </div>
      </div>
    </div>

    <!-- Padres de el -->
    <div class="bg-brand-sand/30 rounded-xl p-4 space-y-3">
      <h3 class="text-sm font-semibold text-brand-charcoal/80">Padres de el</h3>
      <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div>
          <label class="form-label">Padre</label>
          <input v-model="form.couple.parentNames2.father" type="text" class="form-input" placeholder="Nombre del padre" />
        </div>
        <div>
          <label class="form-label">Madre</label>
          <input v-model="form.couple.parentNames2.mother" type="text" class="form-input" placeholder="Nombre de la madre" />
        </div>
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
