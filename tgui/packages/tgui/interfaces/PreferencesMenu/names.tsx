import { binaryInsertWith, sortBy } from 'common/collections';
<<<<<<< HEAD
import { useLocalState } from '../../backend';
=======
import { useState } from 'react';
>>>>>>> tg-pr-88929
import {
  Box,
  Button,
  FitText,
  Icon,
  Input,
  LabeledList,
  Modal,
  Section,
  Stack,
  TrackOutsideClicks,
<<<<<<< HEAD
} from '../../components';
=======
} from 'tgui-core/components';

>>>>>>> tg-pr-88929
import { Name } from './data';
import { ServerPreferencesFetcher } from './ServerPreferencesFetcher';

type NameWithKey = {
  key: string;
  name: Name;
};

const binaryInsertName = (collection: NameWithKey[], value: NameWithKey) =>
  binaryInsertWith(collection, value, ({ key }) => key);

const sortNameWithKeyEntries = (array: [string, NameWithKey[]][]) =>
  sortBy(array, ([key]) => key);

export const MultiNameInput = (props: {
  handleClose: () => void;
  handleRandomizeName: (nameType: string) => void;
  handleUpdateName: (nameType: string, value: string) => void;
  names: Record<string, string>;
}) => {
<<<<<<< HEAD
  const [currentlyEditingName, setCurrentlyEditingName] = useLocalState<
    string | null
  >('currentlyEditingName', null);
=======
  const [currentlyEditingName, setCurrentlyEditingName] = useState<
    string | null
  >(null);
>>>>>>> tg-pr-88929

  return (
    <ServerPreferencesFetcher
      render={(data) => {
        if (!data) {
          return null;
        }

        const namesIntoGroups: Record<string, NameWithKey[]> = {};

        for (const [key, name] of Object.entries(data.names.types)) {
          namesIntoGroups[name.group] = binaryInsertName(
            namesIntoGroups[name.group] || [],
            {
              key,
              name,
            },
          );
        }

        return (
          <Modal
            style={{
              margin: '0 auto',
              width: '40%',
            }}
          >
            <TrackOutsideClicks onOutsideClick={props.handleClose}>
              <Section
                buttons={
                  <Button color="red" onClick={props.handleClose}>
                    Close
                  </Button>
                }
                title="Alternate names"
              >
                <LabeledList>
                  {sortNameWithKeyEntries(Object.entries(namesIntoGroups)).map(
                    ([_, names], index, collection) => (
                      <>
                        {names.map(({ key, name }) => {
                          let content;

                          if (currentlyEditingName === key) {
                            const updateName = (event, value) => {
                              props.handleUpdateName(key, value);

                              setCurrentlyEditingName(null);
                            };

                            content = (
                              <Input
                                autoSelect
                                onEnter={updateName}
                                onChange={updateName}
                                onEscape={() => {
                                  setCurrentlyEditingName(null);
                                }}
                                value={props.names[key]}
                              />
                            );
                          } else {
                            content = (
                              <Button
                                width="100%"
                                onClick={(event) => {
                                  setCurrentlyEditingName(key);
                                  event.cancelBubble = true;
                                  event.stopPropagation();
                                }}
                              >
                                <FitText maxFontSize={12} maxWidth={130}>
                                  {props.names[key]}
                                </FitText>
                              </Button>
                            );
                          }

                          return (
                            <LabeledList.Item
                              key={key}
                              label={name.explanation}
                            >
                              <Stack fill>
                                <Stack.Item grow>{content}</Stack.Item>

                                {!!name.can_randomize && (
                                  <Stack.Item>
                                    <Button
                                      icon="dice"
                                      tooltip="Randomize"
                                      tooltipPosition="right"
                                      onClick={() => {
                                        props.handleRandomizeName(key);
                                      }}
                                    />
                                  </Stack.Item>
                                )}
                              </Stack>
                            </LabeledList.Item>
                          );
                        })}

                        {index !== collection.length - 1 && (
                          <LabeledList.Divider />
                        )}
                      </>
                    ),
                  )}
                </LabeledList>
              </Section>
            </TrackOutsideClicks>
          </Modal>
        );
      }}
    />
  );
};

export const NameInput = (props: {
  handleUpdateName: (name: string) => void;
  name: string;
  openMultiNameInput: () => void;
}) => {
<<<<<<< HEAD
  const [lastNameBeforeEdit, setLastNameBeforeEdit] = useLocalState<
    string | null
  >('lastNameBeforeEdit', null);
=======
  const [lastNameBeforeEdit, setLastNameBeforeEdit] = useState<string | null>(
    null,
  );
>>>>>>> tg-pr-88929
  const editing = lastNameBeforeEdit === props.name;

  const updateName = (e, value) => {
    setLastNameBeforeEdit(null);
    props.handleUpdateName(value);
  };

  return (
    <Button
      captureKeys={!editing}
      onClick={() => {
        setLastNameBeforeEdit(props.name);
      }}
      textAlign="center"
      width="100%"
      height="28px"
    >
      <Stack align="center" fill>
        <Stack.Item>
          <Icon
            style={{
              color: 'rgba(255, 255, 255, 0.5)',
<<<<<<< HEAD
              'font-size': '17px',
=======
              fontSize: '17px',
>>>>>>> tg-pr-88929
            }}
            name="edit"
          />
        </Stack.Item>

        <Stack.Item grow position="relative">
          {(editing && (
            <Input
              autoSelect
              onEnter={updateName}
              onChange={updateName}
              onEscape={() => {
                setLastNameBeforeEdit(null);
              }}
              value={props.name}
            />
          )) || (
            <FitText maxFontSize={16} maxWidth={130}>
              {props.name}
            </FitText>
          )}

          <Box
            style={{
              borderBottom: '2px dotted rgba(255, 255, 255, 0.8)',
              right: '50%',
              transform: 'translateX(50%)',
              position: 'absolute',
              width: '90%',
              bottom: '-1px',
            }}
          />
        </Stack.Item>

        {/* We only know other names when the server tells us */}
        <ServerPreferencesFetcher
          render={(data) =>
            data ? (
              <Stack.Item>
                <Button
                  as="span"
                  tooltip="Alternate Names"
                  tooltipPosition="bottom"
                  style={{
                    background: 'rgba(0, 0, 0, 0.7)',
                    position: 'absolute',
                    right: '2px',
                    top: '50%',
                    transform: 'translateY(-50%)',
                    width: '2%',
                  }}
                  onClick={(event) => {
                    props.openMultiNameInput();

                    // We're a button inside a button.
                    // Did you know that's against the W3C standard? :)
                    event.cancelBubble = true;
                    event.stopPropagation();
                  }}
                >
                  <Icon
                    name="ellipsis-v"
                    style={{
                      position: 'relative',
                      left: '1px',
<<<<<<< HEAD
                      'min-width': '0px',
=======
                      minWidth: '0px',
>>>>>>> tg-pr-88929
                    }}
                  />
                </Button>
              </Stack.Item>
            ) : null
          }
        />
      </Stack>
    </Button>
  );
};
