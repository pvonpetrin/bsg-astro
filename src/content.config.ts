import { defineCollection } from 'astro:content';

type Store = {
  id: string;
  address1: string;
  address2: string;
  zip5: string;
  phone: string;
  hoursText: string;
  url: string;
  description: string;
  longDescription: string;
  name: string;
  slug: string;
};

const stores = defineCollection({ 
    loader: async () => {
    const response = await fetch(import.meta.env.API_SERVER + "/api/v0/places");
    const data = await response.json();
    return data.map((store: Store) => ({
      ...store,
      id: String(store.id) // astro requires a string id
    }));
  },
 });

 export const collections = { stores };

