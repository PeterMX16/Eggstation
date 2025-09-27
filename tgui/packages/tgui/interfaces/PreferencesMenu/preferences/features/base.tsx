<<<<<<< HEAD
import { sortBy, sortStrings } from 'common/collections';
import { BooleanLike, classes } from 'common/react';
import { ComponentType, createComponentVNode, InfernoNode } from 'inferno';
import { VNodeFlags } from 'inferno-vnode-flags';
import { sendAct, useBackend, useLocalState } from '../../../../backend';
=======
import { sortBy } from 'common/collections';
import {
  ComponentType,
  createElement,
  ReactNode,
  useEffect,
  useState,
} from 'react';
import { sendAct, useBackend } from 'tgui/backend';
>>>>>>> tg-pr-88929
import {
  Box,
  Button,
  Dropdown,
  Input,
  NumberInput,
<<<<<<< HEAD
  Stack,
  Flex,
  Tooltip,
} from '../../../../components';
=======
  Slider,
  Stack,
} from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';

>>>>>>> tg-pr-88929
import { createSetPreference, PreferencesMenuData } from '../../data';
import { ServerPreferencesFetcher } from '../../ServerPreferencesFetcher';
import features from '.';

export const sortChoices = (array: [string, ReactNode][]) =>
  sortBy(array, ([name]) => name);

export type Feature<
  TReceiving,
  TSending = TReceiving,
<<<<<<< HEAD
  TServerData = unknown,
=======
  TServerData = undefined,
>>>>>>> tg-pr-88929
> = {
  name: string;
  component: FeatureValue<TReceiving, TSending, TServerData>;
  category?: string;
  subcategory?: string;
  description?: string;
  predictable?: boolean;
  small_supplemental?: boolean;
};

/**
 * Represents a preference.
 * TReceiving = The type you will be receiving
 * TSending = The type you will be sending
 * TServerData = The data the server sends through preferences.json
 */
type FeatureValue<
  TReceiving,
  TSending = TReceiving,
<<<<<<< HEAD
  TServerData = unknown,
=======
  TServerData = undefined,
>>>>>>> tg-pr-88929
> = ComponentType<FeatureValueProps<TReceiving, TSending, TServerData>>;

export type FeatureValueProps<
  TReceiving,
  TSending = TReceiving,
  TServerData = undefined,
> = Readonly<{
  act: typeof sendAct;
  featureId: string;
  handleSetValue: (newValue: TSending) => void;
  serverData: TServerData | undefined;
  shrink?: boolean;
<<<<<<< HEAD
  value?: TReceiving;
=======
  value: TReceiving;
>>>>>>> tg-pr-88929
}>;

export const FeatureColorInput = (props: FeatureValueProps<string>) => {
  return (
    <Button
      tooltip={features[props.featureId].name}
      onClick={() => {
        props.act('set_color_preference', {
          preference: props.featureId,
        });
      }}
    >
      <Stack align="center" fill>
        <Stack.Item>
          <Box
            style={{
              background: props.value?.startsWith('#')
                ? props.value
                : `#${props.value}`,
              border: '2px solid white',
              boxSizing: 'content-box',
              height: '11px',
              width: '11px',
              ...(props.shrink
                ? {
                    margin: '1px',
                  }
                : {}),
            }}
          />
        </Stack.Item>

        {!props.shrink && <Stack.Item>Change</Stack.Item>}
      </Stack>
    </Button>
  );
};

export type FeatureToggle = Feature<BooleanLike, boolean>;

export const TextInput = (props: FeatureValueProps<string, string>) => {
  return (
    <Input
      value={props.value}
      onInput={(_, newValue) => props.handleSetValue(newValue)}
      width="100%"
    />
  );
};

export const CheckboxInput = (
  props: FeatureValueProps<BooleanLike, boolean>,
) => {
  return (
    <Button.Checkbox
      checked={!!props.value}
      onClick={() => {
        props.handleSetValue(!props.value);
      }}
    />
  );
};

