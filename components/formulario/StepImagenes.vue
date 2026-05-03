<template>
  <div class="space-y-6">
    <h2 class="text-2xl font-dancing text-brand-cyan">Imagenes</h2>
    <p class="text-sm text-brand-charcoal/60">Sube las fotos para personalizar tu invitacion. Formato recomendado: WebP o JPG.</p>

    <!-- Hero -->
    <div class="bg-brand-sand/30 rounded-xl p-4 space-y-3">
      <h3 class="text-sm font-semibold text-brand-charcoal/80">Foto Principal (Hero)</h3>
      <FormularioImageUploader
        label="Foto de portada"
        hint="Imagen horizontal, minimo 1200px de ancho"
        accept="image/*"
        :current-path="form.images.hero"
        :uploading="uploadingField === 'images.hero'"
        @upload="(files) => handleUpload(files, 'images.hero', (path) => form.images.hero = path)"
      />
    </div>

    <!-- Fotos individuales -->
    <div class="bg-brand-sand/30 rounded-xl p-4 space-y-3">
      <h3 class="text-sm font-semibold text-brand-charcoal/80">Fotos Individuales</h3>
      <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <FormularioImageUploader
          label="Foto de ella"
          hint="Foto individual de la novia"
          accept="image/*"
          :current-path="form.images.novia"
          :uploading="uploadingField === 'images.novia'"
          @upload="(files) => handleUpload(files, 'images.novia', (path) => form.images.novia = path)"
        />
        <FormularioImageUploader
          label="Foto de el"
          hint="Foto individual del novio"
          accept="image/*"
          :current-path="form.images.novio"
          :uploading="uploadingField === 'images.novio'"
          @upload="(files) => handleUpload(files, 'images.novio', (path) => form.images.novio = path)"
        />
      </div>
    </div>

    <!-- Historia -->
    <div class="bg-brand-sand/30 rounded-xl p-4 space-y-3">
      <h3 class="text-sm font-semibold text-brand-charcoal/80">Foto de la Historia</h3>
      <FormularioImageUploader
        label="Foto seccion historia/promesa"
        hint="Foto de pareja para la seccion de historia"
        accept="image/*"
        :current-path="form.images.promise"
        :uploading="uploadingField === 'images.promise'"
        @upload="(files) => handleUpload(files, 'images.promise', (path) => form.images.promise = path)"
      />
    </div>

    <!-- Carousel -->
    <div class="bg-brand-sand/30 rounded-xl p-4 space-y-3">
      <h3 class="text-sm font-semibold text-brand-charcoal/80">Galeria de Fotos (Carousel)</h3>
      <p class="text-xs text-brand-charcoal/50">Sube hasta 12 fotos de la pareja para la galeria</p>

      <div class="grid grid-cols-2 sm:grid-cols-4 gap-3">
        <div v-for="(img, idx) in form.images.carousel" :key="idx" class="relative group">
          <img :src="img" class="w-full h-24 object-cover rounded-lg" />
          <button
            type="button"
            class="absolute -top-2 -right-2 bg-red-500 text-white rounded-full w-5 h-5 text-xs flex items-center justify-center opacity-0 group-hover:opacity-100 transition"
            @click="removeCarouselImage(idx)"
          >
            x
          </button>
        </div>
      </div>

      <FormularioImageUploader
        label="Agregar fotos al carousel"
        hint="Selecciona una o varias fotos"
        accept="image/*"
        :multiple="true"
        :uploading="uploadingField === 'images.carousel'"
        @upload="(files) => handleCarouselUpload(files)"
      />
    </div>

    <!-- Dress Code -->
    <div class="bg-brand-sand/30 rounded-xl p-4 space-y-3">
      <h3 class="text-sm font-semibold text-brand-charcoal/80">Dress Code - Ejemplos</h3>
      <FormularioImageUploader
        label="Fotos ejemplo vestimenta"
        hint="Fotos de ejemplo de dress code (se asignaran automaticamente)"
        accept="image/*"
        :current-path="form.images.dressCodeImg"
        :uploading="uploadingField === 'images.dressCodeImg'"
        @upload="(files) => handleUpload(files, 'images.dressCodeImg', (path) => form.images.dressCodeImg = path)"
      />
    </div>
  </div>
</template>

<script setup lang="ts">
import type { WeddingConfig } from '~/types/wedding-config'
import { useWeddingConfigStore } from '~/stores/weddingConfig'

const props = defineProps<{
  form: WeddingConfig
}>()

const configStore = useWeddingConfigStore()
const uploadingField = ref<string | null>(null)

const handleUpload = async (files: File[], fieldKey: string, setter: (path: string) => void) => {
  if (files.length === 0) return
  uploadingField.value = fieldKey
  try {
    const path = await configStore.uploadImage(files[0], fieldKey)
    setter(path)
  } catch (err) {
    alert('Error al subir la imagen')
  } finally {
    uploadingField.value = null
  }
}

const handleCarouselUpload = async (files: File[]) => {
  uploadingField.value = 'images.carousel'
  try {
    for (const file of files) {
      const path = await configStore.uploadImage(file, 'images.carousel')
      props.form.images.carousel.push(path)
    }
  } catch (err) {
    alert('Error al subir imagenes del carousel')
  } finally {
    uploadingField.value = null
  }
}

const removeCarouselImage = (index: number) => {
  props.form.images.carousel.splice(index, 1)
}
</script>
