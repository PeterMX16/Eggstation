<<<<<<< HEAD
import { useBackend } from '../backend';
import { Box, Chart, Divider, Section } from '../components';
=======
import { Box, Divider, Section } from 'tgui-core/components';

import { useBackend } from '../backend';
>>>>>>> tg-pr-88929
import { Window } from '../layouts';

type Data = {
  error_message: string | null;
  last_power_output: string | null;
  cold_data: CirculatorData[];
  hot_data: CirculatorData[];
<<<<<<< HEAD
  past_power_info;
=======
>>>>>>> tg-pr-88929
};

type CirculatorData = {
  temperature_inlet: number | null;
  temperature_outlet: number | null;
  pressure_inlet: number | null;
  pressure_outlet: number | null;
};

export const ThermoElectricGenerator = (props) => {
  const { act, data } = useBackend<Data>();
  const {
    error_message,
    last_power_output,
    cold_data = [],
    hot_data = [],
<<<<<<< HEAD
    past_power_info,
  } = data;
  const powerHistory = past_power_info.map((value, i) => [i, value]);
  const powerMax = Math.max(...past_power_info);

=======
  } = data;
>>>>>>> tg-pr-88929
  if (error_message) {
    return (
      <Window width={320} height={100}>
        <Window.Content>
          <Section>ERROR: {error_message}</Section>
        </Window.Content>
      </Window>
    );
  }
  return (
<<<<<<< HEAD
    <Window width={350} height={280}>
      <Window.Content>
        <Box>
          <Chart.Line
            height="5em"
            data={powerHistory}
            rangeX={[0, powerHistory.length - 1]}
            rangeY={[0, powerMax]}
            strokeColor="rgba(0, 181, 173, 1)"
            fillColor="rgba(0, 181, 173, 0.25)"
          />
        </Box>
=======
    <Window width={350} height={195}>
      <Window.Content>
>>>>>>> tg-pr-88929
        <Section>
          <Box>
            <Box>Last Output: {last_power_output}</Box>
            <Divider />
            <Box m={1} textColor="cyan" bold>
              Cold Loop
            </Box>
            {cold_data.map((data, index) => (
              <Box key={index}>
                <Box>
                  Temperature Inlet: {data.temperature_inlet} K / Outlet:{' '}
                  {data.temperature_outlet} K
                </Box>
                <Box>
                  Pressure Inlet: {data.pressure_inlet} kPa / Outlet:{' '}
                  {data.pressure_outlet} kPa
                </Box>
              </Box>
            ))}
          </Box>
          <Box>
            <Box m={1} textColor="red" bold>
              Hot loop{' '}
            </Box>
            {hot_data.map((data, index) => (
              <Box key={index}>
                <Box>
                  Temperature Inlet: {data.temperature_inlet} K / Outlet:{' '}
                  {data.temperature_outlet} K
                </Box>
                <Box>
                  Pressure Inlet: {data.pressure_inlet} kPa / Outlet:{' '}
                  {data.pressure_outlet} kPa
                </Box>
              </Box>
            ))}
          </Box>
        </Section>
      </Window.Content>
    </Window>
  );
};
