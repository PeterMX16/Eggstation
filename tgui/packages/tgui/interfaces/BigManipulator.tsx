<<<<<<< HEAD
import { BooleanLike } from 'common/react';

import { useBackend } from '../backend';
import { Button, Section, Stack } from '../components';
=======
import { Button, Section, Stack, Table } from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';

import { useBackend } from '../backend';
>>>>>>> tg-pr-88929
import { Window } from '../layouts';

type ManipulatorData = {
  active: BooleanLike;
<<<<<<< HEAD
=======
  drop_after_use: BooleanLike;
  highest_priority: BooleanLike;
  manipulate_mode: string;
  settings_list: PrioritySettings[];
  throw_range: number;
  item_as_filter: string;
  selected_type: string;
};

type PrioritySettings = {
  name: string;
  priority_width: number;
>>>>>>> tg-pr-88929
};

export const BigManipulator = (props) => {
  const { data, act } = useBackend<ManipulatorData>();
<<<<<<< HEAD
  const { active } = data;
  return (
    <Window title="Manipulator Interface" width={320} height={160}>
      <Window.Content>
        <Section title="Action panel">
          <Stack>
=======
  const {
    active,
    manipulate_mode,
    settings_list,
    highest_priority,
    throw_range,
    item_as_filter,
    selected_type,
  } = data;
  return (
    <Window title="Manipulator Interface" width={320} height={240}>
      <Window.Content>
        <Section
          title="Action panel"
          buttons={
>>>>>>> tg-pr-88929
            <Button
              icon="power-off"
              content={active ? 'On' : 'Off'}
              selected={active}
              onClick={() => act('on')}
            />
<<<<<<< HEAD
          </Stack>
        </Section>
=======
          }
        >
          <Stack.Item grow>
            <Button
              content={`type to take: ${selected_type}`}
              tooltip="changes type of item that manipulator will pick up."
              onClick={() => act('change_take_item_type')}
            />
            <Button
              content={`Mode: ${manipulate_mode}`}
              tooltip="click to change manipulator mode"
              onClick={() => act('change_mode')}
            />
            <Button
              icon="eject"
              tooltip="drop item contained in manipulator"
              onClick={() => act('drop')}
            />
          </Stack.Item>
          <Stack.Item grow>
            <Button
              content={`filter: ${item_as_filter ? `${item_as_filter}` : `no filter`}`}
              tooltip="click on this button with item in hands to add filter on this item."
              onClick={() => act('add_filter')}
            />
            {manipulate_mode === 'Throw' && (
              <Button
                content={`Throw range: ${throw_range}`}
                tooltip="distance an object will travel when thrown"
                onClick={() => act('change_throw_range')}
              />
            )}
          </Stack.Item>
        </Section>
        {settings_list.length >= 2 && (
          <Section fill scrollable>
            {settings_list.length >= 2 && (
              <Button
                content={'Only 1 priority'}
                selected={highest_priority}
                tooltip="manipulate only on 1 priority in priority list"
                onClick={() => act('highest_priority_change')}
              />
            )}
            <Table>
              {settings_list.map((setting) => (
                <Table.Row key={setting.name} className="candystripe">
                  <Table.Cell width={3}>
                    {setting.name} {` [priority: ${setting.priority_width}]`}
                    {setting.priority_width >= 2 && (
                      <Button
                        icon="arrow-up"
                        align="right"
                        onClick={() =>
                          act('change_priority', {
                            priority: setting.priority_width,
                          })
                        }
                      />
                    )}
                  </Table.Cell>
                </Table.Row>
              ))}
            </Table>
          </Section>
        )}
>>>>>>> tg-pr-88929
      </Window.Content>
    </Window>
  );
};
