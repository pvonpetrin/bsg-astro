import { authClient } from '../../lib/auth-client';

const { signOut } = authClient;

const logOut = async () => {
  await signOut();
  window.location.href = `${import.meta.env.PUBLIC_API_URL}`;
};

const SignOut = () => {
  return (
    <button onClick={logOut} className="btn btn-error float-right">
      Log Out
    </button>
  );
};

export default SignOut;
