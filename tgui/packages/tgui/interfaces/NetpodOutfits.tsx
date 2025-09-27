<<<<<<< HEAD
=======
import { useState } from 'react';
>>>>>>> tg-pr-88929
import {
  Button,
  Divider,
  Input,
  NoticeBox,
  Section,
  Stack,
  Tabs,
<<<<<<< HEAD
} from '../components';
import { useBackend, useLocalState } from '../backend';

import { Window } from '../layouts';
import { createSearch } from '../../common/string';
=======
} from 'tgui-core/components';
import { createSearch } from 'tgui-core/string';

import { useBackend } from '../backend';
import { Window } from '../layouts';
>>>>>>> tg-pr-88929

type Data = {
  netsuit: string;
  collections: Collection[];
  types: string[];
};

type Collection = {
  name: string;
  outfits: Outfit[];
};

type Outfit = {
  path: string;
  name: string;
  type: string;
};

export const NetpodOutfits = (props) => {
  const { act, data } = useBackend<Data>();
  const { netsuit, collections = [] } = data;
<<<<<<< HEAD
  const [selectedType, setSelectedType] = useLocalState<Collection>(
    'selectedType',
    collections[0],
  );
  const [search, setSearch] = useLocalState<string>('outfitSearch', '');
=======
  const [selectedType, setSelectedType] = useState(collections[0]);
  const [search, setSearch] = useState('');
>>>>>>> tg-pr-88929

  const searchFn = createSearch(search, (outfit: Outfit) => outfit.name);

  const filtered = selectedType?.outfits
    ?.filter(searchFn)
    .sort((a, b) => (a.name > b.name ? 1 : 0));

  const selected =
    selectedType.outfits?.find((outfit) => outfit.path === netsuit)?.name ??
    'None';

  return (
    <Window title="Net Pod" height={300} width={400}>
      <Window.Content>
        <Stack fill vertical>
          <Stack.Item grow>
            <Section
              fill
              title="Select an outfit"
              buttons={
                <Input
                  autoFocus
<<<<<<< HEAD
                  onInput={(event, value) => setSearch(value)}
=======
                  onChange={(event, value) => setSearch(value)}
>>>>>>> tg-pr-88929
                  placeholder="Search"
                  value={search}
                />
              }
            >
              <Stack fill>
                <Stack.Item grow>
                  <Tabs vertical>
                    {collections.map((collection, index) => (
                      <>
                        <Tabs.Tab
                          key={collection.name}
                          onClick={() => setSelectedType(collection)}
                          selected={selectedType === collection}
                        >
                          {collection.name}
                        </Tabs.Tab>
                        {index > 0 && <Divider />}
                      </>
                    ))}
                  </Tabs>
                </Stack.Item>
                <Stack.Divider />
                <Stack.Item grow={5}>
                  <Section fill scrollable>
                    {filtered.map(({ path, name }, index) => (
                      <Stack.Item className="candystripe" key={index}>
                        <Button
                          selected={netsuit === path}
                          color="transparent"
                          onClick={() => act('select_outfit', { outfit: path })}
                        >
                          {name}
                        </Button>
                      </Stack.Item>
                    ))}
                  </Section>
                </Stack.Item>
              </Stack>
            </Section>
          </Stack.Item>
          <Stack.Item>
            <NoticeBox info align="right">
              {selected}
            </NoticeBox>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
