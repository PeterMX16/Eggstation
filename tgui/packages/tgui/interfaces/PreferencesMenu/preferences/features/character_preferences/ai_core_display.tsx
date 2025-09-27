<<<<<<< HEAD
import {
  FeatureIconnedDropdownInput,
  FeatureValueProps,
  FeatureChoicedServerData,
  FeatureChoiced,
} from '../base';
=======
import {} from '../base';
import { FeatureIconnedDropdownInput, FeatureWithIcons } from '../dropdowns';
>>>>>>> tg-pr-88929

export const preferred_ai_core_display: FeatureChoiced = {
  name: 'AI Core Display',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureIconnedDropdownInput buttons {...props} />;
  },
};
