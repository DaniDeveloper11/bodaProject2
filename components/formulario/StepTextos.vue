<template>
  <div class="space-y-6">
    <h2 class="text-2xl font-dancing text-brand-cyan">Textos y Mensajes</h2>

    <!-- Historia de amor -->
    <div class="bg-brand-sand/30 rounded-xl p-4 space-y-3">
      <h3 class="text-sm font-semibold text-brand-charcoal/80">Historia de Amor</h3>
      <div>
        <label class="form-label">Titulo</label>
        <input v-model="form.texts.promise.title" type="text" class="form-input" placeholder="UNA PROMESA PARA TODA LA VIDA" />
      </div>
      <div>
        <label class="form-label">Su historia</label>
        <textarea v-model="form.texts.promise.text" rows="4" class="form-input" placeholder="Nos conocimos en..." />
      </div>
    </div>

    <!-- Introduccion padres -->
    <div>
      <label class="form-label">Texto de introduccion de los padres</label>
      <textarea v-model="form.texts.parentsIntro" rows="2" class="form-input" placeholder="Con nuestro amor y con la presencia de Dios..." />
    </div>

    <!-- Dress Code -->
    <div class="bg-brand-sand/30 rounded-xl p-4 space-y-3">
      <h3 class="text-sm font-semibold text-brand-charcoal/80">Codigo de Vestimenta</h3>
      <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div>
          <label class="form-label">Nivel de formalidad</label>
          <select v-model="form.texts.dressCode.level" class="form-input">
            <option value="Formal">Formal</option>
            <option value="Semi-Formal">Semi-Formal</option>
            <option value="Casual Elegante">Casual Elegante</option>
            <option value="Casual">Casual</option>
          </select>
        </div>
        <div>
          <label class="form-label">Introduccion</label>
          <input v-model="form.texts.dressCode.intro" type="text" class="form-input" />
        </div>
      </div>

      <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div class="space-y-3">
          <h4 class="text-xs font-medium text-brand-charcoal/60">Ellas</h4>
          <div>
            <label class="form-label">Descripcion</label>
            <input v-model="form.texts.dressCode.womenDescription" type="text" class="form-input" />
          </div>
          <div>
            <label class="form-label">Restricciones de color</label>
            <input v-model="form.texts.dressCode.womenRestriction" type="text" class="form-input" placeholder="No Negro, Lila o Rojo" />
          </div>
        </div>
        <div class="space-y-3">
          <h4 class="text-xs font-medium text-brand-charcoal/60">Ellos</h4>
          <div>
            <label class="form-label">Descripcion</label>
            <input v-model="form.texts.dressCode.menDescription" type="text" class="form-input" />
          </div>
          <div>
            <label class="form-label">Restricciones de color</label>
            <input v-model="form.texts.dressCode.menRestriction" type="text" class="form-input" placeholder="No Verde olivo" />
          </div>
        </div>
      </div>

      <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div>
          <label class="form-label">Sugerencia de baile</label>
          <input v-model="form.texts.dressCode.danceSuggestion" type="text" class="form-input" placeholder="Sugerimos Tenis" />
        </div>
      </div>
    </div>

    <!-- Confirmacion -->
    <div class="bg-brand-sand/30 rounded-xl p-4 space-y-3">
      <h3 class="text-sm font-semibold text-brand-charcoal/80">Pagina de Confirmacion</h3>
      <div>
        <label class="form-label">Mensaje para familias</label>
        <textarea v-model="form.texts.confirmPage.familyMessage" rows="2" class="form-input" />
      </div>
      <div>
        <label class="form-label">Mensaje para acompanantes</label>
        <textarea v-model="form.texts.confirmPage.companionMessage" rows="2" class="form-input" />
      </div>
      <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div>
          <label class="form-label">Aviso adultos</label>
          <input v-model="form.texts.confirmPage.adultsOnly" type="text" class="form-input" />
        </div>
        <div>
          <label class="form-label">Link "Por que?" adultos</label>
          <input v-model="form.texts.confirmPage.adultsOnlyLink" type="url" class="form-input" />
        </div>
      </div>
    </div>

    <!-- Footer -->
    <div>
      <label class="form-label">Texto del footer</label>
      <input v-model="form.texts.footer" type="text" class="form-input" placeholder="© 2025 Realizado por..." />
    </div>
  </div>
</template>

<script setup lang="ts">
import type { WeddingConfig } from '~/types/wedding-config'

defineProps<{
  form: WeddingConfig
}>()
</script>
