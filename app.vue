<template>
  <div class="transition-colors duration-500 ease-in-out bg-brand-cream">

    <NuxtLayout>
      <NuxtPage />
    </NuxtLayout>

    <ClientOnly>
      <tourButton />
    </ClientOnly>

  </div>
</template>

<script setup>
const colorMode = useColorMode()
colorMode.value = 'light'
</script>

<style>
/* Driver.js popover – brand theme */
.mi-app-driver-popover {
  background-color: #FDFCF8 !important;
  color: #1E293B !important;
  border: 1px solid #0E7490 !important;
  border-radius: 12px !important;
  box-shadow: 0 4px 20px rgba(14, 116, 144, 0.15) !important;
}

.mi-app-driver-popover .driver-popover-title {
  color: #0E7490 !important;
  font-family: 'Dancing Script', cursive !important;
  font-size: 1.5rem !important;
}

.mi-app-driver-popover .driver-popover-description {
  color: #1E293B !important;
  font-family: 'Poppins', sans-serif !important;
}

.mi-app-driver-popover .driver-popover-next-btn,
.mi-app-driver-popover .driver-popover-prev-btn,
.mi-app-driver-popover .driver-popover-done-btn {
  background-color: #0E7490 !important;
  color: white !important;
  border: none !important;
  border-radius: 8px !important;
  padding: 8px 16px !important;
}

.mi-app-driver-popover .driver-popover-next-btn:hover,
.mi-app-driver-popover .driver-popover-prev-btn:hover,
.mi-app-driver-popover .driver-popover-done-btn:hover {
  background-color: #0C6580 !important;
}

.mi-app-driver-popover .driver-popover-close-btn {
  color: #1E293B !important;
}

.mi-app-driver-popover .driver-popover-progress-text {
  color: #0E7490 !important;
  font-family: 'Poppins', sans-serif !important;
  font-size: 0.85rem !important;
}
</style>
