<<<<<<< HEAD
import {
  FeatureChoiced,
  FeatureChoicedServerData,
  FeatureIconnedDropdownInput,
  FeatureValueProps,
} from '../base';
=======
import { FeatureIconnedDropdownInput, FeatureWithIcons } from '../dropdowns';
>>>>>>> tg-pr-88929

export const glasses: FeatureWithIcons<string> = {
  name: 'Glasses',
<<<<<<< HEAD
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureIconnedDropdownInput buttons {...props} />;
  },
=======
  component: FeatureIconnedDropdownInput,
>>>>>>> tg-pr-88929
};
