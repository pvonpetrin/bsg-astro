// @ts-check
import { defineConfig } from 'astro/config';
import aiRobotsTxt from 'astro-ai-robots-txt';
import sitemap from '@astrojs/sitemap';
import react from '@astrojs/react';
import tailwindcss from '@tailwindcss/vite';

import node from '@astrojs/node';

// https://astro.build/config
export default defineConfig({
  site: 'https://bookstore.guide',
  integrations: [aiRobotsTxt(), sitemap(), react()],

  vite: {
    plugins: [tailwindcss()]
  },

  adapter: node({
    mode: 'standalone'
  }),
  output: 'server'
});
