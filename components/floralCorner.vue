<template>
  <svg
    :class="positionClasses"
    viewBox="0 0 120 120"
    fill="none"
    xmlns="http://www.w3.org/2000/svg"
    class="floral-corner"
  >
    <g :transform="flipTransform">
      <path
        d="M0 0 Q20 10 30 30 Q20 20 0 0Z"
        fill="#2D6A5A"
        opacity="0.25"
      />
      <path
        d="M5 5 Q30 15 40 40 Q25 25 5 5Z"
        fill="#0E7490"
        opacity="0.2"
      />
      <path
        d="M10 2 Q25 8 35 25 Q20 15 10 2Z"
        fill="#B87333"
        opacity="0.3"
      />
      <path
        d="M2 10 Q15 20 28 35 Q18 22 2 10Z"
        fill="#B87333"
        opacity="0.3"
      />
      <circle cx="18" cy="18" r="4" fill="#2D6A5A" opacity="0.2"/>
      <circle cx="28" cy="28" r="3" fill="#0E7490" opacity="0.15"/>
      <path
        d="M35 0 Q38 8 42 15 Q40 10 35 0Z"
        fill="#2D6A5A"
        opacity="0.15"
      />
      <path
        d="M0 35 Q8 38 15 42 Q10 40 0 35Z"
        fill="#2D6A5A"
        opacity="0.15"
      />
      <path
        d="M6 6 L12 3 L18 8 L12 12 L6 6Z"
        fill="#B87333"
        opacity="0.2"
      />
    </g>
  </svg>
</template>

<script setup>
const props = defineProps({
  position: {
    type: String,
    default: 'top-left',
    validator: (v) => ['top-left', 'top-right', 'bottom-left', 'bottom-right'].includes(v)
  },
  size: {
    type: String,
    default: 'size-24'
  }
})

const positionClasses = computed(() => {
  const size = props.size
  switch (props.position) {
    case 'top-right': return `${size} absolute top-0 right-0`
    case 'bottom-left': return `${size} absolute bottom-0 left-0`
    case 'bottom-right': return `${size} absolute bottom-0 right-0`
    default: return `${size} absolute top-0 left-0`
  }
})

const flipTransform = computed(() => {
  switch (props.position) {
    case 'top-right': return 'translate(120, 0) scale(-1, 1)'
    case 'bottom-left': return 'translate(0, 120) scale(1, -1)'
    case 'bottom-right': return 'translate(120, 120) scale(-1, -1)'
    default: return ''
  }
})
</script>

<style scoped>
.floral-corner {
  pointer-events: none;
  z-index: 10;
}
</style>