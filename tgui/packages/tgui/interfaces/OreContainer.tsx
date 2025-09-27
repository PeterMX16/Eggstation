<<<<<<< HEAD
import { createSearch, toTitleCase } from 'common/string';
import { useBackend, useLocalState } from '../backend';
import {
  Button,
  Input,
  Stack,
  Flex,
  Section,
  DmIcon,
  Icon,
} from '../components';
=======
import { useState } from 'react';
import {
  Button,
  DmIcon,
  Flex,
  Icon,
  Input,
  Section,
  Stack,
} from 'tgui-core/components';
import { createSearch, toTitleCase } from 'tgui-core/string';

import { useBackend } from '../backend';
>>>>>>> tg-pr-88929
import { Window } from '../layouts';

type Ores = {
  id: string;
  name: string;
  amount: number;
  icon: string;
  icon_state: string;
};

type Data = {
  ores: Ores[];
};

export const OreContainer = (props) => {
  const { act, data } = useBackend<Data>();
  const { ores = [] } = data;
<<<<<<< HEAD
  const [searchItem, setSearchItem] = useLocalState('searchItem', '');
  const search = createSearch(searchItem, (ore: Ores) => ore.name);
  const ores_filtered =
    searchItem.length > 0 ? ores.filter((ore) => search(ore)) : ores;
=======
  const [searchItem, setSearchItem] = useState('');
  const search = createSearch(searchItem, (ore: Ores) => ore.name);
  const ores_filtered =
    searchItem.length > 0 ? ores.filter((ore) => search(ore)) : ores;

>>>>>>> tg-pr-88929
  return (
    <Window title="Ore Container" width={550} height={400}>
      <Window.Content>
        <Stack fill vertical>
          <Stack.Item>
            <Section>
              <Input
<<<<<<< HEAD
                autofocus
=======
                autoFocus
>>>>>>> tg-pr-88929
                position="relative"
                mt={0.5}
                bottom="5%"
                height="20px"
                width="150px"
                placeholder="Search Ore..."
                value={searchItem}
                onInput={(e, value) => {
                  setSearchItem(value);
                }}
                fluid
              />
            </Section>
          </Stack.Item>
          <Stack.Item grow>
            <Section title="Stock" fill scrollable>
              <Stack wrap>
                {ores_filtered.map((ore) => (
                  <Flex.Item key={ore.id}>
                    <Flex direction="column" m={0.5} textAlign="center">
                      <Flex.Item>
<<<<<<< HEAD
                        <RetrieveIcon ore={ore} />
=======
                        <DmIcon
                          height="64px"
                          width="64px"
                          icon={ore.icon}
                          icon_state={ore.icon_state}
                          fallback={<Icon name="spinner" size={2} spin />}
                        />
>>>>>>> tg-pr-88929
                      </Flex.Item>
                      <Flex.Item>
                        <Orename ore_name={toTitleCase(ore.name)} />
                      </Flex.Item>
                      <Flex.Item>Amount: {ore.amount}</Flex.Item>
                      <Flex.Item>
                        <Button
                          content="Withdraw"
                          color="transparent"
                          onClick={() =>
                            act('withdraw', {
                              reference: ore.id,
                            })
                          }
                        />
                      </Flex.Item>
                    </Flex>
                  </Flex.Item>
                ))}
              </Stack>
            </Section>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

<<<<<<< HEAD
const RetrieveIcon = (props) => {
  const { ore } = props;
  return (
    <DmIcon
      height="64px"
      width="64px"
      icon={ore.icon}
      icon_state={ore.icon_state}
      fallback={<Icon name="spinner" size={2} spin />}
    />
  );
};

=======
>>>>>>> tg-pr-88929
const Orename = (props) => {
  const { ore_name } = props;
  const return_name = ore_name.split(' ');
  if (return_name.length === 0) {
    return null;
  }
  return return_name[0];
};
