<<<<<<< HEAD
import {
  Feature,
  FeatureChoiced,
  FeatureDropdownInput,
  FeatureShortTextInput,
} from '../base';
=======
import { Feature, FeatureChoiced, FeatureShortTextInput } from '../base';
import { FeatureDropdownInput } from '../dropdowns';
>>>>>>> tg-pr-88929

export const pda_theme: FeatureChoiced = {
  name: 'PDA Theme',
  category: 'GAMEPLAY',
  component: FeatureDropdownInput,
};

export const pda_ringtone: Feature<string> = {
  name: 'PDA Ringtone',
  component: FeatureShortTextInput,
};
