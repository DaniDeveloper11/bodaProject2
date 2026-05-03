<template>
  <div class="my-10 mx-auto w-full">
    <h2 class="text-brand-copper font-dancing text-5xl text-center my-8">
      {{ cityName }}
    </h2>
    <div id="map" class="w-full h-[400px] rounded-2xl shadow" />
    <div class="flex justify-center gap-4 mt-4 w-full">
      <button v-for="(location, index) in locations" :key="index" @click="focusLocation(location)" type="button"
        class="flex justify-center items-center gap-x-1.5 rounded-md bg-brand-cyan px-2.5 py-1.5 text-sm font-semibold text-white shadow-sm hover:bg-brand-cyan/80 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-brand-cyan">

        <NuxtImg sizes="20" :src="location.icon"></NuxtImg>
        {{ location.name }}
      </button>
    </div>
    <p class="text-center text-lg font-lora my-4 text-gray-600">{{ place }}</p>
<div v-if="placeUbication" class="flex justify-center">
  <a :href="placeUbication" target="_blank">
    <button
      type="button"
      class="rounded-full bg-brand-agave px-4 py-2 text-white shadow hover:bg-brand-agave/80 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-brand-agave flex items-center gap-2"
    >
      <span class="text-sm font-medium">¿Cómo llegar?</span>
      <ArrowUpRightIcon class="w-6 h-6" aria-hidden="true" />

    </button>
  </a>
</div>

  </div>
</template>

<script setup lang="ts">
import { ref, watchEffect } from "vue";
import { ArrowUpRightIcon } from "@heroicons/vue/20/solid";
import { useWeddingConfigStore } from '~/stores/weddingConfig'

const configStore = useWeddingConfigStore()
const place = ref("");
const placeUbication = ref("");
const runtimeConfig = useRuntimeConfig();

const locationData = computed(() => configStore.config?.location)
const cityName = computed(() => locationData.value?.city ?? '')

const locations = computed(() => {
  const loc = locationData.value
  if (!loc) return []
  return [
    {
      name: loc.church.name,
      position: loc.church.position,
      icon: loc.church.icon,
      place: loc.church.fullName,
      howtoarrive: loc.church.mapsUrl,
      markerIcon: "https://maps.google.com/mapfiles/ms/icons/red-dot.png",
    },
    {
      name: loc.reception.name,
      position: loc.reception.position,
      icon: loc.reception.icon,
      place: loc.reception.fullName,
      howtoarrive: loc.reception.mapsUrl,
      markerIcon: "https://maps.google.com/mapfiles/ms/icons/blue-dot.png",
    },
  ]
})

let map: google.maps.Map | null = null;

function loadGoogleMapsScript(): Promise<void> {
  return new Promise((resolve, reject) => {
    if (window.google && window.google.maps) {
      resolve();
      return;
    }

    const script = document.createElement("script");
    script.src = `https://maps.googleapis.com/maps/api/js?key=${runtimeConfig.public.googleMapsApiKey}&libraries=places&callback=initMap`;
    script.async = true;
    script.defer = true;
    script.onerror = () => reject("Google Maps failed to load");
    document.head.appendChild(script);

    (window as any).initMap = () => resolve();
  });
}

function focusLocation(location: (typeof locations.value)[0]) {
  place.value = location.place;
  placeUbication.value = location.howtoarrive;
  if (map) {
    map.setCenter(location.position);
    map.setZoom(16);
  }
}

function initMap() {
  const el = document.getElementById("map")
  if (!el || !window.google?.maps) return

  const loc = locationData.value
  if (!loc) return

  const centerLocation = loc.mapCenter === 'church'
    ? loc.church.position
    : loc.reception.position

  if (map) {
    map.setCenter(centerLocation)
    map.setZoom(loc.mapZoom ?? 14)
    map.clearMarkers?.()
  } else {
    map = new google.maps.Map(el, {
      center: centerLocation,
      zoom: loc.mapZoom ?? 14,
    })
  }

  locations.value.forEach((locItem) => {
    new google.maps.Marker({
      position: locItem.position,
      map,
      title: locItem.name,
      icon: locItem.markerIcon,
    })
  })
}

watchEffect(async () => {
  const loc = locationData.value
  if (!loc) return
  
  try {
    await loadGoogleMapsScript()
    initMap()
  } catch (e) {
    console.error('Map initialization failed:', e)
  }
})
</script>