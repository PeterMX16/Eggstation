<<<<<<< HEAD
import { Box } from '../../components';
import { createSearch } from 'common/string';
=======
import { Flex } from 'tgui-core/components';
import { createSearch } from 'tgui-core/string';
>>>>>>> tg-pr-88929

import { LootBox } from './LootBox';
import { SearchItem } from './types';

type Props = {
  contents: SearchItem[];
  searchText: string;
};

<<<<<<< HEAD
export const RawContents = (props: Props) => {
=======
export function RawContents(props: Props) {
>>>>>>> tg-pr-88929
  const { contents, searchText } = props;

  const filteredContents = contents.filter(
    createSearch(searchText, (item: SearchItem) => item.name),
  );

  return (
<<<<<<< HEAD
    <Box m={-0.5}>
      {filteredContents.map((item) => (
        <LootBox key={item.ref} item={item} />
      ))}
    </Box>
  );
};
=======
    <Flex wrap>
      {filteredContents.map((item) => (
        <Flex.Item key={item.ref} m={1}>
          <LootBox item={item} />
        </Flex.Item>
      ))}
    </Flex>
  );
}
>>>>>>> tg-pr-88929
