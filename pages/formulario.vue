<template>
  <div class="min-h-screen bg-brand-cream">
    <div class="max-w-3xl mx-auto px-4 py-8">
      <!-- Header -->
      <div class="text-center mb-8">
        <h1 class="text-4xl font-dancing text-brand-cyan mb-2">Personaliza tu Boda</h1>
        <p class="text-sm text-brand-charcoal/60">Completa los datos para crear tu invitacion de boda</p>
        <p v-if="formStore.lastSaved" class="text-xs text-brand-agave mt-1">
          Ultimo guardado: {{ new Date(formStore.lastSaved).toLocaleString() }}
        </p>
      </div>

      <!-- Step Indicator -->
      <FormularioStepIndicator
        :current-step="formStore.currentStep"
        :steps="stepLabels"
        @go-to-step="formStore.setStep"
      />

      <!-- Alert -->
      <div v-if="message" class="mb-4 rounded-xl px-4 py-3 text-sm" :class="messageType === 'success' ? 'bg-green-50 text-green-700 border border-green-200' : 'bg-red-50 text-red-700 border border-red-200'">
        {{ message }}
      </div>

      <!-- Form Card -->
      <div class="bg-white rounded-2xl shadow-sm border border-brand-sand p-6">
        <FormularioStepPareja v-if="formStore.currentStep === 1" :form="formStore.formData" />
        <FormularioStepFecha v-else-if="formStore.currentStep === 2" :form="formStore.formData" />
        <FormularioStepUbicacion v-else-if="formStore.currentStep === 3" :form="formStore.formData" />
        <FormularioStepContacto v-else-if="formStore.currentStep === 4" :form="formStore.formData" />
        <FormularioStepTimeline v-else-if="formStore.currentStep === 5" :form="formStore.formData" />
        <FormularioStepTextos v-else-if="formStore.currentStep === 6" :form="formStore.formData" />
        <FormularioStepImagenes v-else-if="formStore.currentStep === 7" :form="formStore.formData" />
      </div>

      <!-- Navigation -->
      <FormularioFormNavigation
        :current-step="formStore.currentStep"
        :total-steps="formStore.totalSteps"
        :show-save="formStore.dirty"
        :saving="saving"
        @prev="formStore.prevStep()"
        @next="formStore.nextStep()"
        @save="saveDraft"
        @submit="submitForm"
      />

      <!-- Back to site -->
      <div class="text-center mt-8">
        <NuxtLink to="/" class="text-sm text-brand-charcoal/50 hover:text-brand-cyan transition">
          ← Volver al sitio
        </NuxtLink>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { useWeddingFormStore } from '~/stores/weddingForm'
import { useWeddingConfigStore } from '~/stores/weddingConfig'

useHead({
  title: 'Personaliza tu Boda',
  meta: [
    { name: 'robots', content: 'noindex, nofollow' },
  ],
})

const formStore = useWeddingFormStore()
const configStore = useWeddingConfigStore()

const saving = ref(false)
const message = ref('')
const messageType = ref<'success' | 'error'>('success')

const stepLabels = [
  'Pareja',
  'Fecha',
  'Ubicacion',
  'Contacto',
  'Timeline',
  'Textos',
  'Imagenes',
]

// Load existing config from DB if available
const initialized = ref(false)

onMounted(async () => {
  if (!formStore.dirty) {
    await configStore.fetchConfig()
    if (configStore.config) {
      formStore.loadFromConfig(configStore.config)
    }
  }
  // Wait a tick so the watch doesn't trigger from loadFromConfig
  await nextTick()
  initialized.value = true
})

// Detect changes from v-model mutations (only after initial load)
watch(() => formStore.formData, () => {
  if (initialized.value) {
    formStore.dirty = true
  }
}, { deep: true })

const showMessage = (text: string, type: 'success' | 'error') => {
  message.value = text
  messageType.value = type
  setTimeout(() => { message.value = '' }, 4000)
}

const saveDraft = async () => {
  saving.value = true
  try {
    await configStore.saveConfig(formStore.formData)
    formStore.markSaved()
    showMessage('Borrador guardado con exito', 'success')
  } catch {
    showMessage('Error al guardar el borrador', 'error')
  } finally {
    saving.value = false
  }
}

const submitForm = async () => {
  saving.value = true
  console.log("test")
  try {
    await configStore.saveConfig(formStore.formData)
    formStore.markSaved()
    showMessage('Configuracion guardada con exito. Tu invitacion ya esta actualizada.', 'success')
  } catch {
    showMessage('Error al guardar la configuracion', 'error')
  } finally {
    saving.value = false
  }
}
</script>

<style scoped>
:deep(.form-label) {
  @apply block text-sm font-medium text-brand-charcoal/80 mb-1;
}

:deep(.form-input) {
  @apply w-full rounded-xl border border-brand-sand px-3 py-2 text-sm text-brand-charcoal
    focus:border-brand-cyan focus:ring-1 focus:ring-brand-cyan focus:outline-none
    placeholder:text-brand-charcoal/30 bg-white;
}

:deep(textarea.form-input) {
  @apply resize-y;
}

:deep(select.form-input) {
  @apply appearance-none bg-white;
}
</style>
