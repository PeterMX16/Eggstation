<<<<<<< HEAD
import { BooleanLike } from 'common/react';

import { useBackend } from '../backend';
=======
>>>>>>> tg-pr-88929
import {
  Box,
  Button,
  Divider,
  Dropdown,
<<<<<<< HEAD
  Flex,
  Icon,
  Modal,
  Section,
  Table,
} from '../components';
import { ButtonCheckbox } from '../components/Button';
import { Window } from '../layouts';

type PlayerLike = {
  [key: string]: {
    host: number;
    ready: BooleanLike;
  };
};

type Modifier = {
  name: string;
  desc: string;
  modpath: string;
  selected: BooleanLike;
  selectable: BooleanLike;
  player_selected: BooleanLike;
  player_selectable: BooleanLike;
};

type Data = {
  self: string;
  host: BooleanLike;
  admin: BooleanLike;
  playing: BooleanLike;
  loadouts: string[];
  maps: string[];
  map: {
    name: string;
    desc: string;
    time: number;
    min_players: number;
    max_players: number;
  };
  mod_menu_open: BooleanLike;
  modifiers: Modifier[];
  active_mods: string;
  loadoutdesc: string;
  players: PlayerLike[];
  observers: PlayerLike[];
};

export const DeathmatchLobby = (props) => {
  const { act, data } = useBackend<Data>();
  const { modifiers = [] } = data;
  return (
    <Window title="Deathmatch Lobby" width={560} height={480}>
      <ModSelector />
      <Window.Content>
        <Flex height="94%">
          <Flex.Item width="63%">
            <Section fill scrollable>
              <Table>
                <Table.Row>
                  <Table.Cell collapsing />
                  <Table.Cell>Name</Table.Cell>
                  <Table.Cell grow>Loadout</Table.Cell>
                  <Table.Cell collapsing>Ready</Table.Cell>
                </Table.Row>
                {Object.keys(data.players).map((player) => (
                  <Table.Row className="candystripe" key={player}>
                    <Table.Cell collapsing>
                      {!!data.players[player].host && <Icon name="star" />}
                    </Table.Cell>
                    <Table.Cell>
                      {(!(
                        (data.host && !data.players[player].host) ||
                        data.admin
                      ) && <b>{player}</b>) || (
                        <Dropdown
                          displayText={player}
                          options={['Kick', 'Transfer host', 'Toggle observe']}
                          onSelected={(value) =>
                            act('host', {
                              id: player,
                              func: value,
                            })
                          }
                        />
                      )}
                    </Table.Cell>
                    <Table.Cell grow>
                      <Dropdown
                        displayText={data.players[player].loadout}
                        disabled={!(data.host || player === data.self)}
                        options={data.loadouts}
                        onSelected={(value) =>
                          act('change_loadout', {
                            player: player,
                            loadout: value,
                          })
                        }
                      />
                    </Table.Cell>
                    <Table.Cell collapsing>
                      <ButtonCheckbox
                        disabled={player !== data.self}
                        checked={data.players[player].ready}
                        onClick={() => act('ready')}
                      />
                    </Table.Cell>
                  </Table.Row>
                ))}
                {Object.keys(data.observers).map((observer) => (
                  <Table.Row key={observer}>
                    <Table.Cell collapsing>
                      {(!!data.observers[observer].host && (
                        <Icon name="star" />
                      )) || <Icon name="eye" />}
                    </Table.Cell>
                    <Table.Cell>
                      {(!(
                        (data.host && !data.observers[observer].host) ||
                        data.admin
                      ) && <b>{observer}</b>) || (
                        <Dropdown
                          displayText={observer}
                          options={['Kick', 'Transfer host', 'Toggle observe']}
                          onSelected={(value) =>
                            act('host', {
                              id: observer,
                              func: value,
                            })
                          }
                        />
                      )}
                    </Table.Cell>
                    <Table.Cell grow>Observing</Table.Cell>
                  </Table.Row>
                ))}
              </Table>
            </Section>
          </Flex.Item>
          <Flex.Item width="210px">
            <Section>
              <Box textAlign="center">
                {(!!data.host && (
                  <Dropdown
                    displayText={data.map.name}
                    options={data.maps}
                    onSelected={(value) =>
                      act('host', {
                        func: 'change_map',
                        map: value,
                      })
                    }
                  />
                )) || <b>{data.map.name}</b>}
              </Box>
              <Divider />
              {data.map.desc}
              <Divider />
              <Box textAlign="center">
                Maximum Play Time: <b>{`${data.map.time / 600}min`}</b>
                <br />
                Min players: <b>{data.map.min_players}</b>
                <br />
                Max players: <b>{data.map.max_players}</b>
                <br />
                Current players: <b>{Object.keys(data.players).length}</b>
              </Box>
              <Divider />
              <Box textAlign="center">{data.active_mods}</Box>
              {(!!data.admin || !!data.host) && (
                <>
                  <Divider />
                  <Button
                    textAlign="center"
                    fluid
                    content="Toggle Modifiers"
                    onClick={() => act('open_mod_menu')}
                  />
                </>
              )}
              <Divider />
              <Box textAlign="center">Loadout Description</Box>
              <Divider />
              <Box textAlign="center">{data.loadoutdesc}</Box>
              {!!data.playing && (
                <>
                  <Divider />
                  <Box textAlign="center">
                    The game is currently in progress, or loading.
                  </Box>
                </>
              )}
            </Section>
          </Flex.Item>
        </Flex>
        <Button
          color="good"
          content="Start Game"
          onClick={() => act('start_game')}
        />
        <Button
          color="bad"
          content="Leave Game"
          onClick={() => act('leave_game')}
        />
        <Button
          color="caution"
          content={data.observers[data.self] ? 'Join' : 'Observe'}
          onClick={() => act('observe')}
        />
        {!!data.admin && (
          <Button
            icon="exclamation"
            color="caution"
            content="Force Start"
            onClick={() => act('admin', { func: 'Force start' })}
          />
        )}
      </Window.Content>
    </Window>
  );
};

