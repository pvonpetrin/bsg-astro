// @ts-check
import { defineConfig } from 'astro/config';

import aiRobotsTxt from 'astro-ai-robots-txt';

import sitemap from '@astrojs/sitemap';

// https://astro.build/config
export default defineConfig({
  site: 'https://bookstore.guide',
  integrations: [aiRobotsTxt(), sitemap()]
});