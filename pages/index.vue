<template>
    <div class="space-y-8 md:space-y-16">
        <heroComponent data-tour="hero" id="hero"></heroComponent>
        <floralDivider></floralDivider>
        <OurParents data-tour="our-parents"></OurParents>
        <floralDivider></floralDivider>
        <promiseSection data-tour="promise"></promiseSection>
        <floralDivider></floralDivider>
        <div data-tour="carousel"><CarouselComponent class="my-12 md:my-20"></CarouselComponent></div>
        <floralDivider></floralDivider>
        <SaveDateComponent data-tour="save-date"></SaveDateComponent>
        <floralDivider></floralDivider>
        <googleMap data-tour="ubicacion" id="ubicacion"></googleMap>
        <floralDivider></floralDivider>
        <timeLine data-tour="fecha" id="fecha"></timeLine>
        <floralDivider></floralDivider>
        <contactNovios data-tour="informacion" id="informacion"></contactNovios>
        <floralDivider></floralDivider>
        <DressCode data-tour="dressCode" id="dressCode"></DressCode>
        <floralDivider></floralDivider>
        <mesaRegalos data-tour="mesa-regalos"></mesaRegalos>
        <confirmComponent data-tour="confirmacion" id="confirmacion"></confirmComponent>
    </div>
</template>

<script setup>
import { TOURS } from '~/constants/tours'
import { useWeddingConfigStore } from '~/stores/weddingConfig'

const { startTour } = useDriverTour()
const configStore = useWeddingConfigStore()

onMounted(async () => {
  await configStore.fetchConfig()

  const seen = localStorage.getItem('boda_tour_seen') === 'true'
  if (!seen) {
    setTimeout(() => {
      startTour(TOURS.home, {
        onDestroyed: () => {
          localStorage.setItem('boda_tour_seen', 'true')
        },
      })
    }, 1200)
  }
})
</script>
