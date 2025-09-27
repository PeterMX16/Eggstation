<<<<<<< HEAD
import { BooleanLike, classes } from 'common/react';
import { multiline } from 'common/string';
import { capitalizeAll } from 'common/string';
import { useBackend, useLocalState } from '../backend';
=======
import { useState } from 'react';
>>>>>>> tg-pr-88929
import {
  Box,
  Button,
  ColorBox,
  LabeledList,
  Section,
  Stack,
<<<<<<< HEAD
  Tabs,
  Table,
} from '../components';
=======
  Table,
  Tabs,
} from 'tgui-core/components';
import { BooleanLike, classes } from 'tgui-core/react';
import { capitalizeAll } from 'tgui-core/string';

import { useBackend } from '../backend';
>>>>>>> tg-pr-88929
import { Window } from '../layouts';

const ROOT_CATEGORIES = ['Atmospherics', 'Disposals', 'Transit Tubes'];

export const ICON_BY_CATEGORY_NAME = {
  Atmospherics: 'wrench',
  Disposals: 'trash-alt',
  'Transit Tubes': 'bus',
  Pipes: 'grip-lines',
  Binary: 'arrows-left-right',
  'Disposal Pipes': 'grip-lines',
  Devices: 'microchip',
  'Heat Exchange': 'thermometer-half',
  'Station Equipment': 'microchip',
<<<<<<< HEAD
  'Air Sensors': 'microchip',
=======
>>>>>>> tg-pr-88929
};

const TOOLS = [
  {
    name: 'Dispense',
    bitmask: 1,
  },
  {
    name: 'Connect',
    bitmask: 2,
  },
  {
    name: 'Destroy',
    bitmask: 4,
  },
  {
    name: 'Reprogram',
    bitmask: 8,
  },
];

<<<<<<< HEAD
const LAYERS = [
  {
    name: '1',
    bitmask: 1,
  },
  {
    name: '2',
    bitmask: 2,
  },
  {
    name: '3',
    bitmask: 4,
  },
  {
    name: '4',
    bitmask: 8,
  },
  {
    name: '5',
    bitmask: 16,
  },
] as const;

=======
>>>>>>> tg-pr-88929
type DirectionsAllowed = {
  north: BooleanLike;
  south: BooleanLike;
  east: BooleanLike;
  west: BooleanLike;
};

type Colors = {
  green: string;
  blue: string;
  red: string;
  orange: string;
  cyan: string;
  dark: string;
  yellow: string;
  brown: string;
  pink: string;
  purple: string;
  violet: string;
  omni: string;
};

type Category = {
  cat_name: string;
  recipes: Recipe[];
};

type Recipe = {
  pipe_name: string;
  pipe_index: number;
  previews: Preview[];
};

type Preview = {
  selected: BooleanLike;
  dir: string;
  dir_name: string;
  icon_state: string;
  flipped: BooleanLike;
};

type Data = {
<<<<<<< HEAD
=======
  // Static
  paint_colors: Colors;
  max_pipe_layers: number;
>>>>>>> tg-pr-88929
  // Dynamic
  category: number;
  pipe_layers: number;
  multi_layer: BooleanLike;
<<<<<<< HEAD
  ducting_layer: number;
=======
>>>>>>> tg-pr-88929
  categories: Category[];
  selected_recipe: string;
  selected_color: string;
  selected_category: string;
  mode: number;
  init_directions: DirectionsAllowed;
<<<<<<< HEAD
  // Static
  paint_colors: Colors;
=======
>>>>>>> tg-pr-88929
};

export const ColorItem = (props) => {
  const { act, data } = useBackend<Data>();
  const { selected_color, paint_colors } = data;
  const colorNames = Object.keys(paint_colors);
  return (
    <LabeledList.Item label="Color">
      {colorNames.map((colorName) => (
        <ColorBox
          key={colorName}
          height="20px"
          width="20px"
          style={{
            border:
              '3px solid ' +
              (colorName === selected_color ? '#20b142' : '#222'),
          }}
          color={paint_colors[colorName]}
          onClick={() =>
            act('color', {
              paint_color: colorName,
            })
          }
        />
      ))}
      <Box inline ml={2} px={1} bold color={paint_colors[selected_color]}>
        {capitalizeAll(selected_color)}
      </Box>
    </LabeledList.Item>
  );
};

const ModeItem = (props) => {
  const { act, data } = useBackend<Data>();
  const { mode } = data;
  return (
    <LabeledList.Item label="Modes">
      {TOOLS.map((tool) => (
        <Button.Checkbox
          key={tool.bitmask}
          checked={mode & tool.bitmask}
<<<<<<< HEAD
          content={tool.name}
=======
>>>>>>> tg-pr-88929
          onClick={() =>
            act('mode', {
              mode: tool.bitmask,
            })
          }
<<<<<<< HEAD
        />
=======
        >
          {tool.name}
        </Button.Checkbox>
>>>>>>> tg-pr-88929
      ))}
    </LabeledList.Item>
  );
};

