import { Dropdown } from 'tgui-core/components';
import { exhaustiveCheck } from 'tgui-core/exhaustive';

import { RandomSetting } from './data';
<<<<<<< HEAD
=======

const options = [
  {
    displayText: 'Do not randomize',
    value: RandomSetting.Disabled,
  },

  {
    displayText: 'Always randomize',
    value: RandomSetting.Enabled,
  },

  {
    displayText: 'Randomize when antagonist',
    value: RandomSetting.AntagOnly,
  },
];
>>>>>>> tg-pr-88929

export const RandomizationButton = (props: {
  dropdownProps?: Record<string, unknown>;
  setValue: (newValue: RandomSetting) => void;
  value?: RandomSetting;
}) => {
  const { dropdownProps = {}, setValue, value } = props;

  let color;

  switch (value) {
    case RandomSetting.AntagOnly:
      color = 'orange';
      break;
    case RandomSetting.Disabled:
      color = 'red';
      break;
    case RandomSetting.Enabled:
      color = 'green';
      break;
  }

  return (
    <Dropdown
      color={color}
      {...dropdownProps}
      clipSelectedText={false}
      icon="dice-d20"
      options={options}
      noChevron
      onSelected={setValue}
      menuWidth="120px"
<<<<<<< HEAD
      width="auto"
=======
      width={1.85}
      selected="None"
>>>>>>> tg-pr-88929
    />
  );
};