export const CheckboxInputInverse = (
  props: FeatureValueProps<BooleanLike, boolean>,
) => {
  return (
    <Button.Checkbox
      checked={!props.value}
      onClick={() => {
        props.handleSetValue(!props.value);
      }}
    />
  );
};

export function createDropdownInput<T extends string | number = string>(
  // Map of value to display texts
<<<<<<< HEAD
  choices: Record<T, InfernoNode>,
  dropdownProps?: Record<T, unknown>,
): FeatureValue<T> => {
=======
  choices: Record<T, ReactNode>,
  dropdownProps?: Record<T, unknown>,
): FeatureValue<T> {
>>>>>>> tg-pr-88929
  return (props: FeatureValueProps<T>) => {
    return (
      <Dropdown
        selected={choices[props.value] as string}
        onSelected={props.handleSetValue}
        width="100%"
        options={sortChoices(Object.entries(choices)).map(
          ([dataValue, label]) => {
            return {
              displayText: label,
              value: dataValue,
            };
          },
        )}
        {...dropdownProps}
      />
    );
  };
}

export type FeatureChoicedServerData = {
  choices: string[];
  display_names?: Record<string, string>;
  icons?: Record<string, string>;
};

export type FeatureChoiced = Feature<string, string, FeatureChoicedServerData>;

<<<<<<< HEAD
const capitalizeFirstLetter = (text: string) =>
  text.toString().charAt(0).toUpperCase() + text.toString().slice(1);

export const StandardizedDropdown = (props: {
  choices: string[];
  disabled?: boolean;
  displayNames: Record<string, InfernoNode>;
  onSetValue: (newValue: string) => void;
  value?: string;
  buttons?: boolean;
  displayHeight?: string;
}) => {
  const {
    choices,
    disabled,
    buttons,
    displayNames,
    onSetValue,
    displayHeight,
    value,
  } = props;

  return (
    <Dropdown
      disabled={disabled}
      buttons={buttons}
      selected={value}
      onSelected={onSetValue}
      clipSelectedText={false}
      displayHeight={displayHeight}
      width="100%"
      displayText={value ? displayNames[value] : ''}
      options={choices.map((choice) => {
        return {
          displayText: displayNames[choice],
          value: choice,
        };
      })}
    />
  );
};

export const FeatureDropdownInput = (
  props: FeatureValueProps<string, string, FeatureChoicedServerData> & {
    disabled?: boolean;
    buttons?: boolean;
  },
) => {
  const serverData = props.serverData;
  if (!serverData) {
    return null;
  }

  const displayNames =
    serverData.display_names ||
    Object.fromEntries(
      serverData.choices.map((choice) => [
        choice,
        capitalizeFirstLetter(choice),
      ]),
    );

  return serverData.choices.length > 5 ? (
    <StandardizedDropdown
      choices={sortStrings(serverData.choices)}
      disabled={props.disabled}
      buttons={props.buttons}
      displayNames={displayNames}
      onSetValue={props.handleSetValue}
      value={props.value}
    />
  ) : (
    <StandardizedChoiceButtons
      choices={sortStrings(serverData.choices)}
      disabled={props.disabled}
      displayNames={displayNames}
      onSetValue={props.handleSetValue}
      value={props.value}
    />
  );
};

export const FeatureIconnedDropdownInput = (
  props: FeatureValueProps<string, string, FeatureChoicedServerData> & {
    buttons?: boolean;
  },
) => {
  const serverData = props.serverData;
  if (!serverData) {
    return null;
  }

  const icons = serverData.icons;

  const textNames =
    serverData.display_names ||
    Object.fromEntries(
      serverData.choices.map((choice) => [
        choice,
        capitalizeFirstLetter(choice),
      ]),
    );

  const displayNames = Object.fromEntries(
    Object.entries(textNames).map(([choice, textName]) => {
      let element: InfernoNode = textName;

      if (icons && icons[choice]) {
        const icon = icons[choice];
        element = (
          <Stack>
            <Stack.Item>
              <Box
                className={classes(['preferences32x32', icon])}
                style={{
                  transform: 'scale(0.8)',
                }}
              />
            </Stack.Item>

            <Stack.Item grow style={{ 'line-height': '32px' }}>
              {element}
            </Stack.Item>
          </Stack>
        );
      }

      return [choice, element];
    }),
  );

  return (
    <StandardizedDropdown
      buttons={props.buttons}
      choices={sortStrings(serverData.choices)}
      displayNames={displayNames}
      onSetValue={props.handleSetValue}
      value={props.value}
      displayHeight="32px"
    />
  );
};

