/**
 * @file
 * @copyright 2021 Aleksej Komarov
 * @license MIT
 */

<<<<<<< HEAD
import { useLocalState } from '../backend';
=======
import { useState } from 'react';
>>>>>>> tg-pr-88929
import {
  Box,
  DraggableControl,
  Icon,
  Input,
  Knob,
  LabeledList,
  NumberInput,
  Section,
  Slider,
<<<<<<< HEAD
} from '../components';
=======
} from 'tgui-core/components';
>>>>>>> tg-pr-88929

export const meta = {
  title: 'Input',
  render: () => <Story />,
};

const Story = (props) => {
<<<<<<< HEAD
  const [number, setNumber] = useLocalState('number', 0);
  const [text, setText] = useLocalState('text', 'Sample text');
=======
  const [number, setNumber] = useState(0);
  const [text, setText] = useState('Sample text');
>>>>>>> tg-pr-88929
  return (
    <Section>
      <LabeledList>
        <LabeledList.Item label="Input (onChange)">
          <Input value={text} onChange={(e, value) => setText(value)} />
        </LabeledList.Item>
        <LabeledList.Item label="Input (onInput)">
          <Input value={text} onInput={(e, value) => setText(value)} />
        </LabeledList.Item>
        <LabeledList.Item label="NumberInput (onChange)">
          <NumberInput
            animated
            width="40px"
            step={1}
            stepPixelSize={5}
            value={number}
            minValue={-100}
            maxValue={100}
            onChange={(value) => setNumber(value)}
          />
        </LabeledList.Item>
        <LabeledList.Item label="NumberInput (onDrag)">
          <NumberInput
            animated
            width="40px"
            step={1}
            stepPixelSize={5}
            value={number}
            minValue={-100}
            maxValue={100}
            onDrag={(value) => setNumber(value)}
          />
        </LabeledList.Item>
        <LabeledList.Item label="Slider (onDrag)">
          <Slider
            step={1}
            stepPixelSize={5}
            value={number}
            minValue={-100}
            maxValue={100}
            onDrag={(e, value) => setNumber(value)}
          />
        </LabeledList.Item>
        <LabeledList.Item label="Knob (onDrag)">
          <Knob
            inline
            size={1}
            step={1}
            stepPixelSize={2}
            value={number}
            minValue={-100}
            maxValue={100}
            onDrag={(e, value) => setNumber(value)}
          />
          <Knob
            ml={1}
            inline
            bipolar
            size={1}
            step={1}
            stepPixelSize={2}
            value={number}
            minValue={-100}
            maxValue={100}
            onDrag={(e, value) => setNumber(value)}
          />
        </LabeledList.Item>
        <LabeledList.Item label="Rotating Icon">
          <Box inline position="relative">
            <DraggableControl
              value={number}
              minValue={-100}
              maxValue={100}
              dragMatrix={[0, -1]}
              step={1}
              stepPixelSize={5}
              onDrag={(e, value) => setNumber(value)}
            >
              {(control) => (
                <Box onMouseDown={control.handleDragStart}>
                  <Icon
                    size={4}
                    color="yellow"
                    name="times"
                    rotation={control.displayValue * 4}
                  />
                  {control.inputElement}
                </Box>
              )}
            </DraggableControl>
          </Box>
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
};
