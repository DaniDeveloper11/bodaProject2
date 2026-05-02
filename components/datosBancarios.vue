<template>
<div class="max-w-md mx-auto mt-8">
    <div class="overflow-hidden rounded-2xl bg-white border border-brand-sand shadow-xl">
        <div class="px-6 py-6 sm:p-8 flex flex-col gap-4">
            <p class="text-brand-charcoal"><strong class="text-brand-cyan">Banco:</strong> {{ bankName }}</p>
            <p class="text-brand-charcoal"><strong class="text-brand-cyan">Titular:</strong> {{ accountHolder }}</p>
            <p class="text-brand-charcoal"><strong class="text-brand-cyan">Concepto:</strong> "{{ weddingConfig.bank.concept }}"</p>
            <p class="flex items-center gap-3 text-brand-charcoal">
                <strong class="text-brand-cyan">Cuenta:</strong>
                <span class="font-mono text-sm bg-brand-sky px-2 py-0.5 rounded text-brand-charcoal">{{ accountNumber }}</span>
                <button @click="copyToClipboard(accountNumber)"
                    class="text-brand-cyan hover:text-brand-cyan/70 text-sm font-semibold transition">
                    {{ weddingConfig.texts.copy }}
                </button>
            </p>
            <p v-if="copied" class="text-green-500 text-sm text-center font-medium">{{ weddingConfig.texts.copied }}</p>
        </div>
    </div>
</div>

</template>

<script setup>
import { ref } from 'vue'
import weddingConfig from '~/wedding.config'

const props = defineProps({
    bankName: { type: String, required: true },
    accountHolder: { type: String, required: true },
    accountNumber: { type: String, required: true },
})

const copied = ref(false)

function copyToClipboard(text) {
    navigator.clipboard.writeText(text).then(() => {
        copied.value = true
        setTimeout(() => (copied.value = false), 2000)
    })
}
</script>