export const StandardizedChoiceButtons = (props: {
  choices: string[];
  disabled?: boolean;
  displayNames: Record<string, InfernoNode>;
  onSetValue: (newValue: string) => void;
  value?: string;
}) => {
  const { choices, disabled, displayNames, onSetValue, value } = props;
  return (
    <>
      {choices.map((choice) => (
        <Button
          key={choice}
          content={displayNames[choice]}
          selected={choice === value}
          disabled={disabled}
          onClick={() => onSetValue(choice)}
        />
      ))}
    </>
  );
};

=======
>>>>>>> tg-pr-88929
export type FeatureNumericData = {
  minimum: number;
  maximum: number;
  step: number;
};

export type FeatureNumeric = Feature<number, number, FeatureNumericData>;

export const FeatureNumberInput = (
  props: FeatureValueProps<number, number, FeatureNumericData>,
) => {
  if (!props.serverData) {
    return <Box>Loading...</Box>;
  }

  return (
    <NumberInput
      onChange={(value) => {
        props.handleSetValue(value);
      }}
      minValue={props.serverData.minimum}
      maxValue={props.serverData.maximum}
      step={props.serverData.step}
      value={props.value}
    />
  );
};

<<<<<<< HEAD
=======
export const FeatureSliderInput = (
  props: FeatureValueProps<number, number, FeatureNumericData>,
) => {
  if (!props.serverData) {
    return <Box>Loading...</Box>;
  }

  return (
    <Slider
      onChange={(e, value) => {
        props.handleSetValue(value);
      }}
      minValue={props.serverData.minimum}
      maxValue={props.serverData.maximum}
      step={props.serverData.step}
      value={props.value}
      stepPixelSize={10}
    />
  );
};

>>>>>>> tg-pr-88929
export const FeatureValueInput = (props: {
  feature: Feature<unknown>;
  featureId: string;
  shrink?: boolean;
  value: unknown;

  act: typeof sendAct;
}) => {
  const { data } = useBackend<PreferencesMenuData>();

  const feature = props.feature;

<<<<<<< HEAD
  const [predictedValue, setPredictedValue] =
    feature.predictable === undefined || feature.predictable
      ? useLocalState(
          `${props.featureId}_predictedValue_${data.active_slot}`,
          props.value,
        )
      : [props.value, () => {}];
=======
  const [predictedValue, setPredictedValue] = useState(props.value);
>>>>>>> tg-pr-88929

  const changeValue = (newValue: unknown) => {
    setPredictedValue(newValue);
    createSetPreference(props.act, props.featureId)(newValue);
  };
<<<<<<< HEAD
=======

  useEffect(() => {
    setPredictedValue(props.value);
  }, [data.active_slot, props.value]);

>>>>>>> tg-pr-88929
  return (
    <ServerPreferencesFetcher
      render={(serverData) => {
        return createElement(feature.component, {
          act: props.act,
          featureId: props.featureId,
          serverData: serverData?.[props.featureId] as any,
          shrink: props.shrink,

<<<<<<< HEAD
            handleSetValue: changeValue,
            value: predictedValue,
          },
        );
=======
          handleSetValue: changeValue,
          value: predictedValue,
        });
>>>>>>> tg-pr-88929
      }}
    />
  );
};

export type FeatureShortTextData = {
  maximum_length: number;
};

export const FeatureShortTextInput = (
  props: FeatureValueProps<string, string, FeatureShortTextData>,
) => {
  if (!props.serverData) {
    return <Box>Loading...</Box>;
  }

  return (
    <Input
      width="100%"
      value={props.value}
      maxLength={props.serverData.maximum_length}
      updateOnPropsChange
      onChange={(_, value) => props.handleSetValue(value)}
    />
  );
};

