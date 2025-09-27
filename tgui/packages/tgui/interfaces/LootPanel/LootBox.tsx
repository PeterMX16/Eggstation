<<<<<<< HEAD
import { Button, Stack } from '../..//components';
import { BooleanLike } from 'common/react';
import { capitalizeFirst } from 'common/string';
=======
import { Tooltip } from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';
import { capitalizeAll, capitalizeFirst } from 'tgui-core/string';
>>>>>>> tg-pr-88929

import { useBackend } from '../../backend';
import { IconDisplay } from './IconDisplay';
import { SearchGroup, SearchItem } from './types';

type Data = {
  is_blind: BooleanLike;
};

type Props =
  | {
      item: SearchItem;
    }
  | {
      group: SearchGroup;
    };

<<<<<<< HEAD
export const LootBox = (props: Props) => {
=======
export function LootBox(props: Props) {
>>>>>>> tg-pr-88929
  const { act, data } = useBackend<Data>();
  const { is_blind } = data;

  let amount = 0;
  let item: SearchItem;
  if ('group' in props) {
    amount = props.group.amount;
    item = props.group.item;
  } else {
    item = props.item;
  }

<<<<<<< HEAD
  const name = !item.name ? '???' : capitalizeFirst(item.name);

  const content = (
    <Button
      p={0}
      fluid
      color="transparent"
      onClick={(event) =>
        act('grab', {
          alt: event.altKey,
          ctrl: event.ctrlKey,
          ref: item.ref,
          shift: event.shiftKey,
        })
      }
      onContextMenu={(event) => {
        event.preventDefault();
        act('grab', {
          right: true,
          ref: item.ref,
        });
      }}
    >
      <Stack>
        <Stack.Item mb={-1} minWidth={'36px'} minHeight={'42px'}>
          <IconDisplay item={item} size={{ height: 3, width: 3 }} />
        </Stack.Item>
        <Stack.Item
          lineHeight="34px"
          overflow="hidden"
          style={{ 'text-overflow': 'ellipsis' }}
        >
          {!is_blind && name}
        </Stack.Item>
        <Stack.Item lineHeight="34px" pr={1}>
          {amount > 1 && 'x' + amount}
        </Stack.Item>
      </Stack>
    </Button>
=======
  const name = !item.name
    ? '???'
    : capitalizeFirst(item.name.split(' ')[0]).slice(0, 5);

  // So we can conditionally wrap tooltip
  const content = (
    <div className="SearchItem">
      <div
        className="SearchItem--box"
        onClick={(event) =>
          act('grab', {
            alt: event.altKey,
            ctrl: event.ctrlKey,
            ref: item.ref,
            shift: event.shiftKey,
          })
        }
        onContextMenu={(event) => {
          event.preventDefault();
          act('grab', {
            right: true,
            ref: item.ref,
          });
        }}
      >
        <IconDisplay item={item} size={{ height: 3, width: 3 }} />
        {amount > 1 && <div className="SearchItem--amount">{amount}</div>}
      </div>
      {!is_blind && <span className="SearchItem--text">{name}</span>}
    </div>
>>>>>>> tg-pr-88929
  );

  if (is_blind) return content;

<<<<<<< HEAD
  return content;
};
=======
  return <Tooltip content={capitalizeAll(item.name)}>{content}</Tooltip>;
}
>>>>>>> tg-pr-88929
