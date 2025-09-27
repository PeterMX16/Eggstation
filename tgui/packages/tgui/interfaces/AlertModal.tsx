<<<<<<< HEAD
import { Loader } from './common/Loader';
import { useBackend, useLocalState } from '../backend';
import {
  KEY_ENTER,
  KEY_ESCAPE,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_SPACE,
  KEY_TAB,
} from '../../common/keycodes';
import { Autofocus, Box, Button, Flex, Section, Stack } from '../components';
import { Window } from '../layouts';
=======
import { KeyboardEvent, useState } from 'react';
import { Autofocus, Box, Button, Section, Stack } from 'tgui-core/components';
import { isEscape, KEY } from 'tgui-core/keys';
import { BooleanLike } from 'tgui-core/react';
>>>>>>> tg-pr-88929

import { useBackend } from '../backend';
import { Window } from '../layouts';
import { Loader } from './common/Loader';

type Data = {
  autofocus: BooleanLike;
  buttons: string[];
  large_buttons: BooleanLike;
  message: string;
  swapped_buttons: BooleanLike;
  timeout: number;
  title: string;
};

enum DIRECTION {
  Increment = 1,
  Decrement = -1,
}

<<<<<<< HEAD
export const AlertModal = (props) => {
  const { act, data } = useBackend<AlertModalData>();
=======
export function AlertModal(props) {
  const { act, data } = useBackend<Data>();
>>>>>>> tg-pr-88929
  const {
    autofocus,
    buttons = [],
    large_buttons,
    message = '',
    timeout,
    title,
  } = data;
<<<<<<< HEAD
  const [selected, setSelected] = useLocalState<number>('selected', 0);
=======

  const [selected, setSelected] = useState(0);

  // At least one of the buttons has a long text message
  const isVerbose = buttons.some((button) => button.length > 10);
  const largeSpacing = isVerbose && large_buttons ? 20 : 15;

>>>>>>> tg-pr-88929
  // Dynamically sets window dimensions
  const windowHeight =
    120 +
    (isVerbose ? largeSpacing * buttons.length : 0) +
    (message.length > 30 ? Math.ceil(message.length / 4) : 0) +
    (message.length && large_buttons ? 5 : 0);

  const windowWidth = 345 + (buttons.length > 2 ? 55 : 0);

  /** Changes button selection, etc */
  function keyDownHandler(event: KeyboardEvent<HTMLDivElement>) {
    switch (event.key) {
      case KEY.Space:
      case KEY.Enter:
        act('choose', { choice: buttons[selected] });
        return;
      case KEY.Left:
        event.preventDefault();
        onKey(DIRECTION.Decrement);
        return;
      case KEY.Tab:
      case KEY.Right:
        event.preventDefault();
        onKey(DIRECTION.Increment);
        return;

      default:
        if (isEscape(event.key)) {
          act('cancel');
          return;
        }
    }
  }

  /** Manages iterating through the buttons */
  function onKey(direction: DIRECTION) {
    const newIndex = (selected + direction + buttons.length) % buttons.length;
    setSelected(newIndex);
  }

  return (
    <Window height={windowHeight} title={title} width={windowWidth}>
      {!!timeout && <Loader value={timeout} />}
<<<<<<< HEAD
      <Window.Content
        onKeyDown={(e) => {
          const keyCode = window.event ? e.which : e.keyCode;
          /**
           * Simulate a click when pressing space or enter,
           * allow keyboard navigation, override tab behavior
           */
          if (keyCode === KEY_SPACE || keyCode === KEY_ENTER) {
            act('choose', { choice: buttons[selected] });
          } else if (keyCode === KEY_ESCAPE) {
            act('cancel');
          } else if (keyCode === KEY_LEFT) {
            e.preventDefault();
            onKey(KEY_DECREMENT);
          } else if (keyCode === KEY_TAB || keyCode === KEY_RIGHT) {
            e.preventDefault();
            onKey(KEY_INCREMENT);
          }
        }}
      >
=======
      <Window.Content onKeyDown={keyDownHandler}>
>>>>>>> tg-pr-88929
        <Section fill>
          <Stack fill vertical>
            <Stack.Item m={1}>
              <Box color="label" overflow="hidden">
                {message}
              </Box>
            </Stack.Item>
            <Stack.Item grow>
              {!!autofocus && <Autofocus />}
              {isVerbose ? (
                <VerticalButtons selected={selected} />
              ) : (
                <HorizontalButtons selected={selected} />
              )}
            </Stack.Item>
          </Stack>
        </Section>
      </Window.Content>
    </Window>
  );
}

type ButtonDisplayProps = {
  selected: number;
};

/**
 * Displays a list of buttons ordered by user prefs.
 */
<<<<<<< HEAD
const ButtonDisplay = (props) => {
  const { data } = useBackend<AlertModalData>();
=======
function HorizontalButtons(props: ButtonDisplayProps) {
  const { act, data } = useBackend<Data>();
>>>>>>> tg-pr-88929
  const { buttons = [], large_buttons, swapped_buttons } = data;
  const { selected } = props;

  return (
<<<<<<< HEAD
    <Flex
      align="center"
      direction={!swapped_buttons ? 'row-reverse' : 'row'}
      fill
      justify="space-around"
      wrap
    >
      {buttons?.map((button, index) =>
        !!large_buttons && buttons.length < 3 ? (
          <Flex.Item grow key={index}>
            <AlertButton
              button={button}
              id={index.toString()}
              selected={selected === index}
            />
          </Flex.Item>
        ) : (
          <Flex.Item key={index}>
            <AlertButton
              button={button}
              id={index.toString()}
              selected={selected === index}
            />
          </Flex.Item>
        ),
      )}
    </Flex>
=======
    <Stack fill justify="space-around" reverse={!swapped_buttons}>
      {buttons.map((button, index) => (
        <Stack.Item grow={large_buttons ? 1 : undefined} key={index}>
          <Button
            fluid={!!large_buttons}
            minWidth={5}
            onClick={() => act('choose', { choice: button })}
            overflowX="hidden"
            px={2}
            py={large_buttons ? 0.5 : 0}
            selected={selected === index}
            textAlign="center"
          >
            {!large_buttons ? button : button.toUpperCase()}
          </Button>
        </Stack.Item>
      ))}
    </Stack>
>>>>>>> tg-pr-88929
  );
}

/**
 * Technically the parent handles more than 2 buttons, but you
 * should just be using a list input in that case.
 */
<<<<<<< HEAD
const AlertButton = (props) => {
  const { act, data } = useBackend<AlertModalData>();
  const { large_buttons } = data;
  const { button, selected } = props;
  const buttonWidth = button.length > 7 ? button.length : 7;

  return (
    <Button
      fluid={!!large_buttons}
      height={!!large_buttons && 2}
      onClick={() => act('choose', { choice: button })}
      m={0.5}
      pl={2}
      pr={2}
      pt={large_buttons ? 0.33 : 0}
      selected={selected}
      textAlign="center"
      width={!large_buttons && buttonWidth}
    >
      {!large_buttons ? button : button.toUpperCase()}
    </Button>
=======
function VerticalButtons(props: ButtonDisplayProps) {
  const { act, data } = useBackend<Data>();
  const { buttons = [], large_buttons, swapped_buttons } = data;
  const { selected } = props;

  return (
    <Stack
      align="center"
      fill
      justify="space-around"
      reverse={!swapped_buttons}
      vertical
    >
      {buttons.map((button, index) => (
        <Stack.Item
          grow
          width={large_buttons ? '100%' : undefined}
          key={index}
          m={0}
        >
          <Button
            fluid
            minWidth={20}
            onClick={() => act('choose', { choice: button })}
            overflowX="hidden"
            px={2}
            py={large_buttons ? 0.5 : 0}
            selected={selected === index}
            textAlign="center"
          >
            {!large_buttons ? button : button.toUpperCase()}
          </Button>
        </Stack.Item>
      ))}
    </Stack>
>>>>>>> tg-pr-88929
  );
}
