<<<<<<< HEAD
import { BooleanLike } from '../../common/react';
import { useBackend, useLocalState } from '../backend';
import {
  Button,
  Section,
  Icon,
  Input,
  Stack,
  LabeledList,
  Box,
  NoticeBox,
} from '../components';
=======
import { useState } from 'react';
import {
  Box,
  Button,
  Icon,
  Input,
  LabeledList,
  NoticeBox,
  Section,
  Stack,
} from 'tgui-core/components';

import { useBackend } from '../backend';
>>>>>>> tg-pr-88929
import { Window } from '../layouts';

type typePath = string;

type CellularEmporiumContext = {
  abilities: Ability[];
<<<<<<< HEAD
  can_readapt: BooleanLike;
=======
  can_readapt: number;
>>>>>>> tg-pr-88929
  genetic_points_count: number;
  owned_abilities: typePath[];
  absorb_count: number;
  dna_count: number;
};

type Ability = {
  name: string;
  desc: string;
  helptext: string;
  path: typePath;
  genetic_point_required: number; // Checks against genetic_points_count
  absorbs_required: number; // Checks against absorb_count
  dna_required: number; // Checks against dna_count
};

export const CellularEmporium = (props) => {
  const { act, data } = useBackend<CellularEmporiumContext>();
<<<<<<< HEAD
  const [searchAbilities, setSearchAbilities] = useLocalState(
    'searchAbilities',
    '',
  );

  const { can_readapt, genetic_points_count } = data;
=======
  const [searchAbilities, setSearchAbilities] = useState('');

  const { can_readapt, genetic_points_count } = data;
  const readaptTracker = (can_readapt: number): string => {
    let firstPart = 'Readapt(';
    return firstPart.concat(can_readapt.toString(), ')');
  };
>>>>>>> tg-pr-88929
  return (
    <Window width={900} height={480}>
      <Window.Content>
        <Section
          fill
          scrollable
          title={'Genetic Points'}
          buttons={
            <Stack>
              <Stack.Item fontSize="16px">
<<<<<<< HEAD
                {genetic_points_count && genetic_points_count}{' '}
                <Icon name="dna" color="#DD66DD" />
=======
                {genetic_points_count} <Icon name="dna" color="#DD66DD" />
>>>>>>> tg-pr-88929
              </Stack.Item>
              <Stack.Item>
                <Button
                  icon="undo"
<<<<<<< HEAD
                  content="Readapt"
=======
>>>>>>> tg-pr-88929
                  color="good"
                  disabled={!can_readapt}
                  tooltip={
                    can_readapt
                      ? 'We readapt, un-evolving all evolved abilities \
                    and refunding our genetic points.'
                      : 'We cannot readapt until we absorb more DNA.'
                  }
                  onClick={() => act('readapt')}
                >
                  {readaptTracker(can_readapt)}
                </Button>
              </Stack.Item>
              <Stack.Item>
                <Input
                  width="200px"
                  onInput={(event, value) => setSearchAbilities(value)}
                  placeholder="Search Abilities..."
                  value={searchAbilities}
                />
              </Stack.Item>
              <Stack.Item>
                <Input
                  width="200px"
                  onInput={(event) => setSearchAbilities(event.target.value)}
                  placeholder="Search Abilities..."
                  value={searchAbilities}
                />
              </Stack.Item>
            </Stack>
          }
        >
<<<<<<< HEAD
          <AbilityList />
=======
          <AbilityList searchAbilities={searchAbilities} />
>>>>>>> tg-pr-88929
        </Section>
      </Window.Content>
    </Window>
  );
};

<<<<<<< HEAD
const AbilityList = (props) => {
  const { act, data } = useBackend<CellularEmporiumContext>();
  const [searchAbilities] = useLocalState('searchAbilities', '');
=======
const AbilityList = (props: { searchAbilities: string }) => {
  const { act, data } = useBackend<CellularEmporiumContext>();
  const { searchAbilities } = props;
>>>>>>> tg-pr-88929
  const {
    abilities,
    owned_abilities,
    genetic_points_count,
    absorb_count,
    dna_count,
  } = data;

  const filteredAbilities =
    searchAbilities.length <= 1
      ? abilities
      : abilities.filter((ability) => {
          return (
            ability.name
              .toLowerCase()
              .includes(searchAbilities.toLowerCase()) ||
            ability.desc
              .toLowerCase()
              .includes(searchAbilities.toLowerCase()) ||
            ability.helptext
              .toLowerCase()
              .includes(searchAbilities.toLowerCase())
          );
        });

  if (filteredAbilities.length === 0) {
<<<<<<< HEAD
    return (
      <NoticeBox>
        {abilities.length === 0
          ? 'No abilities available to purchase. \
        This is in error, contact your local hivemind today.'
          : 'No abilities found.'}
      </NoticeBox>
    );
  } else {
    return (
      <LabeledList>
        {filteredAbilities.map((ability) => (
          <LabeledList.Item
            key={ability.name}
            className="candystripe"
            label={ability.name}
            buttons={
              <Stack>
                <Stack.Item>{ability.genetic_point_required}</Stack.Item>
                <Stack.Item>
                  <Icon
                    name="dna"
                    color={
                      owned_abilities.includes(ability.path)
                        ? '#DD66DD'
                        : 'gray'
                    }
                  />
                </Stack.Item>
                <Stack.Item>
                  <Button
                    content={'Evolve'}
                    disabled={
                      owned_abilities.includes(ability.path) ||
                      ability.genetic_point_required > genetic_points_count ||
                      ability.absorbs_required > absorb_count ||
                      ability.dna_required > dna_count
                    }
                    onClick={() =>
                      act('evolve', {
                        path: ability.path,
                      })
                    }
                  />
                </Stack.Item>
              </Stack>
            }
          >
            {ability.desc}
            <Box color="good">{ability.helptext}</Box>
          </LabeledList.Item>
        ))}
      </LabeledList>
=======
    return (
      <NoticeBox>
        {abilities.length === 0
          ? 'No abilities available to purchase. \
        This is in error, contact your local hivemind today.'
          : 'No abilities found.'}
      </NoticeBox>
>>>>>>> tg-pr-88929
    );
  }

  return (
    <LabeledList>
      {filteredAbilities.map((ability) => (
        <LabeledList.Item
          key={ability.name}
          className="candystripe"
          label={ability.name}
          buttons={
            <Stack>
              <Stack.Item>{ability.genetic_point_required}</Stack.Item>
              <Stack.Item>
                <Icon
                  name="dna"
                  color={
                    owned_abilities.includes(ability.path) ? '#DD66DD' : 'gray'
                  }
                />
              </Stack.Item>
              <Stack.Item>
                <Button
                  content={'Evolve'}
                  disabled={
                    owned_abilities.includes(ability.path) ||
                    ability.genetic_point_required > genetic_points_count ||
                    ability.absorbs_required > absorb_count ||
                    ability.dna_required > dna_count
                  }
                  onClick={() =>
                    act('evolve', {
                      path: ability.path,
                    })
                  }
                />
              </Stack.Item>
            </Stack>
          }
        >
          {ability.desc}
          <Box color="good">{ability.helptext}</Box>
        </LabeledList.Item>
      ))}
    </LabeledList>
  );
};
