<template>
  <div class="space-y-6">
    <h2 class="text-2xl font-dancing text-brand-cyan">Contacto, Banco y Regalos</h2>

    <!-- Contacto Novio -->
    <div class="bg-brand-sand/30 rounded-xl p-4 space-y-3">
      <h3 class="text-sm font-semibold text-brand-charcoal/80">Contacto del Novio</h3>
      <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div>
          <label class="form-label">Etiqueta</label>
          <input v-model="form.contact.groom.label" type="text" class="form-input" placeholder="Contacta al Novio" />
        </div>
        <div>
          <label class="form-label">Telefono (formato display)</label>
          <input v-model="form.contact.groom.phone" type="tel" class="form-input" placeholder="+52 3314857062" />
        </div>
        <div>
          <label class="form-label">Telefono WhatsApp (sin +)</label>
          <input v-model="form.contact.groom.phoneRaw" type="text" class="form-input" placeholder="5213314857062" />
        </div>
        <div class="sm:col-span-2">
          <label class="form-label">Mensaje pre-llenado de WhatsApp</label>
          <input v-model="form.contact.groom.whatsappMessage" type="text" class="form-input" placeholder="Hola, queria contactarlos por su boda!" />
        </div>
      </div>
    </div>

    <!-- Contacto Novia -->
    <div class="bg-brand-sand/30 rounded-xl p-4 space-y-3">
      <h3 class="text-sm font-semibold text-brand-charcoal/80">Contacto de la Novia</h3>
      <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div>
          <label class="form-label">Etiqueta</label>
          <input v-model="form.contact.bride.label" type="text" class="form-input" placeholder="Contacta a la Novia" />
        </div>
        <div>
          <label class="form-label">Telefono (formato display)</label>
          <input v-model="form.contact.bride.phone" type="tel" class="form-input" placeholder="+52 3334001701" />
        </div>
        <div>
          <label class="form-label">Telefono WhatsApp (sin +)</label>
          <input v-model="form.contact.bride.phoneRaw" type="text" class="form-input" placeholder="5213334001701" />
        </div>
        <div class="sm:col-span-2">
          <label class="form-label">Mensaje pre-llenado de WhatsApp</label>
          <input v-model="form.contact.bride.whatsappMessage" type="text" class="form-input" placeholder="Hola, queria contactarlos por su boda!" />
        </div>
      </div>
    </div>

    <!-- Banco -->
    <div class="bg-brand-sand/30 rounded-xl p-4 space-y-3">
      <h3 class="text-sm font-semibold text-brand-charcoal/80">Datos Bancarios</h3>
      <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div>
          <label class="form-label">Banco</label>
          <input v-model="form.bank.name" type="text" class="form-input" placeholder="BBVA" />
        </div>
        <div>
          <label class="form-label">Titular</label>
          <input v-model="form.bank.holder" type="text" class="form-input" placeholder="Nombre del titular" />
        </div>
        <div>
          <label class="form-label">Numero de cuenta</label>
          <input v-model="form.bank.accountNumber" type="text" class="form-input" placeholder="2760430461" />
        </div>
        <div>
          <label class="form-label">Concepto</label>
          <input v-model="form.bank.concept" type="text" class="form-input" placeholder="Regalo de bodas" />
        </div>
      </div>
    </div>

    <!-- Mesa de regalos -->
    <div class="bg-brand-sand/30 rounded-xl p-4 space-y-3">
      <h3 class="text-sm font-semibold text-brand-charcoal/80">Mesa de Regalos</h3>
      <div class="space-y-4">
        <div>
          <label class="form-label">URL Mesa de Regalos Liverpool</label>
          <input v-model="form.gifts.liverpoolUrl" type="url" class="form-input" placeholder="https://mesaderegalos.liverpool.com.mx/..." />
        </div>
        <div>
          <label class="form-label">URL Mesa de Regalos Alternativa</label>
          <input v-model="form.gifts.liverpoolUrlAlt" type="url" class="form-input" placeholder="https://mesaderegalos.liverpool.com.mx/..." />
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
