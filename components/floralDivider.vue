<template>
  <div class="floral-divider my-16 md:my-24 flex items-center justify-center">
    <svg
      viewBox="0 0 800 40"
      class="w-full max-w-lg"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
    >
      <line x1="0" y1="20" x2="320" y2="20" stroke="#B87333" stroke-width="0.8" opacity="0.5"/>
      <line x1="480" y1="20" x2="800" y2="20" stroke="#B87333" stroke-width="0.8" opacity="0.5"/>
      <g transform="translate(400, 20)">
        <circle r="2.5" fill="#B87333"/>
        <g opacity="0.7">
          <ellipse cx="0" cy="-6" rx="2" ry="5" fill="#2D6A5A" transform="rotate(0)"/>
          <ellipse cx="0" cy="-6" rx="2" ry="5" fill="#2D6A5A" transform="rotate(72)"/>
          <ellipse cx="0" cy="-6" rx="2" ry="5" fill="#2D6A5A" transform="rotate(144)"/>
          <ellipse cx="0" cy="-6" rx="2" ry="5" fill="#2D6A5A" transform="rotate(216)"/>
          <ellipse cx="0" cy="-6" rx="2" ry="5" fill="#2D6A5A" transform="rotate(288)"/>
        </g>
        <ellipse cx="-14" cy="0" rx="6" ry="2.5" fill="#B87333" opacity="0.4"/>
        <ellipse cx="14" cy="0" rx="6" ry="2.5" fill="#B87333" opacity="0.4"/>
        <path d="M-30 0 Q-22 -6 -14 0 Q-22 6 -30 0Z" fill="#0E7490" opacity="0.3"/>
        <path d="M30 0 Q22 -6 14 0 Q22 6 30 0Z" fill="#0E7490" opacity="0.3"/>
      </g>
      <path d="M310 20 Q330 12 340 18 Q350 24 360 20" stroke="#B87333" stroke-width="0.6" fill="none" opacity="0.4"/>
      <path d="M490 20 Q470 12 460 18 Q450 24 440 20" stroke="#B87333" stroke-width="0.6" fill="none" opacity="0.4"/>
    </svg>
  </div>
</template>

<script setup>
</script>

<style scoped>
.floral-divider {
  opacity: 0.8;
}
</style>