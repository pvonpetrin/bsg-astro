interface DescriptionCounterProps {
  description?: string | null;
}

const DescriptionCounter: React.FunctionComponent<DescriptionCounterProps> = (
  props: DescriptionCounterProps
) => {
  const descriptionLength = props.description ? props.description.length : 0;
  const counterColor = descriptionLength >= 25 && descriptionLength <= 160 ? '' : 'text-red-600';
  return (
    <div className="text-sm mb-5">
      <span className={counterColor}>{descriptionLength}</span>/160{' '}
      <span className="text-xs">(recommended length between 25 &amp; 160 characters)</span>
    </div>
  );
};

export default DescriptionCounter;
