<<<<<<< HEAD
=======
import { useState } from 'react';
>>>>>>> tg-pr-88929
import {
  Box,
  Button,
  Icon,
  LabeledList,
  NoticeBox,
  NumberInput,
  ProgressBar,
  Section,
  Stack,
  Table,
  Tabs,
<<<<<<< HEAD
} from '../components';
import { BooleanLike } from 'common/react';
import { classes } from 'common/react';
import { useBackend, useLocalState } from '../backend';
import { Window } from '../layouts';

=======
} from 'tgui-core/components';
import { BooleanLike, classes } from 'tgui-core/react';

import { useBackend } from '../backend';
import { Window } from '../layouts';

>>>>>>> tg-pr-88929
type Data = {
  beaker: BooleanLike;
  beakerCurrentVolume: number;
  beakerMaxVolume: number;
  biomass: number;
  can_process: BooleanLike;
  categories: Category[];
  efficiency: number;
  max_output: number;
  max_visual_biomass: number;
  processing: BooleanLike;
  reagent_color: string;
};

type Category = {
  items: Design[];
  name: string;
};

type Design = {
  amount: number;
  cost: number;
  disable: BooleanLike;
  id: string;
  is_reagent: BooleanLike;
  name: string;
};

<<<<<<< HEAD
export const Biogenerator = () => {
  const { data } = useBackend<Data>();
  const { beaker, beakerCurrentVolume, beakerMaxVolume, categories } = data;

  const [selectedCategory, setSelectedCategory] = useLocalState(
    'category',
=======
export function Biogenerator(props) {
  const { data } = useBackend<Data>();
  const { beaker, beakerCurrentVolume, beakerMaxVolume, categories } = data;

  const [selectedCategory, setSelectedCategory] = useState(
>>>>>>> tg-pr-88929
    data.categories[0]?.name,
  );

  const items =
    categories.find((category) => category.name === selectedCategory)?.items ||
    [];

  const space = beaker ? beakerMaxVolume - beakerCurrentVolume : 1;

  return (
    <Window width={400} height={530}>
      <Window.Content>
        <Stack vertical fill>
          <Stack.Item>
            <Controls />
          </Stack.Item>
          <Stack.Item>
            <Tabs fluid>
              {categories.map(({ name }) => (
                <Tabs.Tab
                  align="center"
                  key={name}
                  selected={name === selectedCategory}
                  onClick={() => setSelectedCategory(name)}
                >
                  {name}
                </Tabs.Tab>
              ))}
            </Tabs>
          </Stack.Item>
          <Stack.Item grow mt="2px">
            <Section fill scrollable>
              <Table>
                {items.map((item) => (
                  <Item key={item.id} item={item} space={space} />
                ))}
              </Table>
            </Section>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
}

function Controls() {
  const { act, data } = useBackend<Data>();
  const {
    beaker,
    beakerCurrentVolume,
    beakerMaxVolume,
    biomass,
    can_process,
    max_visual_biomass,
    processing,
    reagent_color,
  } = data;

  return (
    <Section fill>
      <LabeledList>
        <LabeledList.Item
          label="Biomass"
          buttons={
            <Button
              width={7}
              lineHeight={2}
              align="center"
              icon="cog"
              iconSpin={processing ? 1 : 0}
              disabled={!can_process || processing}
              onClick={() => act('activate')}
            >
              Generate
            </Button>
          }
        >
          <ProgressBar
            value={biomass}
            minValue={0}
            maxValue={max_visual_biomass}
            color="good"
          >
            <Box
              lineHeight={1.9}
              style={{
                textShadow: '1px 1px 0 black',
              }}
            >
              {`${parseFloat(biomass.toFixed(2))} units`}
            </Box>
          </ProgressBar>
        </LabeledList.Item>
        {!!beaker && (
          <LabeledList.Item
            label="Container"
            buttons={
              <Button
                width={7}
                lineHeight={2}
                align="center"
                icon="eject"
                onClick={() => act('eject')}
              >
                Eject
              </Button>
            }
          >
            <ProgressBar
              value={beakerCurrentVolume}
              minValue={0}
              height={2}
              maxValue={beakerMaxVolume}
              color={reagent_color}
            >
              <Box
                lineHeight={1.9}
                style={{
                  textShadow: '1px 1px 0 black',
                }}
              >
                {`${beakerCurrentVolume} of ${beakerMaxVolume} units`}
              </Box>
            </ProgressBar>
          </LabeledList.Item>
        )}
        {!beaker && (
          <LabeledList.Item label="Container">
            <NoticeBox m={0} height={2}>
              No liquid container
            </NoticeBox>
          </LabeledList.Item>
        )}
      </LabeledList>
    </Section>
  );
}

type Props = {
  item: Design;
  space: number;
};

<<<<<<< HEAD
const Controls = () => {
  const { act, data } = useBackend<Data>();
  const {
    beaker,
    beakerCurrentVolume,
    beakerMaxVolume,
    biomass,
    can_process,
    max_visual_biomass,
    processing,
    reagent_color,
  } = data;

  return (
    <Section fill minHeight="80px">
      <LabeledList>
        <LabeledList.Item
          label="Biomass"
          buttons={
            <Button
              width={7}
              lineHeight={2}
              align="center"
              icon="cog"
              iconSpin={processing ? 1 : 0}
              disabled={!can_process || processing}
              onClick={() => act('activate')}
            >
              Generate
            </Button>
          }
        >
          <ProgressBar
            value={biomass}
            minValue={0}
            maxValue={max_visual_biomass}
            color="good"
          >
            <Box
              lineHeight={1.9}
              style={{
                'text-shadow': '1px 1px 0 black',
              }}
            >
              {`${parseFloat(biomass.toFixed(2))} units`}
            </Box>
          </ProgressBar>
        </LabeledList.Item>
        {!!beaker && (
          <LabeledList.Item
            label="Container"
            buttons={
              <Button
                width={7}
                lineHeight={2}
                align="center"
                icon="eject"
                onClick={() => act('eject')}
              >
                Eject
              </Button>
            }
          >
            <ProgressBar
              value={beakerCurrentVolume}
              minValue={0}
              height={2}
              maxValue={beakerMaxVolume}
              color={reagent_color}
            >
              <Box
                lineHeight={1.9}
                style={{
                  'text-shadow': '1px 1px 0 black',
                }}
              >
                {`${beakerCurrentVolume} of ${beakerMaxVolume} units`}
              </Box>
            </ProgressBar>
          </LabeledList.Item>
        )}
        {!beaker && (
          <LabeledList.Item label="Container">
            <NoticeBox m={0} height={2}>
              No liquid container
            </NoticeBox>
          </LabeledList.Item>
        )}
      </LabeledList>
    </Section>
  );
};

type Props = {
  item: Design;
  space: number;
};

const Item = (props: Props) => {
=======
function Item(props: Props) {
>>>>>>> tg-pr-88929
  const { item, space } = props;
  const { cost, id, is_reagent, name } = item;

  const { act, data } = useBackend<Data>();
  const { biomass, beaker, efficiency, max_output, processing } = data;

  const minAmount = is_reagent ? Math.min(Math.max(space, 1), 10) : 1;

<<<<<<< HEAD
  const [amount, setAmount] = useLocalState('amount-' + id, minAmount);
=======
  const [amount, setAmount] = useState(minAmount);
>>>>>>> tg-pr-88929

  const disabled =
    processing ||
    (is_reagent && !beaker) ||
    (is_reagent && space < amount) ||
<<<<<<< HEAD
    biomass < Math.ceil(cost * amount);

  const maxPossible = Math.floor(biomass / cost);
=======
    biomass < Math.ceil((cost * amount) / efficiency);

  const maxPossible = Math.floor((efficiency * biomass) / cost);
>>>>>>> tg-pr-88929

  const maxCapacity = is_reagent ? space : max_output;
  const maxAmount = Math.max(1, Math.min(maxCapacity, maxPossible));

  return (
    <Table.Row>
      <Table.Cell>
        <span
          className={classes(['design32x32', id])}
          style={{
            verticalAlign: 'middle',
          }}
        />{' '}
        <b>{name}</b>
      </Table.Cell>
      <Table.Cell collapsing>
        <NumberInput
          value={amount}
          step={1}
          width="40px"
          minValue={1}
          maxValue={maxAmount}
<<<<<<< HEAD
          onChange={(_, value) => setAmount(value)}
=======
          onChange={(value) => setAmount(value)}
>>>>>>> tg-pr-88929
        />
      </Table.Cell>
      <Table.Cell collapsing>
        <Button
          align="right"
          width={5}
          pr={0}
          disabled={disabled}
          onClick={() =>
            act('create', {
              id,
              amount,
            })
          }
        >
<<<<<<< HEAD
          {parseFloat((cost * amount).toFixed(2)).toLocaleString()}{' '}
          <Icon name="leaf" />
=======
          {parseFloat((cost * amount).toFixed(2))} <Icon name="leaf" />
>>>>>>> tg-pr-88929
        </Button>
      </Table.Cell>
    </Table.Row>
  );
<<<<<<< HEAD
};
=======
}
>>>>>>> tg-pr-88929
