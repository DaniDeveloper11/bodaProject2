/** @type {import('tailwindcss').Config} */
export default {
  content: [
    './components/**/*.{vue,js,ts}',
    './layouts/**/*.vue',
    './pages/**/*.vue',
    './plugins/**/*.{js,ts}',
    './app.vue',
    './nuxt.config.{js,ts}'
  ],
  theme: {
    extend: {
      screens: {
        xs: '375px',
      },
      colors: {
        brand: {
          cyan:         '#0E7490',
          'cyan-light': '#A5F3FC',
          sky:          '#E0F7FA',
          cream:        '#FDFCF8',
          agave:        '#2D6A5A',
          copper:       '#B87333',
          charcoal:     '#1E293B',
          sand:         '#F5F0E1',
        }
      },
      fontFamily: {
        dancing:  ['"Dancing Script"', 'cursive'],
        poppins:  ['Poppins', 'sans-serif'],
        pacifico: ['"Pacifico"', 'cursive'],
        alex:     ["'Alex Brush", 'cursive'],
        playfair: ['"Playfair Display"', 'serif'],
        lora:     ['Lora', 'serif']
      },
    },
  },
  plugins: [],
}

