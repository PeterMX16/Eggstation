import { Button, NumberInput, Section } from 'tgui-core/components';

import { useBackend } from '../backend';
<<<<<<< HEAD
import {
  AnimatedNumber,
  Box,
  Button,
  LabeledList,
  NumberInput,
  Section,
} from '../components';
=======
>>>>>>> tg-pr-88929
import { Window } from '../layouts';
import { Beaker, BeakerDisplay } from './common/BeakerDisplay';

type Data = {
  amount: number;
  temp: number;
  purity: number;
  beaker: Beaker;
};

export const ChemDebugSynthesizer = (props) => {
  const { act, data } = useBackend<Data>();
<<<<<<< HEAD
  const {
    amount,
    purity,
    beakerCurrentVolume,
    beakerMaxVolume,
    isBeakerLoaded,
    beakerContents = [],
  } = data;
=======
  const { amount, temp, purity, beaker } = data;
>>>>>>> tg-pr-88929

  return (
    <Window width={390} height={330}>
      <Window.Content scrollable>
        <Section
          title="Recipient"
          buttons={
            beaker ? (
              <>
                <NumberInput
                  value={amount}
                  unit="u"
                  minValue={1}
                  maxValue={beaker.maxVolume}
                  step={1}
                  stepPixelSize={2}
                  onChange={(value) =>
                    act('amount', {
                      amount: value,
                    })
                  }
                />
                <NumberInput
                  value={temp}
                  unit="K"
                  minValue={0}
                  maxValue={1000}
                  step={1}
                  stepPixelSize={2}
                  onChange={(value) =>
                    act('temp', {
                      amount: value,
                    })
                  }
                />
                <NumberInput
                  value={purity}
                  unit="%"
                  minValue={0}
                  maxValue={120}
                  step={1}
                  stepPixelSize={2}
                  onChange={(value) =>
                    act('purity', {
                      amount: value,
                    })
                  }
                />
                <Button
                  icon="plus"
                  content="Input"
                  onClick={() => act('input')}
                />
              </>
            ) : (
              <Button
                icon="plus"
                content="Create Beaker"
                onClick={() => act('makecup')}
              />
            )
          }
        >
<<<<<<< HEAD
          {isBeakerLoaded ? (
            <>
              <Box>
                <AnimatedNumber value={beakerCurrentVolume} />
                {' / ' + beakerMaxVolume + ' u'}
              </Box>
              {beakerContents.length > 0 ? (
                <LabeledList>
                  {beakerContents.map((chem) => (
                    <LabeledList.Item key={chem.name} label={chem.name}>
                      {chem.volume} u
                    </LabeledList.Item>
                  ))}
                </LabeledList>
              ) : (
                <Box color="bad">Recipient Empty</Box>
              )}
            </>
          ) : (
            <Box color="average">No Recipient</Box>
          )}
=======
          <BeakerDisplay beaker={beaker} showpH />
>>>>>>> tg-pr-88929
        </Section>
      </Window.Content>
    </Window>
  );
};