const CategoryItem = (props) => {
  const { act, data } = useBackend<Data>();
  const { category: rootCategoryIndex } = data;
  return (
    <LabeledList.Item label="Category">
      {ROOT_CATEGORIES.map((categoryName, i) => (
        <Button
          key={categoryName}
          selected={rootCategoryIndex === i}
          icon={ICON_BY_CATEGORY_NAME[categoryName]}
          color="transparent"
          onClick={() => act('category', { category: i })}
        >
          {categoryName}
        </Button>
      ))}
    </LabeledList.Item>
  );
};

const SelectionSection = (props) => {
<<<<<<< HEAD
  const { act, data } = useBackend<Data>();
=======
  const { data } = useBackend<Data>();
>>>>>>> tg-pr-88929
  const { category: rootCategoryIndex } = data;
  return (
    <Section fill>
      <LabeledList>
        <CategoryItem />
        <ModeItem />
        {rootCategoryIndex === 0 && <ColorItem />}
        {rootCategoryIndex === 0 && <LayerSelect />}
      </LabeledList>
    </Section>
  );
};

<<<<<<< HEAD
// MONKESTATION ADDITION -- added context to layer select and useBackend<Data>()
const LayerSelect = (props) => {
  const { act, data } = useBackend<Data>();
  const { pipe_layers } = data;
  const { multi_layer } = data;
  return (
    <LabeledList.Item label="Layer">
      {LAYERS.map((layer) => (
        <Button.Checkbox
          key={layer.bitmask}
          checked={
            multi_layer
              ? pipe_layers & layer.bitmask
              : layer.bitmask === pipe_layers
          }
          content={layer.name}
          onClick={() => act('pipe_layers', { pipe_layers: layer.bitmask })}
        />
      ))}
      <Button.Checkbox
        key="multilayer"
        checked={multi_layer}
        content="Multi"
=======
const LayerSelect = (props) => {
  const { act, data } = useBackend<Data>();
  const { pipe_layers, multi_layer, max_pipe_layers } = data;
  const layer_to_bitmask = (layer: number) => {
    return 1 << layer;
  };

  return (
    <LabeledList.Item label="Layer">
      {Array(max_pipe_layers)
        .keys()
        .map((layer) => (
          <Button.Checkbox
            key={layer}
            checked={
              multi_layer
                ? pipe_layers & layer_to_bitmask(layer)
                : layer_to_bitmask(layer) === pipe_layers
            }
            onClick={() =>
              act('pipe_layers', { pipe_layers: layer_to_bitmask(layer) })
            }
          >
            {layer + 1}
          </Button.Checkbox>
        ))}
      <Button.Checkbox
        key="multilayer"
        checked={multi_layer}
>>>>>>> tg-pr-88929
        tooltip="Build on multiple pipe layers simultaneously"
        onClick={() => {
          act('toggle_multi_layer');
        }}
<<<<<<< HEAD
      />
=======
      >
        Multi
      </Button.Checkbox>
>>>>>>> tg-pr-88929
    </LabeledList.Item>
  );
};

const PreviewSelect = (props) => {
<<<<<<< HEAD
  const { act, data } = useBackend<Data>();
=======
  const { act } = useBackend<Data>();
>>>>>>> tg-pr-88929
  return (
    <Box>
      {props.previews.map((preview) => (
        <Button
          ml={0}
          key={preview.dir}
<<<<<<< HEAD
          title={preview.dir_name}
=======
          tooltip={preview.dir_name}
>>>>>>> tg-pr-88929
          selected={preview.selected}
          style={{
            width: '40px',
            height: '40px',
<<<<<<< HEAD
            padding: 0,
=======
            padding: '0',
>>>>>>> tg-pr-88929
          }}
          onClick={() => {
            act('pipe_type', {
              pipe_type: props.pipe_type,
              category: props.category,
            });
            act('setdir', {
              dir: preview.dir,
              flipped: preview.flipped,
            });
          }}
        >
          <Box
            className={classes([
              'pipes32x32',
              preview.dir + '-' + preview.icon_state,
            ])}
            style={{
              transform: 'scale(1.5) translate(9.5%, 9.5%)',
<<<<<<< HEAD
              '-ms-interpolation-mode': 'nearest-neighbor',
              'image-rendering': 'pixelated',
=======
>>>>>>> tg-pr-88929
            }}
          />
        </Button>
      ))}
    </Box>
  );
};

const PipeTypeSection = (props) => {
<<<<<<< HEAD
  const { act, data } = useBackend<Data>();
  const { categories = [], selected_category, selected_recipe } = data;
  const [categoryName, setCategoryName] = useLocalState(
    'categoryName',
    selected_category,
  );
  const shownCategory =
    categories.find((category) => category.cat_name === categoryName) ||
    categories[0];
=======
  const { data } = useBackend<Data>();
  const { categories = [], selected_category } = data;
  const [categoryName, setCategoryName] = useState(selected_category);
  const shownCategory =
    categories.find((category) => category.cat_name === categoryName) ||
    categories[0];

>>>>>>> tg-pr-88929
  return (
    <Section>
      <Tabs>
        {categories.map((category, i) => (
          <Tabs.Tab
<<<<<<< HEAD
            fluid
=======
>>>>>>> tg-pr-88929
            key={category.cat_name}
            icon={ICON_BY_CATEGORY_NAME[category.cat_name]}
            selected={category.cat_name === shownCategory.cat_name}
            onClick={() => setCategoryName(category.cat_name)}
          >
            {category.cat_name}
          </Tabs.Tab>
        ))}
      </Tabs>
      <Table>
        {shownCategory?.recipes.map((recipe) => (
          <Table.Row
            key={recipe.pipe_index}
<<<<<<< HEAD
            style={{ 'border-bottom': '1px solid #333' }}
=======
            style={{ borderBottom: '1px solid #333' }}
>>>>>>> tg-pr-88929
          >
            <Table.Cell collapsing py="2px" pb="1px">
              <PreviewSelect
                previews={recipe.previews}
                pipe_type={recipe.pipe_index}
                category={shownCategory.cat_name}
              />
            </Table.Cell>
            <Table.Cell />
<<<<<<< HEAD
            <Table.Cell style={{ 'vertical-align': 'middle' }}>
=======
            <Table.Cell style={{ verticalAlign: 'middle' }}>
>>>>>>> tg-pr-88929
              {recipe.pipe_name}
            </Table.Cell>
          </Table.Row>
        ))}
      </Table>
    </Section>
  );
};

export const SmartPipeBlockSection = (props) => {
  const { act, data } = useBackend<Data>();
  const { init_directions = [] } = data;
  return (
    <Section fill>
      <Stack vertical textAlign="center">
        <Stack.Item>
          <Stack>
            <Stack.Item>
              <Button
                color="transparent"
                icon="info"
                tooltipPosition="right"
<<<<<<< HEAD
                tooltip={multiline`
                This is a panel for blocking certain connection
                directions for the smart pipes.
                The button in the center resets to
                default (all directions can connect)`}
=======
                tooltip="This is a panel for blocking certain connection
                directions for the smart pipes.
                The button in the center resets to
                default (all directions can connect)"
>>>>>>> tg-pr-88929
              />
            </Stack.Item>
            <Stack.Item>
              <Button
                icon="arrow-up"
                selected={init_directions['north']}
                onClick={() =>
                  act('init_dir_setting', {
                    dir_flag: 'north',
                  })
                }
              />
            </Stack.Item>
          </Stack>
        </Stack.Item>
        <Stack.Item>
          <Stack>
            <Stack.Item>
              <Button
                icon="arrow-left"
                selected={init_directions['west']}
                onClick={() =>
                  act('init_dir_setting', {
                    dir_flag: 'west',
                  })
                }
              />
            </Stack.Item>
            <Stack.Item>
              <Button icon="circle" onClick={() => act('init_reset', {})} />
            </Stack.Item>
            <Stack.Item>
              <Button
                icon="arrow-right"
                selected={init_directions['east']}
                onClick={() =>
                  act('init_dir_setting', {
                    dir_flag: 'east',
                  })
                }
              />
            </Stack.Item>
          </Stack>
        </Stack.Item>
        <Stack.Item>
          <Button
            icon="arrow-down"
            selected={init_directions['south']}
            onClick={() =>
              act('init_dir_setting', {
                dir_flag: 'south',
              })
            }
          />
        </Stack.Item>
      </Stack>
    </Section>
  );
};

export const RapidPipeDispenser = (props) => {
<<<<<<< HEAD
  const { act, data } = useBackend<Data>();
=======
  const { data } = useBackend<Data>();
>>>>>>> tg-pr-88929
  const { category: rootCategoryIndex } = data;
  return (
    <Window width={550} height={580}>
      <Window.Content scrollable>
        <Stack fill vertical>
          <Stack.Item>
            <Stack fill>
              <Stack.Item grow>
                <SelectionSection />
              </Stack.Item>
              {rootCategoryIndex === 0 && (
                <Stack.Item width="90px">
                  <SmartPipeBlockSection />
                </Stack.Item>
              )}
            </Stack>
          </Stack.Item>
          <Stack.Item grow>
            <PipeTypeSection />
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
