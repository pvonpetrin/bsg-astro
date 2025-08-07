import type { APIRoute } from 'astro';
import prisma from '../../../lib/prisma';

export const prerender = false;

export const GET: APIRoute = async () => {
  const traits = await prisma.trait.findMany();

  return new Response(JSON.stringify(traits), {
    headers: { 'Content-Type': 'application/json' }
  });
};
