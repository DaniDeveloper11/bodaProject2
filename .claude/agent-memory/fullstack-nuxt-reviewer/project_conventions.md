---
name: Recurring Design & Code Anti-Patterns
description: Patterns repeatedly found across components that violate project conventions — useful for future review sessions
type: project
---

Identified in first full review (2026-04-22):

**Why:** These patterns appear in many components and are the most common sources of brand/style inconsistency.

**How to apply:** Flag these immediately in any future review without needing to re-read CLAUDE.md.

1. Raw class names `lora` and `font-cursive` used instead of `font-lora` — found in `ourParents.vue` and `promiseSection.vue`.
2. Raw hex values `#6a8e58` and `#8ab87a` used instead of `brand-sage` / no matching token for `#8ab87a` — found in `ourParents.vue`.
3. Generic Tailwind colors (`gray-*`, `green-500`, `violet-500`, `red-500`, `indigo-600`) used throughout instead of brand tokens — especially pervasive in `pages/confirm.vue`, `pages/banco.vue`, `components/contactNovios.vue`.
4. The `confirm.vue` table (`thead bg-gray-50`, `tbody bg-white`) is entirely light-mode styled with no dark mode variants — breaks forced dark mode.
5. `lineHeight` ref referenced in `timeLine.vue` template but never declared in `<script setup>` — will throw a runtime error.
6. Unused heroicons imports in `timeLine.vue` script block (ChevronDownIcon, etc.) — dead code.
7. `carouselComponent.vue` has a global `:root { background-color: #242424 }` rule in an unscoped `<style>` block — pollutes the entire document background.
8. The `img` selector in `carouselComponent.vue` global styles sets `border-radius: 8px` on ALL `img` tags globally — unintentionally affects every image on the page.
9. `petaloComponent.vue` uses `z-index: 50` on a fixed full-screen element, which blocks all pointer events on interactive elements (even with `pointer-events: none` on the container, `z-50` can cause stacking context issues).
10. `datosBancarios.vue` `copyToClipboard` uses `navigator.clipboard` without SSR guard — safe only because it's triggered by user click, but should be noted.
