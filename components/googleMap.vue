<template>
  <div class="my-10 mx-auto w-full">
    <h2 class="text-brand-copper font-dancing text-5xl text-center my-8">
      {{ weddingConfig.location.city }}
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
import { ref, onMounted } from "vue";
import { ArrowUpRightIcon } from "@heroicons/vue/20/solid";
import weddingConfig from '~/wedding.config'

const place = ref("");
const placeUbication = ref("");
const runtimeConfig = useRuntimeConfig();

const locations = [
  {
    name: weddingConfig.location.church.name,
    position: weddingConfig.location.church.position,
    icon: weddingConfig.location.church.icon,
    place: weddingConfig.location.church.fullName,
    howtoarrive: weddingConfig.location.church.mapsUrl,
    markerIcon: "https://maps.google.com/mapfiles/ms/icons/red-dot.png",
  },
  {
    name: weddingConfig.location.reception.name,
    position: weddingConfig.location.reception.position,
    icon: weddingConfig.location.reception.icon,
    place: weddingConfig.location.reception.fullName,
    howtoarrive: weddingConfig.location.reception.mapsUrl,
    markerIcon: "https://maps.google.com/mapfiles/ms/icons/blue-dot.png",
  },
];

let map: google.maps.Map;

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

function focusLocation(location: (typeof locations)[0]) {
  place.value = location.place;
  placeUbication.value = location.howtoarrive;
  map.setCenter(location.position);
  map.setZoom(16);
}

onMounted(async () => {
  await loadGoogleMapsScript();

  const el = document.getElementById("map");
  if (!el) return;

  const centerLocation = weddingConfig.location.mapCenter === 'church'
    ? weddingConfig.location.church.position
    : weddingConfig.location.reception.position

  map = new google.maps.Map(el, {
    center: centerLocation,
    zoom: weddingConfig.location.mapZoom,
  });

  locations.forEach((loc) => {
    new google.maps.Marker({
      position: loc.position,
      map,
      title: loc.name,
      icon: loc.markerIcon,
    });
  });
});
</script>