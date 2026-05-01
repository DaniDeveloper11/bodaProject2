<template>
  <div class="lg:flex lg:h-full lg:flex-col">
    <div class="px-4 sm:px-6">
      <h2 class="text-brand-sage font-dancing text-3xl text-center">{{ config.date.displayDate }}</h2>
    </div>
    <header class="flex justify-center border-b border-gray-200 px-6 pb-4 pt-2 lg:flex-none">
      <h1 class="text-base font-semibold text-gray-200">
        <time :datetime="calendarDatetime" class="text-xl font-lora">{{ config.date.calendarMonthYear }}</time>
      </h1>
    </header>
    <div class="shadow ring-1 ring-black/5 lg:flex lg:flex-auto lg:flex-col">
      <div
        class="grid grid-cols-7 gap-px border-b border-gray-300 bg-gray-200 text-center text-xs/6 font-semibold text-gray-700 lg:flex-none">
        <div v-for="(name, i) in config.texts.calendar.dayNames" :key="i" class="bg-white py-2">
          {{ name.charAt(0) }}<span class="sr-only sm:not-sr-only">{{ name.slice(1) }}</span>
        </div>
      </div>
      <div class="flex bg-gray-200 text-xs/6 text-gray-700 lg:flex-auto">
        <div class="hidden w-full lg:grid lg:grid-cols-7 lg:grid-rows-6 lg:gap-px">
          <div v-for="day in days" :key="day.date" :class="[
            day.isCurrentMonth ? 'bg-white' : 'bg-gray-50 text-gray-500',
            'relative px-3 py-2',
          ]">
            <time :datetime="day.date" :class="day.isToday
                ? 'flex size-6 items-center justify-center rounded-full bg-indigo-600 font-semibold text-white'
                : undefined
              ">{{ formatDay(day.date) }}</time>
            <ol v-if="day.events.length > 0" class="mt-2">
              <li>
                <a href="" class="group flex">
                  <p class="flex-auto truncate font-dancing text-gray-900 text-center">
                    {{ config.texts.calendar.selectedDayLabel }}
                  </p>
                  <heartIcon v-if="day.isSelected" />
                </a>
              </li>
            </ol>
          </div>
        </div>
        <div class="isolate grid w-full grid-cols-7 grid-rows-6 gap-px lg:hidden">
          <button v-for="day in days" :key="day.date" type="button" :class="[
            day.isCurrentMonth ? 'bg-orange-200' : 'bg-gray-50',
            (day.isSelected || day.isToday) && 'font-semibold',
            day.isSelected && 'text-white',
            !day.isSelected && day.isToday && 'text-indigo-600',
            !day.isSelected &&
            day.isCurrentMonth &&
            !day.isToday &&
            'text-gray-900',
            !day.isSelected &&
            !day.isCurrentMonth &&
            !day.isToday &&
            'text-gray-500',
            'relative overflow-hidden flex h-14 flex-col px-3 py-2 hover:bg-gray-100 focus:z-10',
          ]">
            <heartIcon v-if="day.isSelected" />
            <time :datetime="day.date" :class="[
              day.isSelected &&
              'flex size-6 items-center justify-center rounded-full',
              'ml-auto relative z-10',
            ]">
              {{ formatDay(day.date) }}
            </time>
            <span class="sr-only">{{ day.events.length }} events</span>
            <span v-if="day.events.length > 0" class="-mx-0.5 mt-auto flex flex-wrap-reverse relative z-10">
              <span v-for="event in day.events" :key="event.id" class="mx-0.5 mb-1 size-1.5 rounded-full bg-gray-400" />
            </span>
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import heartIcon from "~/ui/icons/heartIcon.vue";
import { computed } from "vue";
import config from '~/wedding.config'

const weddingDate = new Date(config.date.weddingDate)
const weddingYear = weddingDate.getFullYear()
const weddingMonth = weddingDate.getMonth()
const weddingDay = weddingDate.getDate()

const calendarDatetime = `${weddingYear}-${String(weddingMonth + 1).padStart(2, '0')}`

function formatDay(dateStr) {
  return parseInt(dateStr.split('-').pop(), 10)
}

function generateCalendarDays(year, month, selectedDayNum) {
  const firstDay = new Date(year, month, 1)
  const lastDay = new Date(year, month + 1, 0)
  const startDow = firstDay.getDay()
  const daysInMonth = lastDay.getDate()

  const prevMonthLast = new Date(year, month, 0).getDate()
  const today = new Date()
  const todayStr = `${today.getFullYear()}-${String(today.getMonth() + 1).padStart(2, '0')}-${String(today.getDate()).padStart(2, '0')}`

  const days = []

  for (let i = startDow - 1; i >= 0; i--) {
    const d = prevMonthLast - i
    const m = month === 0 ? 12 : month
    const y = month === 0 ? year - 1 : year
    days.push({
      date: `${y}-${String(m).padStart(2, '0')}-${String(d).padStart(2, '0')}`,
      isCurrentMonth: false,
      isToday: false,
      isSelected: false,
      events: [],
    })
  }

  for (let d = 1; d <= daysInMonth; d++) {
    const dateStr = `${year}-${String(month + 1).padStart(2, '0')}-${String(d).padStart(2, '0')}`
    const isSelected = d === selectedDayNum
    const isToday = dateStr === todayStr
    days.push({
      date: dateStr,
      isCurrentMonth: true,
      isToday,
      isSelected,
      events: isSelected
        ? [{ id: 1, name: config.texts.calendar.selectedDayLabel, time: '', datetime: dateStr, href: '#' }]
        : [],
    })
  }

  const remaining = 42 - days.length
  for (let d = 1; d <= remaining; d++) {
    const m = month + 2 > 12 ? 1 : month + 2
    const y = month + 2 > 12 ? year + 1 : year
    days.push({
      date: `${y}-${String(m).padStart(2, '0')}-${String(d).padStart(2, '0')}`,
      isCurrentMonth: false,
      isToday: false,
      isSelected: false,
      events: [],
    })
  }

  return days
}

const days = computed(() =>
  generateCalendarDays(weddingYear, weddingMonth, weddingDay)
)
</script>