const ModSelector = (props) => {
  const { act, data } = useBackend<Data>();
  const { admin, host, mod_menu_open, modifiers = [] } = data;
  if (!mod_menu_open || !(host || admin)) {
    return null;
  }
  return (
    <Modal>
      <Button
        fluid
        content="Go Back"
        color="bad"
        onClick={() => act('exit_mod_menu')}
      />
      {modifiers.map((mod, index) => {
        return (
          <Button.Checkbox
            key={index}
            mb={2}
            checked={mod.selected}
            content={mod.name}
            tooltip={mod.desc}
            color={mod.selected ? 'green' : 'blue'}
            disabled={!mod.selected && !mod.selectable}
            onClick={() =>
              act('toggle_modifier', {
                modpath: mod.modpath,
              })
            }
          />
        );
      })}
    </Modal>
  );
};
=======
  Icon,
  LabeledList,
  Modal,
  NoticeBox,
  Section,
  Stack,
  Table,
  Tooltip,
} from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';

import { useBackend } from '../backend';
import { Window } from '../layouts';

type Player = {
  host: number;
  key: string;
  loadout: string;
  ready: BooleanLike;
  mob: string;
};

type Modifier = {
  desc: string;
  modpath: string;
  name: string;
  player_selectable: BooleanLike;
  player_selected: BooleanLike;
  selectable: BooleanLike;
  selected: BooleanLike;
};

type Map = {
  desc: string;
  max_players: number;
  min_players: number;
  name: string;
  time: number;
};

type Data = {
  active_mods: string;
  admin: BooleanLike;
  host: BooleanLike;
  loadoutdesc: string;
  loadouts: string[];
  map: Map;
  maps: string[];
  mod_menu_open: BooleanLike;
  modifiers: Modifier[];
  observers: Player[];
  players: Player[];
  playing: BooleanLike;
  self: string;
};

