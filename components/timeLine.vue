<template>
  <div>
    <div class="relative">
      <div class="flex justify-items-start -ml-6">
        <NuxtImg
        :src="config.images.flowerCorner"
        class="size-48 -scale-y-100 -scale-x-100"
      ></NuxtImg>
      </div>

      <div class="-mt-14">
        <div class="mb-5">
          <h4 class="text-brand-cyan font-dancing text-4xl md:text-5xl text-center">
            {{ config.texts.timeline.title }}
          </h4>
        </div>

        <div class="relative">
          <div
            class="absolute left-1/2 top-0 h-full w-0.5 bg-brand-cyan/30 -translate-x-1/2"
            :style="{ height: lineHeight + 'px' }"
          ></div>
          <ul>
            <li
              v-for="(event, i) in timeline"
              :key="event.id"
              class="mb-16 flex items-center w-full"
              :class="i % 2 === 0 ? 'justify-start' : 'justify-end'"
              data-aos="fade-up"
              :ref="i === timeline.length - 1 ? 'latestEvent' : null"
            >
              <div
                class="w-1/2 flex flex-col items-end pr-8"
                v-if="i % 2 === 0"
              >
                <div class="text-right">
                  <div class="text-lg font-semibold text-brand-copper">
                    {{ event.time }}
                  </div>
                  <div class="text-xl font-cursive text-brand-charcoal">{{ event.title }}</div>
                </div>
              </div>
              <div class="relative z-10 flex flex-col items-center">
                <div
                  class="bg-white border-4 border-brand-cyan rounded-full p-2 shadow-md"
                >
                  <NuxtImg
                    :src="event.src"
                    class="w-10 h-10 sm:w-14 sm:h-14 object-contain"
                  ></NuxtImg>
                </div>
                <div
                  class="w-3 h-3 bg-brand-cyan border-4 border-brand-cyan rounded-full mt-2"
                ></div>
              </div>
              <div
                class="w-1/2 flex flex-col items-start pl-8"
                v-if="i % 2 !== 0"
              >
                <div class="text-left">
                  <div class="text-lg font-semibold text-brand-copper">
                    {{ event.time }}
                  </div>
                  <div class="text-xl font-cursive text-brand-charcoal">{{ event.title }}</div>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="w-full flex justify-center items-center">
      <NuxtImg :src="config.images.timelineBottom" class="w-full h-full object-cover"></NuxtImg>
    </div>
  </div>
</template>
<script setup lang="ts">
import { ref, onMounted, nextTick } from 'vue'
import config from '~/wedding.config'

const lineHeight = ref(0)
const latestEvent = ref(null)

const timeline = config.texts.timeline.events.map((event, index) => ({
  id: index,
  src: config.images.timeline[event.icon],
  time: event.time,
  title: event.title,
}))

onMounted(async () => {
  await nextTick()
  if (latestEvent.value && latestEvent.value[0]) {
    const containerTop = latestEvent.value[0].parentElement.getBoundingClientRect().top
    const lastEventBottom = latestEvent.value[0].getBoundingClientRect().bottom
    lineHeight.value = lastEventBottom - containerTop
  }
})
</script>