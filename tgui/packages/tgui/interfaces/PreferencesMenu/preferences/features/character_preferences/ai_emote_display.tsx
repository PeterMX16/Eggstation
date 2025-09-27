<<<<<<< HEAD
import {
  FeatureIconnedDropdownInput,
  FeatureValueProps,
  FeatureChoicedServerData,
  FeatureChoiced,
} from '../base';

export const preferred_ai_emote_display: FeatureChoiced = {
  name: 'AI Emote Display',
  description:
    'If you are the AI, the default image displayed on all AI displays on station.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureIconnedDropdownInput buttons {...props} />;
  },
=======
import { FeatureIconnedDropdownInput, FeatureWithIcons } from '../dropdowns';

export const preferred_ai_emote_display: FeatureWithIcons<string> = {
  name: 'AI emote display',
  description:
    'If you are the AI, the default image displayed on all AI displays on station.',
  component: FeatureIconnedDropdownInput,
>>>>>>> tg-pr-88929
};
