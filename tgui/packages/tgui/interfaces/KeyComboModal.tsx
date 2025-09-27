<<<<<<< HEAD
import { KEY, isEscape } from 'common/keys';
import { useBackend, useLocalState } from '../backend';
import { Autofocus, Box, Button, Section, Stack } from '../components';
=======
import { useState } from 'react';
import { Autofocus, Box, Button, Section, Stack } from 'tgui-core/components';
import { isEscape, KEY } from 'tgui-core/keys';

import { useBackend, useLocalState } from '../backend';
>>>>>>> tg-pr-88929
import { Window } from '../layouts';
import { InputButtons } from './common/InputButtons';
import { Loader } from './common/Loader';

type KeyInputData = {
  init_value: string;
  large_buttons: boolean;
  message: string;
  timeout: number;
  title: string;
};

<<<<<<< HEAD
const isStandardKey = (event: KeyboardEvent): boolean => {
=======
const isStandardKey = (event: React.KeyboardEvent<HTMLDivElement>): boolean => {
>>>>>>> tg-pr-88929
  return (
    event.key !== KEY.Alt &&
    event.key !== KEY.Control &&
    event.key !== KEY.Shift &&
    !isEscape(event.key)
  );
};

const KEY_CODE_TO_BYOND: Record<string, string> = {
  DEL: 'Delete',
  DOWN: 'South',
  END: 'Southwest',
  HOME: 'Northwest',
  INSERT: 'Insert',
  LEFT: 'West',
  PAGEDOWN: 'Southeast',
  PAGEUP: 'Northeast',
  RIGHT: 'East',
<<<<<<< HEAD
  ' ': 'Space',
=======
  SPACEBAR: 'Space',
>>>>>>> tg-pr-88929
  UP: 'North',
};

const DOM_KEY_LOCATION_NUMPAD = 3;

<<<<<<< HEAD
const formatKeyboardEvent = (event: KeyboardEvent): string => {
=======
const formatKeyboardEvent = (
  event: React.KeyboardEvent<HTMLDivElement>,
): string => {
>>>>>>> tg-pr-88929
  let text = '';

  if (event.altKey) {
    text += 'Alt';
  }

  if (event.ctrlKey) {
    text += 'Ctrl';
  }

  if (event.shiftKey) {
    text += 'Shift';
  }

  if (event.location === DOM_KEY_LOCATION_NUMPAD) {
    text += 'Numpad';
  }

  if (isStandardKey(event)) {
    const key = event.key.toUpperCase();
    text += KEY_CODE_TO_BYOND[key] || key;
  }

  return text;
};

export const KeyComboModal = (props) => {
  const { act, data } = useBackend<KeyInputData>();
  const { init_value, large_buttons, message = '', title, timeout } = data;
<<<<<<< HEAD
  const [input, setInput] = useLocalState('input', init_value);
=======
  const [input, setInput] = useState(init_value);
>>>>>>> tg-pr-88929
  const [binding, setBinding] = useLocalState('binding', true);

  const setValue = (value: string) => {
    if (value === input) {
      return;
    }
    setInput(value);
  };

  // Dynamically changes the window height based on the message.
  const windowHeight =
    130 +
    (message.length > 30 ? Math.ceil(message.length / 3) : 0) +
    (message.length && large_buttons ? 5 : 0);

  return (
    <Window title={title} width={240} height={windowHeight}>
      {timeout && <Loader value={timeout} />}
      <Window.Content
        onKeyDown={(event) => {
          if (!binding) {
            if (event.key === KEY.Enter) {
              act('submit', { entry: input });
            }
            if (isEscape(event.key)) {
              act('cancel');
            }
            return;
          }

          event.preventDefault();

          if (isStandardKey(event)) {
            setValue(formatKeyboardEvent(event));
            setBinding(false);
            return;
          } else if (isEscape(event.key)) {
            setValue(init_value);
            setBinding(false);
            return;
          }
        }}
      >
        <Section fill>
          <Autofocus />
          <Stack fill vertical>
            <Stack.Item grow>
              <Box color="label">{message}</Box>
            </Stack.Item>
            <Stack.Item>
              <Button
                disabled={binding}
                content={
                  binding && binding !== null ? 'Awaiting input...' : '' + input
                }
                width="100%"
                textAlign="center"
                onClick={() => {
                  setValue(init_value);
                  setBinding(true);
                }}
              />
            </Stack.Item>
            <Stack.Item>
              <InputButtons input={input} />
            </Stack.Item>
          </Stack>
        </Section>
      </Window.Content>
    </Window>
  );
};
