<<<<<<< HEAD
import { useBackend, useLocalState } from '../backend';
import { Input, NumberInput, Section, Button, Table } from '../components';
import { toFixed } from 'common/math';
=======
import { useState } from 'react';
import {
  Button,
  Input,
  NumberInput,
  Section,
  Table,
} from 'tgui-core/components';
import { toFixed } from 'tgui-core/math';

import { useBackend } from '../backend';
>>>>>>> tg-pr-88929
import { Window } from '../layouts';

const MatrixMathTesterInput = (props: { value: number; varName: string }) => {
  const { act } = useBackend();
  return (
    <NumberInput
<<<<<<< HEAD
      value={props.value}
      step={0.005}
      format={(value) => toFixed(value, 3)}
      width={'100%'}
      onChange={(e, value) =>
=======
      minValue={-Infinity}
      maxValue={Infinity}
      value={props.value}
      step={0.005}
      format={(value) => toFixed(value, 3)}
      fluid
      onChange={(value) =>
>>>>>>> tg-pr-88929
        act('change_var', { var_name: props.varName, var_value: value })
      }
    />
  );
};

type MatrixData = {
  matrix_a: number;
  matrix_b: number;
  matrix_c: number;
  matrix_d: number;
  matrix_e: number;
  matrix_f: number;
  pixelated: boolean;
};

export const MatrixMathTester = (props) => {
  const { act, data } = useBackend<MatrixData>();
  const {
    matrix_a,
    matrix_b,
    matrix_c,
    matrix_d,
    matrix_e,
    matrix_f,
    pixelated,
  } = data;
<<<<<<< HEAD
  const [scaleX, setScaleX] = useLocalState('scale_x', 1);
  const [scaleY, setScaleY] = useLocalState('scale_y', 1);
  const [translateX, setTranslateX] = useLocalState('translate_x', 0);
  const [translateY, setTranslateY] = useLocalState('translate_y', 0);
  const [shearX, setShearX] = useLocalState('shear_x', 0);
  const [shearY, setShearY] = useLocalState('shear_y', 0);
  const [angle, setAngle] = useLocalState('angle', 0);
=======
  const [scaleX, setScaleX] = useState(1);
  const [scaleY, setScaleY] = useState(1);
  const [translateX, setTranslateX] = useState(0);
  const [translateY, setTranslateY] = useState(0);
  const [shearX, setShearX] = useState(0);
  const [shearY, setShearY] = useState(0);
  const [angle, setAngle] = useState(0);

>>>>>>> tg-pr-88929
  return (
    <Window title="Nobody Wants to Learn Matrix Math" width={290} height={270}>
      <Window.Content>
        <Section fill>
          <Table>
            <Table.Row header>
<<<<<<< HEAD
              <Table.Cell width={'30%'}>X</Table.Cell>
              <Table.Cell width={'30%'}>Y</Table.Cell>
              <Table.Cell width={'40%'}>Z</Table.Cell>
=======
              <Table.Cell width="30%">X</Table.Cell>
              <Table.Cell width="30%">Y</Table.Cell>
              <Table.Cell width="40%">Z</Table.Cell>
>>>>>>> tg-pr-88929
            </Table.Row>
            <Table.Row>
              <Table.Cell>
                <MatrixMathTesterInput value={matrix_a} varName="a" />
              </Table.Cell>
              <Table.Cell>
                <MatrixMathTesterInput value={matrix_d} varName="d" />
              </Table.Cell>
              <Table.Cell>
<<<<<<< HEAD
                <Input disabled placeholder="0 (fixed value)" width={'100%'} />
=======
                <Input disabled placeholder="0 (fixed value)" fluid />
>>>>>>> tg-pr-88929
              </Table.Cell>
            </Table.Row>
            <Table.Row>
              <Table.Cell>
                <MatrixMathTesterInput value={matrix_b} varName="b" />
              </Table.Cell>
              <Table.Cell>
                <MatrixMathTesterInput value={matrix_e} varName="e" />
              </Table.Cell>
              <Table.Cell>
<<<<<<< HEAD
                <Input disabled placeholder="0 (fixed value)" width={'100%'} />
=======
                <Input disabled placeholder="0 (fixed value)" fluid />
>>>>>>> tg-pr-88929
              </Table.Cell>
            </Table.Row>
            <Table.Row>
              <Table.Cell>
                <MatrixMathTesterInput value={matrix_c} varName="c" />
              </Table.Cell>
              <Table.Cell>
                <MatrixMathTesterInput value={matrix_f} varName="f" />
              </Table.Cell>
              <Table.Cell>
<<<<<<< HEAD
                <Input disabled placeholder="1 (fixed value)" width={'100%'} />
=======
                <Input disabled placeholder="1 (fixed value)" fluid />
>>>>>>> tg-pr-88929
              </Table.Cell>
            </Table.Row>
          </Table>
          <Table mt={3}>
            <Table.Row header>
              <Table.Cell>Action</Table.Cell>
              <Table.Cell>X</Table.Cell>
              <Table.Cell>Y</Table.Cell>
            </Table.Row>
            <Table.Row>
              <Table.Cell>
                <Button
<<<<<<< HEAD
                  icon={'up-right-and-down-left-from-center'}
                  content={'Scale'}
                  width={'100%'}
                  onClick={() => act('scale', { x: scaleX, y: scaleY })}
                />
              </Table.Cell>
              <Table.Cell>
                <NumberInput
                  value={scaleX}
                  step={0.05}
                  format={(value) => toFixed(value, 2)}
                  width={'100%'}
                  onChange={(e, value) => setScaleX(value)}
=======
                  icon="up-right-and-down-left-from-center"
                  fluid
                  onClick={() => act('scale', { x: scaleX, y: scaleY })}
                >
                  Scale
                </Button>
              </Table.Cell>
              <Table.Cell>
                <NumberInput
                  minValue={-Infinity}
                  maxValue={Infinity}
                  value={scaleX}
                  step={0.05}
                  format={(value) => toFixed(value, 2)}
                  fluid
                  onChange={(value) => setScaleX(value)}
>>>>>>> tg-pr-88929
                />
              </Table.Cell>
              <Table.Cell>
                <NumberInput
<<<<<<< HEAD
                  value={scaleY}
                  step={0.05}
                  format={(value) => toFixed(value, 2)}
                  width={'100%'}
                  onChange={(e, value) => setScaleY(value)}
=======
                  minValue={-Infinity}
                  maxValue={Infinity}
                  value={scaleY}
                  step={0.05}
                  format={(value) => toFixed(value, 2)}
                  fluid
                  onChange={(value) => setScaleY(value)}
>>>>>>> tg-pr-88929
                />
              </Table.Cell>
            </Table.Row>
            <Table.Row>
              <Table.Cell>
                <Button
<<<<<<< HEAD
                  icon={'arrow-right'}
                  content={'Translate'}
                  width={'100%'}
                  onClick={() =>
                    act('translate', { x: translateX, y: translateY })
                  }
                />
              </Table.Cell>
              <Table.Cell>
                <NumberInput
                  value={translateX}
                  step={1}
                  format={(value) => toFixed(value, 0)}
                  width={'100%'}
                  onChange={(e, value) => setTranslateX(value)}
=======
                  icon="arrow-right"
                  fluid
                  onClick={() =>
                    act('translate', { x: translateX, y: translateY })
                  }
                >
                  Translate
                </Button>
              </Table.Cell>
              <Table.Cell>
                <NumberInput
                  minValue={-Infinity}
                  maxValue={Infinity}
                  value={translateX}
                  step={1}
                  format={(value) => toFixed(value, 0)}
                  fluid
                  onChange={(value) => setTranslateX(value)}
>>>>>>> tg-pr-88929
                />
              </Table.Cell>
              <Table.Cell>
                <NumberInput
<<<<<<< HEAD
                  value={translateY}
                  step={1}
                  format={(value) => toFixed(value, 0)}
                  width={'100%'}
                  onChange={(e, value) => setTranslateY(value)}
=======
                  minValue={-Infinity}
                  maxValue={Infinity}
                  value={translateY}
                  step={1}
                  format={(value) => toFixed(value, 0)}
                  fluid
                  onChange={(value) => setTranslateY(value)}
>>>>>>> tg-pr-88929
                />
              </Table.Cell>
            </Table.Row>
            <Table.Row>
              <Table.Cell>
                <Button
<<<<<<< HEAD
                  icon={'maximize'}
                  content={'Shear'}
                  width={'100%'}
                  onClick={() => act('shear', { x: shearX, y: shearY })}
                />
              </Table.Cell>
              <Table.Cell>
                <NumberInput
                  value={shearX}
                  step={0.005}
                  format={(value) => toFixed(value, 3)}
                  width={'100%'}
                  onChange={(e, value) => setShearX(value)}
=======
                  icon="maximize"
                  fluid
                  onClick={() => act('shear', { x: shearX, y: shearY })}
                >
                  Shear
                </Button>
              </Table.Cell>
              <Table.Cell>
                <NumberInput
                  minValue={-Infinity}
                  maxValue={Infinity}
                  value={shearX}
                  step={0.005}
                  format={(value) => toFixed(value, 3)}
                  fluid
                  onChange={(value) => setShearX(value)}
>>>>>>> tg-pr-88929
                />
              </Table.Cell>
              <Table.Cell>
                <NumberInput
<<<<<<< HEAD
                  value={shearY}
                  step={0.005}
                  format={(value) => toFixed(value, 3)}
                  width={'100%'}
                  onChange={(e, value) => setShearY(value)}
=======
                  minValue={-Infinity}
                  maxValue={Infinity}
                  value={shearY}
                  step={0.005}
                  format={(value) => toFixed(value, 3)}
                  fluid
                  onChange={(value) => setShearY(value)}
>>>>>>> tg-pr-88929
                />
              </Table.Cell>
            </Table.Row>
            <Table.Row>
              <Table.Cell>
                <Button
<<<<<<< HEAD
                  icon={'rotate-right'}
                  content={'Rotate'}
                  width={'100%'}
                  onClick={() => act('turn', { angle: angle })}
                />
=======
                  icon="rotate-right"
                  fluid
                  onClick={() => act('turn', { angle: angle })}
                >
                  Rotate
                </Button>
>>>>>>> tg-pr-88929
              </Table.Cell>
              <Table.Cell>
                <NumberInput
                  value={angle}
                  step={0.5}
                  maxValue={360}
                  minValue={-360}
                  format={(value) => toFixed(value, 1)}
<<<<<<< HEAD
                  width={'100%'}
                  onChange={(e, value) => setAngle(value)}
=======
                  fluid
                  onChange={(value) => setAngle(value)}
>>>>>>> tg-pr-88929
                />
              </Table.Cell>
              <Table.Cell>
                <Button
<<<<<<< HEAD
                  icon={'dog'}
                  color={'bad'}
                  selected={pixelated}
                  content={'PET'}
                  tooltip={'Pixel Enhanced Transforming'}
                  tooltipPosition={'bottom'}
                  width={'100%'}
                  onClick={() => act('toggle_pixel')}
                />
=======
                  icon="dog"
                  color="bad"
                  selected={pixelated}
                  tooltip="Pixel Enhanced Transforming"
                  tooltipPosition="bottom"
                  fluid
                  onClick={() => act('toggle_pixel')}
                >
                  PET
                </Button>
>>>>>>> tg-pr-88929
              </Table.Cell>
            </Table.Row>
          </Table>
        </Section>
      </Window.Content>
    </Window>
  );
};