export type HexValue = {
  lightness: number;
  value: string;
};

export const StandardizedPalette = (props: {
  choices: string[];
  choices_to_hex?: Record<string, string>;
  disabled?: boolean;
  displayNames: Record<string, InfernoNode>;
  onSetValue: (newValue: string) => void;
  value?: string;
  hex_values?: boolean;
  allow_custom?: boolean;
  act?: typeof sendAct;
  featureId?: string;
  maxWidth?: string;
  backgroundColor?: string;
  includeHex?: boolean;
}) => {
  const {
    choices,
    disabled,
    displayNames,
    onSetValue,
    hex_values,
    allow_custom,
    maxWidth = '100%',
    backgroundColor,
    includeHex = false,
  } = props;
  const choices_to_hex = hex_values
    ? Object.fromEntries(choices.map((v) => [v, v]))
    : props.choices_to_hex!;
  const safeHex = (v: string) => {
    if (v.length === 3) {
      // sanitize short colors
      v = v[0] + v[0] + v[1] + v[1] + v[2] + v[2];
    } else if (v.length === 4) {
      v = v[1] + v[1] + v[2] + v[2] + v[3] + v[3];
    }
    return (v.startsWith('#') ? v : `#${v}`).toLowerCase();
  };
  const safeValue = hex_values
    ? props.value && safeHex(props.value)
    : props.value;
  return (
    <Flex style={{ 'align-items': 'baseline', 'max-width': maxWidth }}>
      <Flex.Item
        shrink
        style={{
          'border-radius': '0.16em',
          'max-width': maxWidth,
          'padding-bottom': '-5px',
        }}
        className="section-background"
        backgroundColor={backgroundColor}
        p={0.5}
      >
        <Flex style={{ 'flex-wrap': 'wrap', 'max-width': maxWidth }}>
          {choices.map((choice) => (
            <Flex.Item key={choice} ml={0}>
              <Tooltip
                content={`${displayNames[choice]}${
                  includeHex ? ` (${safeHex(choice)})` : ''
                }`}
                position="bottom"
              >
                <Box
                  className={classes([
                    'ColorSelectBox',
                    (hex_values ? safeHex(choice) : choice) === safeValue &&
                      'ColorSelectBox--selected',
                    disabled && 'ColorSelectBox--disabled',
                  ])}
                  onClick={
                    disabled
                      ? null
                      : () => onSetValue(hex_values ? safeHex(choice) : choice)
                  }
                  width="16px"
                  height="16px"
                >
                  <Box
                    className="ColorSelectBox--inner"
                    style={{
                      'background-color': hex_values
                        ? choice
                        : choices_to_hex[choice],
                    }}
                  />
                </Box>
              </Tooltip>
            </Flex.Item>
          ))}
          {allow_custom && (
            <>
              <Flex.Item grow />
              {!Object.values(choices_to_hex)
                .map(safeHex)
                .includes(safeValue!) && (
                <Flex.Item>
                  <Tooltip
                    content={`Your Custom Selection (${safeValue})`}
                    position="bottom"
                  >
                    <Box
                      className={classes([
                        'ColorSelectBox',
                        'ColorSelectBox--selected',
                      ])}
                      width="16px"
                      height="16px"
                    >
                      <Box
                        className="ColorSelectBox--inner"
                        style={{
                          'background-color': `${safeValue}`,
                        }}
                      />
                    </Box>
                  </Tooltip>
                </Flex.Item>
              )}

              <Flex.Item ml={0.5}>
                <Button
                  tooltip="Choose Custom"
                  tooltipPosition="bottom"
                  height="20px"
                  style={{ 'border-radius': '0' }}
                  icon="plus"
                  color="good"
                  onClick={() => {
                    if (props.act && props.featureId) {
                      props.act('set_color_preference', {
                        preference: props.featureId,
                      });
                    }
                  }}
                />
              </Flex.Item>
            </>
          )}
        </Flex>
      </Flex.Item>
    </Flex>
  );
};