export function DeathmatchLobby(props) {
  const { act, data } = useBackend<Data>();
  const {
    admin,
    host,
    mod_menu_open,
    observers = [],
    players = [],
    self,
  } = data;

  const allReady = players.every((player) => player.ready);

  const fullAccess = !!host || !!admin;
  const showMenu = fullAccess && !!mod_menu_open;

  const isObserver = observers.find((observer) => observer.key === self);

  return (
    <Window title="Deathmatch Lobby" width={560} height={480}>
      {showMenu && <ModSelector />}
      <Window.Content>
        <Stack fill vertical>
          <Stack.Item grow>
            <Stack fill>
              <Stack.Item grow={4}>
                <PlayerColumn />
              </Stack.Item>
              <Stack.Item grow={3}>
                <HostControls />
              </Stack.Item>
            </Stack>
          </Stack.Item>
          <Stack.Item>
            <Section>
              <Stack fill>
                <Stack.Item grow>
                  {!!admin && (
                    <Button
                      icon="exclamation"
                      color="caution"
                      onClick={() => act('admin', { func: 'Force start' })}
                    >
                      Force Start
                    </Button>
                  )}
                </Stack.Item>
                <Stack.Item>
                  <Button color="caution" onClick={() => act('observe')}>
                    {isObserver ? 'Join' : 'Observe'}
                  </Button>
                  <Button color="bad" onClick={() => act('leave_game')}>
                    Leave Game
                  </Button>
                  <Button
                    color="good"
                    disabled={!allReady}
                    onClick={() => act('start_game')}
                  >
                    Start Game
                  </Button>
                </Stack.Item>
              </Stack>
            </Section>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
}

function PlayerColumn(props) {
  const { act, data } = useBackend<Data>();
  const {
    admin,
    host,
    loadouts = [],
    observers = [],
    players = [],
    self,
  } = data;

  const allReady = players.every((player) => player.ready);

  const fullAccess = !!host || !!admin;

  return (
    <Section fill scrollable={players.length > 30}>
      <Table>
        <Table.Row header>
          <Table.Cell collapsing />
          <Table.Cell>Name</Table.Cell>
          <Table.Cell>Loadout</Table.Cell>
          <Table.Cell collapsing align="center">
            <Tooltip
              content={!allReady ? 'Players are preparing' : 'Press start!'}
            >
              <Icon
                name={!allReady ? 'check' : 'check-circle'}
                color={allReady && 'green'}
              />
            </Tooltip>
          </Table.Cell>
        </Table.Row>
        {players.map((player) => {
          const isHost = !!player.host;
          const isSelf = player.key === self;
          const canBoot = fullAccess && !isSelf;

          return (
            <Table.Row className="candystripe" key={player.key}>
              <Table.Cell align="center" collapsing verticalAlign="top">
                {isHost && (
                  <Tooltip content="Host">
                    <Icon color="gold" name="star" pt={isSelf && 0.5} />
                  </Tooltip>
                )}
                {!host && isSelf && (
                  <Tooltip content="You">
                    <Icon color="green" name="arrow-right" pt={0.9} />
                  </Tooltip>
                )}
              </Table.Cell>

              <Table.Cell verticalAlign="top" pt={!isHost && '2px'}>
                {!canBoot ? (
                  <Box color="label">{player.key}</Box>
                ) : (
                  <Dropdown
                    width={9}
                    selected={player.key}
                    options={['Kick', 'Transfer host', 'Toggle observe']}
                    onSelected={(value) =>
                      act('host', {
                        id: player.key,
                        func: value,
                      })
                    }
                  />
                )}
              </Table.Cell>

              <Table.Cell>
                {!isSelf ? (
                  <Box color="label">{player.loadout}</Box>
                ) : (
                  <Dropdown
                    width={10}
                    selected={player.loadout}
                    disabled={!host && !isSelf}
                    options={loadouts}
                    onSelected={(value) =>
                      act('change_loadout', {
                        player: player.key,
                        loadout: value,
                      })
                    }
                  />
                )}
              </Table.Cell>

              <Table.Cell align="center" verticalAlign="middle">
                {isSelf ? (
                  <Button.Checkbox
                    disabled={!isSelf}
                    checked={player.ready}
                    onClick={() => act('ready')}
                  />
                ) : (
                  !!player.ready && <Icon name="check" />
                )}
              </Table.Cell>
            </Table.Row>
          );
        })}
        {observers.map((observer) => {
          const isHost = !!observer.host;
          const isSelf = observer.key === self;
          const canBoot = fullAccess && !isSelf;

          return (
            <Table.Row key={observer.key}>
              <Table.Cell
                collapsing
                verticalAlign="top"
                pt={fullAccess && '2px'}
              >
                {isHost ? (
                  <Tooltip content="host">
                    <Icon name="star" />
                  </Tooltip>
                ) : (
                  <Icon name="eye" />
                )}
              </Table.Cell>
              <Table.Cell>
                {!canBoot ? (
                  <b>{observer.key}</b>
                ) : (
                  <Dropdown
                    width={9}
                    selected={observer.key}
                    options={['Kick', 'Transfer host', 'Toggle observe']}
                    onSelected={(value) =>
                      act('host', {
                        id: observer.key,
                        func: value,
                      })
                    }
                  />
                )}
              </Table.Cell>
              <Table.Cell color="label">Observing</Table.Cell>
            </Table.Row>
          );
        })}
      </Table>
    </Section>
  );
}

function HostControls(props) {
  const { act, data } = useBackend<Data>();
  const { active_mods = [], admin, host, loadoutdesc, playing } = data;

  const fullAccess = !!host || !!admin;

  return (
    <Section fill scrollable>
      <MapInfo />
      <Divider />
      <Box textAlign="center" color="average">
        {active_mods}
      </Box>
      {fullAccess && (
        <>
          <Divider />
          <Button textAlign="center" fluid onClick={() => act('open_mod_menu')}>
            Toggle Modifiers
          </Button>
        </>
      )}
      <Divider />
      <NoticeBox info align="center">
        Loadout Description
      </NoticeBox>

      <Box textAlign="center">{loadoutdesc}</Box>
      {!!playing && (
        <>
          <Divider />
          <Box textAlign="center">
            The game is currently in progress, or loading.
          </Box>
        </>
      )}
    </Section>
  );
}

const ModSelector = (props) => {
  const { act, data } = useBackend<Data>();
  const { modifiers = [] } = data;

  return (
    <Modal>
      <Button fluid color="bad" onClick={() => act('exit_mod_menu')}>
        Go Back
      </Button>
      {modifiers.map((mod, index) => (
        <Button.Checkbox
          key={index}
          mb={2}
          checked={mod.selected}
          tooltip={mod.desc}
          color={mod.selected ? 'green' : 'blue'}
          disabled={!mod.selected && !mod.selectable}
          onClick={() =>
            act('toggle_modifier', {
              modpath: mod.modpath,
            })
          }
        >
          {mod.name}
        </Button.Checkbox>
      ))}
    </Modal>
  );
};

function MapInfo(props) {
  const { act, data } = useBackend<Data>();
  const { host, maps = [], map, players } = data;

  if (!host && !map?.name) {
    return <NoticeBox align="center">No map selected</NoticeBox>;
  }

  return (
    <>
      {!host ? (
        <NoticeBox danger>{map.name}</NoticeBox>
      ) : (
        <>
          <Dropdown
            color="average"
            width="100%"
            selected={map.name}
            options={maps}
            onSelected={(value) =>
              act('host', {
                func: 'change_map',
                map: value,
              })
            }
          />
          <Divider />
        </>
      )}
      {map.desc}
      <Divider />
      <LabeledList>
        <LabeledList.Item label="Max Play Time">
          {`${map.time / 600}min`}
        </LabeledList.Item>
        <LabeledList.Item label="Min Players">
          {map.min_players}
        </LabeledList.Item>
        <LabeledList.Item label="Max Players">
          {map.max_players}
        </LabeledList.Item>
        <LabeledList.Item label="Current Players">
          {players.length}
        </LabeledList.Item>
      </LabeledList>
    </>
  );
}
>>>>>>> tg-pr-88929
