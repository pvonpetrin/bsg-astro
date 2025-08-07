import { auth } from './lib/auth';
import { defineMiddleware } from 'astro:middleware';

const protectedPageUrls = ['/manage'];

export const onRequest = defineMiddleware(async (context, next) => {
  const url = new URL(context.request.url);

  if (protectedPageUrls.some((path) => url.pathname.startsWith(path))) {
    const isAuthed = await auth.api.getSession({
      headers: context.request.headers
    });
    if (!isAuthed) {
      return context.redirect('/auth/signin');
    }
  }

  return next();
});
