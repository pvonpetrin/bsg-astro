import { useState } from 'react';
import { authClient } from '../../lib/auth-client';
import { DEFAULT_ERROR_MESSAGE } from '../../shared/consts';

const { signIn } = authClient;

const sharedInputClass = 'w-full rounded-md bg-neutral-900 border border-neutral-700 px-3 py-2';

const SignIn = () => {
  const [error, setError] = useState<string | null>(null);

  const submitHandler = async (formData: FormData) => {
    setError(null);

    const res = await signIn.email({
      email: formData.get('email') as string,
      password: formData.get('password') as string
    });

    if (res.error) {
      setError(res.error.message || DEFAULT_ERROR_MESSAGE);
    } else {
      window.location.href = '../../manage';
    }
  };

  return (
    <>
      <h1 className="text-2xl font-bold">Sign In</h1>
      {error && <p className="text-red-500">{error}</p>}
      <form action={submitHandler} className="space-y-4 max-w-xl">
        <input
          name="email"
          type="email"
          placeholder="Email"
          required
          className={sharedInputClass}
        />
        <input
          name="password"
          type="password"
          placeholder="Password"
          required
          className={sharedInputClass}
        />
        <button
          type="submit"
          className="w-full bg-white text-black font-medium rounded-md px-4 py-2 hover:bg-gray-200">
          Sign In
        </button>
      </form>
    </>
  );
};

export default SignIn;
