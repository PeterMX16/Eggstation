<<<<<<< HEAD
import { DmIcon, Icon, Image } from '../../components';
=======
import { DmIcon, Icon, Image } from 'tgui-core/components';
>>>>>>> tg-pr-88929

import { SearchItem } from './types';

type Props = {
  item: SearchItem;
  size: Size;
};

type Size = {
  height: number;
  width: number;
};

<<<<<<< HEAD
export const IconDisplay = (props: Props) => {
=======
export function IconDisplay(props: Props) {
>>>>>>> tg-pr-88929
  const {
    item: { icon, icon_state },
    size: { height, width },
  } = props;

<<<<<<< HEAD
  const fallback = <Icon name="spinner" size={1.5} spin color="gray" />;
=======
  const fallback = <Icon name="spinner" size={2.2} spin color="gray" />;
>>>>>>> tg-pr-88929

  if (!icon) {
    return fallback;
  }

  if (icon === 'n/a') {
<<<<<<< HEAD
    return <Icon name="dumpster-fire" size={1.5} color="gray" />;
=======
    return <Icon name="dumpster-fire" size={2} color="gray" />;
>>>>>>> tg-pr-88929
  }

  if (icon_state) {
    return (
      <DmIcon
        fallback={fallback}
        icon={icon}
        icon_state={icon_state}
        height={height}
        width={width}
      />
    );
  }

<<<<<<< HEAD
  return <Image fixErrors src={icon} height={3} width={3} objectFit="cover" />;
};
=======
  return <Image fixErrors src={icon} height={3} width={3} />;
}
>>>>>>> tg-pr-88929
