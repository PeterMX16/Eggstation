import { Box, Button, Flex, Image, Section, Stack } from 'tgui-core/components';

import { useBackend } from '../backend';
import { Window } from '../layouts';

type Data = {
  bait_name: string;
  bait_icon: string;
  line_name: string;
  line_icon: string;
  hook_name: string;
  hook_icon: string;
  description: string;
};

type Props = {
  name: string;
  slot: string;
  current_item_name: string | null;
  current_item_icon: string | null;
};

<<<<<<< HEAD
const FishingRodSlot = (props: FishingSlotProps) => {
  const { act } = useBackend();

  const icon_wrapper = (icon) => (
    <Box
      as="img"
      width="64px" // todo come up with some way to scale this sanely
      height="64px"
      src={`data:image/jpeg;base64,${icon}`}
      style={{
        '-ms-interpolation-mode': 'nearest-neighbor',
        'image-rendering': 'pixelated',
        'vertical-align': 'middle',
        'object-fit': 'cover',
      }}
    />
  );
=======
const FishingRodSlot = (props: Props) => {
  const { act } = useBackend();
  const { current_item_icon, name, slot, current_item_name } = props;
>>>>>>> tg-pr-88929

  return (
    <Section title={`${name}`}>
      <Stack>
        <Stack.Item grow>
<<<<<<< HEAD
          <Button
            fluid
            onClick={() => act('slot_action', { slot: props.slot })}
          >
=======
          <Button fluid onClick={() => act('slot_action', { slot: slot })}>
>>>>>>> tg-pr-88929
            <Flex>
              <Flex.Item>
                {!!current_item_icon && (
                  <Image
                    width="64px" // todo come up with some way to scale this sanely
                    height="64px"
                    src={`data:image/jpeg;base64,${current_item_icon}`}
                    verticalAlign="middle"
                    objectFit="cover"
                  />
                )}
              </Flex.Item>
              <Flex.Item grow align="center">
                <Box textAlign="center">{current_item_name ?? 'None'}</Box>
              </Flex.Item>
            </Flex>
          </Button>
        </Stack.Item>
      </Stack>
    </Section>
  );
};

export const FishingRod = (props) => {
<<<<<<< HEAD
  const { act, data } = useBackend<FishingRodData>();
=======
  const { data } = useBackend<Data>();
  const {
    bait_name,
    bait_icon,
    line_name,
    line_icon,
    hook_name,
    hook_icon,
    description,
  } = data;
>>>>>>> tg-pr-88929

  return (
    <Window height={450} width={400}>
      <Window.Content>
        <Section>
          <FishingRodSlot
            name="Bait"
            slot="bait"
            current_item_name={bait_name}
            current_item_icon={bait_icon}
          />
          <FishingRodSlot
            name="Line"
            slot="line"
            current_item_name={line_name}
            current_item_icon={line_icon}
          />
          <FishingRodSlot
            name="Hook"
            slot="hook"
            current_item_name={hook_name}
            current_item_icon={hook_icon}
          />
        </Section>
        <Section>{description}</Section>
      </Window.Content>
    </Window>
  );
};
