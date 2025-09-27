<<<<<<< HEAD
import {
  FeatureIconnedDropdownInput,
  FeatureValueProps,
  FeatureChoicedServerData,
  FeatureChoiced,
} from '../base';

export const preferred_ai_hologram_display: FeatureChoiced = {
  name: 'AI Hologram Display',
  description: 'The holographic form you will take when you use a holopad.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureIconnedDropdownInput buttons {...props} />;
  },
=======
import { FeatureIconnedDropdownInput, FeatureWithIcons } from '../dropdowns';

export const preferred_ai_hologram_display: FeatureWithIcons<string> = {
  name: 'AI hologram display',
  description: 'The holographic form you will take when you use a holopad.',
  component: FeatureIconnedDropdownInput,
>>>>>>> tg-pr-88929
};
