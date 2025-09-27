import {
  Box,
  Button,
  Knob,
  LabeledList,
  ProgressBar,
  Stack,
} from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';

import { useBackend } from '../backend';
<<<<<<< HEAD
import {
  Box,
  ProgressBar,
  NoticeBox,
  Button,
  LabeledList,
  Section,
} from '../components';
=======
>>>>>>> tg-pr-88929
import { Window } from '../layouts';

type RegHolderData = {
  total_volume: number;
  maximum_volume: number;
  temp: number;
  color: string;
};

<<<<<<< HEAD
export const ChemSeparator = (props) => {
  const { act, data } = useBackend<Data>();
=======
type Data = {
  flask: RegHolderData;
  beaker: RegHolderData;
  fuel: RegHolderData;
  burner_on: BooleanLike;
  knob: number;
  condenser_installed: BooleanLike;
  condenser_on: BooleanLike;
  max_burner_knob_settings: number;
};

export const ChemSeparator = (props) => {
  const { act, data } = useBackend<Data>();
  const {
    flask,
    beaker,
    fuel,
    burner_on,
    knob,
    condenser_installed,
    condenser_on,
    max_burner_knob_settings,
  } = data;

>>>>>>> tg-pr-88929
  return (
    <Window width={370} height={215}>
      <Window.Content>
        <LabeledList>
          <LabeledList.Item
            label={
              <Box
                style={{
                  transform: 'translate(20%, -50%)',
                  width: '57px',
                }}
              >
                Flask:
              </Box>
            }
          >
            <Stack fill>
              <Stack.Item ml="27px">
                <ProgressBar
                  height={2}
                  minValue={0}
                  maxValue={flask.maximum_volume}
                  value={flask.total_volume}
                  color={flask.color}
                  width="170px"
                >
                  <Box
                    lineHeight={1.9}
                    style={{
                      textShadow: '1px 1px 0 black',
                    }}
                  >
                    {`${Math.ceil(flask.total_volume)} of ${
                      flask.maximum_volume
                    } units at ${Math.ceil(flask.temp)}K`}
                  </Box>
                </ProgressBar>
              </Stack.Item>
              <Stack.Item>
                <Button
                  mr={2}
                  width={6}
                  lineHeight={2}
                  align="center"
                  icon="arrow-down"
                  disabled={flask.total_volume <= 0 || !beaker}
                  onClick={() => act('drain')}
                >
                  Drain
                </Button>
              </Stack.Item>
            </Stack>
          </LabeledList.Item>
          {beaker && (
            <LabeledList.Item
              label={
                <Box
                  style={{
                    transform: 'translate(20%, -50%)',
                    width: '57px',
                  }}
                >
                  Beaker:
                </Box>
              }
            >
              <Stack fill>
                <Stack.Item ml="27px">
                  <ProgressBar
                    height={2}
                    minValue={0}
                    maxValue={beaker.maximum_volume}
                    value={beaker.total_volume}
                    color={beaker.color}
                    width="170px"
                  >
                    <Box
                      lineHeight={1.9}
                      style={{
                        textShadow: '1px 1px 0 black',
                      }}
                    >
                      {`${Math.ceil(beaker.total_volume)} of ${
                        beaker.maximum_volume
                      } units at ${Math.ceil(beaker.temp)}K`}
                    </Box>
                  </ProgressBar>
                </Stack.Item>
                <Stack.Item>
                  <Button
                    mr={2}
                    width={6}
                    lineHeight={2}
                    align="center"
                    icon="filter"
                    disabled={beaker.total_volume <= 0}
                    onClick={() => act('filter')}
                  >
                    Filter
                  </Button>
                </Stack.Item>
              </Stack>
            </LabeledList.Item>
          )}
          <LabeledList.Item
            label={
              <Box
                style={{
                  transform: 'translate(20%, -50%)',
                  width: '57px',
                }}
              >
                Burner Knob:
              </Box>
            }
          >
            <Knob
              ml="30px"
              size={1.3}
              minValue={1}
              maxValue={max_burner_knob_settings}
              step={1}
              stepPixelSize={10}
              value={knob}
              onDrag={(_e, value) =>
                act('knob', {
                  amount: value,
                })
              }
            />
          </LabeledList.Item>
          {fuel && (
            <LabeledList.Item
              label={
                <Box
                  style={{
                    transform: 'translate(20%, -20%)',
                    width: '57px',
                  }}
                >
                  Fuel Source:
                </Box>
              }
            >
              <ProgressBar
                height={2}
                minValue={0}
<<<<<<< HEAD
                maxValue={data.own_maximum_volume}
                color={data.own_reagent_color}
=======
                maxValue={fuel.maximum_volume}
                value={fuel.total_volume}
                color={fuel.color}
                maxWidth="170px"
                ml="25px"
>>>>>>> tg-pr-88929
              >
                <Box
                  lineHeight={1.9}
                  style={{
<<<<<<< HEAD
                    'text-shadow': '1px 1px 0 black',
                  }}
                >
                  {`${Math.ceil(data.own_total_volume)} of ${
                    data.own_maximum_volume
                  } units at ${Math.ceil(data.temperature)}°C`}
=======
                    textShadow: '1px 1px 0 black',
                  }}
                >
                  {`${Math.ceil(fuel.total_volume)} of ${
                    fuel.maximum_volume
                  } units at ${Math.ceil(fuel.temp)}K`}
>>>>>>> tg-pr-88929
                </Box>
              </ProgressBar>
            </LabeledList.Item>
          )}
          {!!condenser_installed &&
            (flask.total_volume > 0 || beaker?.total_volume > 0) &&
            fuel?.total_volume > 0 && (
              <LabeledList.Item
<<<<<<< HEAD
                label="Container"
                buttons={
                  <Box my={1}>
                    <Button
                      mr={2}
                      width={6}
                      lineHeight={2}
                      align="center"
                      content="Fill"
                      icon="arrow-up"
                      disabled={
                        data.is_burning ||
                        !data.beaker_total_volume ||
                        data.own_total_volume >= data.own_maximum_volume
                      }
                      onClick={() => act('load')}
                    />
                    <Button
                      width={6}
                      lineHeight={2}
                      align="center"
                      icon="eject"
                      content="Eject"
                      disabled={data.is_burning}
                      onClick={() => act('eject')}
                    />
                  </Box>
                }
              >
                <ProgressBar
                  height={2}
                  value={data.beaker_total_volume}
                  minValue={0}
                  maxValue={data.beaker_maximum_volume}
                  color={data.beaker_reagent_color}
                >
=======
                label={
>>>>>>> tg-pr-88929
                  <Box
                    style={{
<<<<<<< HEAD
                      'text-shadow': '1px 1px 0 black',
                    }}
                  >
                    {`${Math.ceil(data.beaker_total_volume)} of ${
                      data.beaker_maximum_volume
                    } units`}
=======
                      transform: 'translate(20%, -20%)',
                      width: '57px',
                    }}
                  >
                    Cooling:
>>>>>>> tg-pr-88929
                  </Box>
                }
              >
                <Button
                  icon="thermometer-full"
                  disabled={burner_on}
                  selected={condenser_on}
                  fontSize="15px"
                  ml="25px"
                  onClick={() => act('cool')}
                >
                  Start
                </Button>
              </LabeledList.Item>
            )}
        </LabeledList>
      </Window.Content>
    </Window>
  );
};
