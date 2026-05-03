<template>
  <div class="space-y-2">
    <label v-if="label" class="block text-sm font-medium text-brand-charcoal">{{ label }}</label>
    <div
      class="relative border-2 border-dashed rounded-xl p-4 text-center transition-colors cursor-pointer"
      :class="dragOver ? 'border-brand-cyan bg-brand-cyan/5' : 'border-brand-sand hover:border-brand-cyan/50'"
      @dragover.prevent="dragOver = true"
      @dragleave="dragOver = false"
      @drop.prevent="handleDrop"
      @click="openFileDialog"
    >
      <input
        ref="fileInput"
        type="file"
        :accept="accept"
        :multiple="multiple"
        class="hidden"
        @change="handleFileSelect"
      />

      <!-- Preview -->
      <div v-if="previewUrls.length > 0" class="flex flex-wrap gap-3 justify-center mb-3">
        <div v-for="(url, idx) in previewUrls" :key="idx" class="relative group">
          <img :src="url" class="w-20 h-20 object-cover rounded-lg" />
          <button
            type="button"
            class="absolute -top-2 -right-2 bg-red-500 text-white rounded-full w-5 h-5 text-xs flex items-center justify-center opacity-0 group-hover:opacity-100 transition"
            @click.stop="removeImage(idx)"
          >
            x
          </button>
        </div>
      </div>

      <!-- Current value preview (from config path) -->
      <div v-else-if="currentPath" class="mb-3">
        <img :src="currentPath" class="w-20 h-20 object-cover rounded-lg mx-auto" />
        <p class="text-xs text-brand-charcoal/50 mt-1">Imagen actual</p>
      </div>

      <div class="text-sm text-brand-charcoal/60">
        <PhotoIcon class="w-8 h-8 mx-auto mb-1 text-brand-charcoal/30" />
        <p>Arrastra una imagen o <span class="text-brand-cyan font-medium">haz clic para seleccionar</span></p>
        <p class="text-xs mt-1">{{ hint }}</p>
      </div>

      <!-- Upload progress -->
      <div v-if="uploading" class="mt-2">
        <div class="h-1.5 bg-brand-sand rounded-full overflow-hidden">
          <div class="h-full bg-brand-cyan rounded-full animate-pulse" style="width: 60%" />
        </div>
        <p class="text-xs text-brand-cyan mt-1">Subiendo...</p>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { PhotoIcon } from '@heroicons/vue/24/outline'

const props = defineProps<{
  label?: string
  accept?: string
  multiple?: boolean
  hint?: string
  currentPath?: string
  uploading?: boolean
}>()

const emit = defineEmits<{
  upload: [files: File[]]
  remove: [index: number]
}>()

const fileInput = ref<HTMLInputElement | null>(null)
const dragOver = ref(false)
const previewUrls = ref<string[]>([])

const openFileDialog = () => {
  fileInput.value?.click()
}

const handleFiles = (files: FileList | File[]) => {
  const fileArray = Array.from(files)
  previewUrls.value = fileArray.map((f) => URL.createObjectURL(f))
  emit('upload', fileArray)
}

const handleFileSelect = (e: Event) => {
  const input = e.target as HTMLInputElement
  if (input.files) handleFiles(input.files)
}

const handleDrop = (e: DragEvent) => {
  dragOver.value = false
  if (e.dataTransfer?.files) handleFiles(e.dataTransfer.files)
}

const removeImage = (index: number) => {
  previewUrls.value.splice(index, 1)
  emit('remove', index)
}

onBeforeUnmount(() => {
  previewUrls.value.forEach((url) => URL.revokeObjectURL(url))
})
</script>
