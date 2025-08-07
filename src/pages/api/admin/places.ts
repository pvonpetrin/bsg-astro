import type { APIRoute } from 'astro';
import prisma from '../../../lib/prisma';
import { preSortPlaces } from '../../../shared/utils';

export const prerender = false;

export const GET: APIRoute = async () => {
  const places = await prisma.place.findMany();

  const sortedPlaces = preSortPlaces(places);

  return new Response(JSON.stringify(sortedPlaces), {
    headers: { 'Content-Type': 'application/json' }
  });
};
