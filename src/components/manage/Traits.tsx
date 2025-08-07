import type { Trait } from '../../shared/types';
import TraitCheckBox from './TraitCheckBox';

interface TraitsProps {
  traits: Trait[];
  onChangeHandler: (event: React.FormEvent<HTMLInputElement>) => void;
}

const response = await fetch(import.meta.env.PUBLIC_API_URL + '/api/admin/traits/');

const data: Trait[] = await response.json();

const Traits: React.FunctionComponent<TraitsProps> = (props: TraitsProps) => {
  const traits = data.map((trait: Trait) => {
    const match = props.traits.find((t) => {
      return t.id === trait.id;
    });

    const checked = match !== undefined;

    return (
      <TraitCheckBox
        id={trait.id}
        key={trait.id}
        name={trait.name}
        changeHandler={props.onChangeHandler}
        isChecked={checked}
      />
    );
  });

  return <>{traits}</>;
};

export default Traits;
