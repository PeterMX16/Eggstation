<<<<<<< HEAD
import { Box } from '../../components';
import { createSearch } from 'common/string';
=======
import { useMemo } from 'react';
import { Flex } from 'tgui-core/components';
import { createSearch } from 'tgui-core/string';
>>>>>>> tg-pr-88929

import { LootBox } from './LootBox';
import { SearchGroup, SearchItem } from './types';

type Props = {
<<<<<<< HEAD
  contents: Record<string, SearchItem[]>;
  searchText: string;
};

export const GroupedContents = (props: Props) => {
  const { contents, searchText } = props;

  const filteredContents: SearchGroup[] = Object.entries(contents)
=======
  contents: SearchItem[];
  searchText: string;
};

export function GroupedContents(props: Props) {
  const { contents, searchText } = props;

  // limitations: items with different stack counts, charges etc.
  const contentsByPath = useMemo(() => {
    const acc: Record<string, SearchItem[]> = {};

    for (let i = 0; i < contents.length; i++) {
      const item = contents[i];
      if (item.path) {
        if (!acc[item.path]) {
          acc[item.path] = [];
        }
        acc[item.path].push(item);
      } else {
        acc[item.ref] = [item];
      }
    }
    return acc;
  }, [contents]);

  const filteredContents: SearchGroup[] = Object.entries(contentsByPath)
>>>>>>> tg-pr-88929
    .filter(createSearch(searchText, ([_, items]) => items[0].name))
    .map(([_, items]) => ({ amount: items.length, item: items[0] }));

  return (
<<<<<<< HEAD
    <Box m={-0.5}>
      {filteredContents.map((group) => (
        <LootBox key={group.item.name} group={group} />
      ))}
    </Box>
  );
};
=======
    <Flex wrap>
      {filteredContents.map((group) => (
        <Flex.Item key={group.item.name} m={1}>
          <LootBox group={group} />
        </Flex.Item>
      ))}
    </Flex>
  );
}
>>>>>>> tg-pr-88929
