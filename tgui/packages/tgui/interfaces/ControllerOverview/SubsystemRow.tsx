<<<<<<< HEAD
import { useBackend } from '../../backend';
=======
import { Dispatch } from 'react';
>>>>>>> tg-pr-88929
import {
  Button,
  Icon,
  ProgressBar,
  Stack,
  Table,
  Tooltip,
<<<<<<< HEAD
} from '../../components';
=======
} from 'tgui-core/components';

import { useBackend } from '../../backend';
>>>>>>> tg-pr-88929
import { SORTING_TYPES } from './contants';
import { SortType, SubsystemData } from './types';

type Props = {
  max: number;
<<<<<<< HEAD
  setSelected: (newValue: SubsystemData) => void;
=======
  setSelected: Dispatch<SubsystemData>;
>>>>>>> tg-pr-88929
  showBars: boolean;
  sortType: SortType;
  subsystem: SubsystemData;
};

<<<<<<< HEAD
export const SubsystemRow = (props: Props) => {
=======
export function SubsystemRow(props: Props) {
>>>>>>> tg-pr-88929
  const { act } = useBackend();
  const { max, setSelected, showBars, sortType, subsystem } = props;
  const { can_fire, doesnt_fire, initialized, name, ref } = subsystem;

  const { propName } = SORTING_TYPES[sortType];
  const value = subsystem[propName];

  let icon = 'play';
  let color = 'good';
  let tooltip = 'Operational';
  if (!initialized) {
    icon = 'circle-exclamation';
    color = 'darkgreen';
    tooltip = 'Not initialized';
  } else if (doesnt_fire) {
    icon = 'check';
    color = 'grey';
    tooltip = 'Does not fire';
  } else if (!can_fire) {
    icon = 'pause';
    color = 'grey';
    tooltip = 'Paused';
  }

  let valueDisplay = '';
  let rangeDisplay = {};
  if (showBars) {
    if (sortType === SortType.Cost) {
      valueDisplay = value.toFixed(2) + 'ms';
      rangeDisplay = {
        average: [75, 124.99],
        bad: [125, Infinity],
      };
    } else {
      valueDisplay = value.toFixed(2) + '%';
      rangeDisplay = {
        average: [10, 24.99],
        bad: [25, Infinity],
      };
    }
  } else {
    valueDisplay = value;
  }

  return (
    <Table.Row>
      <Table.Cell collapsing align="center" verticalAlign="top">
        <Tooltip content={tooltip}>
          <Icon name={icon} color={color} />
        </Tooltip>
      </Table.Cell>
      <Table.Cell onClick={() => setSelected(subsystem)}>
        {showBars ? (
          <ProgressBar
            value={value}
            maxValue={max}
            ranges={rangeDisplay}
            mb={0.5}
          >
            {name} {valueDisplay}
          </ProgressBar>
        ) : (
          <Button fluid mb={0.5}>
            <Stack fill justify="space-between">
              <Stack.Item>{name}</Stack.Item>
              <Stack.Item>
                {sortType !== SortType.Name && valueDisplay}
              </Stack.Item>
            </Stack>
          </Button>
        )}
      </Table.Cell>
      <Table.Cell collapsing verticalAlign="top">
        <Button
          icon="wrench"
          tooltip="View Variables"
          onClick={() => {
            act('view_variables', { ref: ref });
          }}
        />
      </Table.Cell>
    </Table.Row>
  );
<<<<<<< HEAD
};
=======
}
>>>>>>> tg-pr-88929
