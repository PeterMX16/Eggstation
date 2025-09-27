<<<<<<< HEAD
import { classes } from 'common/react';
import { sendAct, useBackend, useLocalState } from '../../backend';
import {
  Box,
  Button,
  Flex,
  LabeledList,
  Popper,
  Stack,
  TrackOutsideClicks,
  FitText,
  Input,
  Icon,
} from '../../components';
import {
  createSetPreference,
  PreferencesMenuData,
  RandomSetting,
} from './data';
import { DeleteCharacterPopup } from './DeleteCharacterPopup';
=======
import { filter, map, sortBy } from 'common/collections';
import { ReactNode, useState } from 'react';
import {
  Autofocus,
  Box,
  Button,
  Flex,
  Input,
  LabeledList,
  Popper,
  Stack,
} from 'tgui-core/components';
import { classes } from 'tgui-core/react';
import { createSearch } from 'tgui-core/string';

import { sendAct, useBackend } from '../../backend';
>>>>>>> tg-pr-88929
import { CharacterPreview } from '../common/CharacterPreview';
import {
  createSetPreference,
  PreferencesMenuData,
  RandomSetting,
  ServerData,
} from './data';
import { DeleteCharacterPopup } from './DeleteCharacterPopup';
import { MultiNameInput, NameInput } from './names';
import features from './preferences/features';
import {
  FeatureChoicedServerData,
  FeatureValueInput,
} from './preferences/features/base';
import { Gender, GENDERS } from './preferences/gender';
import { RandomizationButton } from './RandomizationButton';
import { ServerPreferencesFetcher } from './ServerPreferencesFetcher';
<<<<<<< HEAD
import { MultiNameInput, NameInput } from './names';
import { Gender, GENDERS } from './preferences/gender';
import features from './preferences/features';
import {
  FeatureChoicedServerData,
  FeatureValueInput,
} from './preferences/features/base';
import { filterMap, sortBy } from 'common/collections';
=======
>>>>>>> tg-pr-88929
import { useRandomToggleState } from './useRandomToggleState';
import { createSearch } from 'common/string';
import { InfernoNode } from 'inferno';

const CLOTHING_CELL_SIZE = 64;
const CLOTHING_SIDEBAR_ROWS = 10;

const CLOTHING_SELECTION_CELL_SIZE = 64;
const CLOTHING_SELECTION_WIDTH = 6.3;
const CLOTHING_SELECTION_MULTIPLIER = 5.2;

const CharacterControls = (props: {
  handleRotate: () => void;
  handleOpenSpecies: () => void;
  gender: Gender;
  setGender: (gender: Gender) => void;
  showGender: boolean;
  canDeleteCharacter: boolean;
  handleDeleteCharacter: () => void;
}) => {
  return (
    <Stack>
      <Stack.Item>
        <Button
          onClick={props.handleRotate}
          fontSize="22px"
          icon="undo"
          tooltip="Rotate"
          tooltipPosition="top"
        />
      </Stack.Item>

      <Stack.Item>
        <Button
          onClick={props.handleOpenSpecies}
          fontSize="22px"
          icon="paw"
          tooltip="Species"
          tooltipPosition="top"
        />
      </Stack.Item>

      {props.showGender && (
        <Stack.Item>
          <GenderButton
            gender={props.gender}
            handleSetGender={props.setGender}
          />
        </Stack.Item>
      )}

      <Stack.Item>
        <Button
          onClick={props.handleDeleteCharacter}
          fontSize="22px"
          icon="trash"
          color="red"
          tooltip="Delete character"
          tooltipPosition="top"
          disabled={!props.canDeleteCharacter}
        />
      </Stack.Item>
    </Stack>
  );
};

const ChoicedSelection = (props: {
  name: string;
  catalog: FeatureChoicedServerData;
  selected: string;
<<<<<<< HEAD
  supplementalFeatures?: string[]; // Now an array of features
  supplementalValues?: unknown[]; // Now an array of values
  onClose: () => void;
  onSelect: (value: string) => void;
  searchText: string;
  setSearchText: (value: string) => void;
}) => {
  const { act } = useBackend<PreferencesMenuData>();

  const {
    catalog,
    supplementalFeatures = [],
    supplementalValues = [],
    searchText,
    setSearchText,
  } = props;
=======
  supplementalFeature?: string;
  supplementalValue?: unknown;
  onClose: () => void;
  onSelect: (value: string) => void;
}) => {
  const { act } = useBackend<PreferencesMenuData>();

  const { catalog, supplementalFeature, supplementalValue } = props;
  const [getSearchText, searchTextSet] = useState('');
>>>>>>> tg-pr-88929

  if (!catalog.icons) {
    return <Box color="red">Provided catalog had no icons!</Box>;
  }

  let search = createSearch(searchText, (name: string) => {
    return name;
  });

  return (
    <Box
<<<<<<< HEAD
      className="theme-generic"
      style={{
=======
      className="ChoicedSelection"
      style={{
        padding: '5px',

>>>>>>> tg-pr-88929
        height: `${
          CLOTHING_SELECTION_CELL_SIZE * CLOTHING_SELECTION_MULTIPLIER
        }px`,
        width: `${CLOTHING_SELECTION_CELL_SIZE * CLOTHING_SELECTION_WIDTH}px`,
      }}
    >
<<<<<<< HEAD
      <Box
        className="PopupWindow"
        style={{ padding: '5px' }}
        width="100%"
        height="100%"
      >
        <Stack vertical fill>
          <Stack.Item>
            <Stack fill>
              {/* Handle small supplemental features */}
              {supplementalFeatures.map((feature, index) => {
                const use_small_supplemental =
                  features[feature]?.small_supplemental ?? true;
                return (
                  use_small_supplemental && (
                    <Stack.Item key={index}>
                      <FeatureValueInput
                        act={act}
                        feature={features[feature]}
                        featureId={feature}
                        shrink
                        value={supplementalValues[index]}
                      />
                    </Stack.Item>
                  )
                );
              })}
              <Stack.Item grow>
                <Box
                  style={{
                    'border-bottom': '1px solid #888',
                    'font-weight': 'bold',
                    'font-size': '14px',
                    'text-align': 'center',
                  }}
                >
                  Select {props.name}
                </Box>
              </Stack.Item>

              <Stack.Item>
                <Button color="red" onClick={props.onClose}>
                  X
                </Button>
              </Stack.Item>
            </Stack>
          </Stack.Item>

          {Object.keys(catalog.icons).length > 5 && (
            <Stack.Item>
              <Box>
                <Icon mr={1} name="search" />
                <Input
                  autoFocus
                  width={`${
                    CLOTHING_SELECTION_CELL_SIZE * CLOTHING_SELECTION_WIDTH - 55
                  }px`}
                  placeholder="Search options"
                  value={searchText}
                  onInput={(_, value) => setSearchText(value)}
                />
              </Box>
            </Stack.Item>
          )}

          <Stack.Item
            overflowX="hidden"
            overflowY="auto"
            grow
            className="section-background"
          >
            <Flex wrap>
              {Object.entries(catalog.icons)
                .filter(([n, _]) => searchText?.length < 1 || search(n))
                .map(([name, image], index) => {
=======
      <Stack vertical fill>
        <Stack.Item>
          <Stack fill>
            {supplementalFeature && (
              <Stack.Item>
                <FeatureValueInput
                  act={act}
                  feature={features[supplementalFeature]}
                  featureId={supplementalFeature}
                  shrink
                  value={supplementalValue}
                />
              </Stack.Item>
            )}

            <Stack.Item grow>
              <Box
                style={{
                  borderBottom: '1px solid #888',
                  fontWeight: 'bold',
                  fontSize: '14px',
                  textAlign: 'center',
                }}
              >
                Select {props.name.toLowerCase()}
              </Box>
            </Stack.Item>

            <Stack.Item>
              <Button color="red" onClick={props.onClose}>
                X
              </Button>
            </Stack.Item>
          </Stack>
        </Stack.Item>

        <Stack.Item overflowX="hidden" overflowY="scroll">
          <Autofocus>
            <Input
              placeholder="Search..."
              style={{
                margin: '0px 5px',
                width: '95%',
              }}
              onInput={(_, value) => searchTextSet(value)}
            />
            <Flex wrap>
              {searchInCatalog(getSearchText, catalog.icons).map(
                ([name, image], index) => {
>>>>>>> tg-pr-88929
                  return (
                    <Flex.Item
                      key={index}
                      basis={`${CLOTHING_SELECTION_CELL_SIZE}px`}
                      style={{
                        padding: '5px',
                      }}
                    >
                      <Button
                        onClick={() => {
                          props.onSelect(name);
                        }}
                        selected={name === props.selected}
<<<<<<< HEAD
=======
                        tooltip={name}
                        tooltipPosition="right"
>>>>>>> tg-pr-88929
                        style={{
                          height: `${CLOTHING_SELECTION_CELL_SIZE}px`,
                          width: `${CLOTHING_SELECTION_CELL_SIZE}px`,
                        }}
                      >
                        <Box
                          className={classes([
                            'preferences32x32',
                            image,
                            'centered-image',
                          ])}
<<<<<<< HEAD
                          style={{
                            transform:
                              'translateX(-50%) translateY(-50%) scale(1.4)',
                          }}
                        />
                      </Button>
                      <Box textAlign="center">
                        <FitText
                          maxWidth={CLOTHING_SELECTION_CELL_SIZE}
                          maxFontSize={12}
                        >
                          {name}
                        </FitText>
                      </Box>
                    </Flex.Item>
                  );
                })}
=======
                        />
                      </Button>
                    </Flex.Item>
                  );
                },
              )}
>>>>>>> tg-pr-88929
            </Flex>
          </Stack.Item>
          {/* Handle larger supplemental features */}
          {supplementalFeatures.map((feature, index) => {
            const use_small_supplemental =
              features[feature]?.small_supplemental ?? true;
            return (
              !use_small_supplemental && (
                <Box key={index}>
                  <Stack.Item mt={0.25}>
                    <Box
                      pb={0.25}
                      style={{
                        'border-bottom': '1px solid rgba(255, 255, 255, 0.1)',
                        'font-weight': 'bold',
                        'font-size': '14px',
                        'text-align': 'center',
                      }}
                    >
                      Select {features[feature].name}
                    </Box>
                  </Stack.Item>
                  <Stack.Item shrink mt={0.5}>
                    <FeatureValueInput
                      act={act}
                      feature={features[feature]}
                      featureId={feature}
                      shrink
                      value={supplementalValues[index]}
                    />
                  </Stack.Item>
                </Box>
              )
            );
          })}
        </Stack>
      </Box>
    </Box>
  );
};

<<<<<<< HEAD
=======
const searchInCatalog = (searchText = '', catalog: Record<string, string>) => {
  let items = Object.entries(catalog);
  if (searchText) {
    items = filter(
      items,
      createSearch(searchText, ([name, _icon]) => name),
    );
  }
  return items;
};

>>>>>>> tg-pr-88929
const GenderButton = (props: {
  handleSetGender: (gender: Gender) => void;
  gender: Gender;
}) => {
<<<<<<< HEAD
  const [genderMenuOpen, setGenderMenuOpen] = useLocalState(
    'genderMenuOpen',
    false,
  );
=======
  const [genderMenuOpen, setGenderMenuOpen] = useState(false);
>>>>>>> tg-pr-88929

  return (
    <Popper
      isOpen={genderMenuOpen}
      onClickOutside={() => setGenderMenuOpen(false)}
      placement="right-end"
      content={
        <Stack backgroundColor="white" ml={0.5} p={0.3}>
          {[Gender.Male, Gender.Female, Gender.Other, Gender.Other2].map(
            (gender) => {
              return (
                <Stack.Item key={gender}>
                  <Button
                    selected={gender === props.gender}
                    onClick={() => {
                      props.handleSetGender(gender);
                      setGenderMenuOpen(false);
                    }}
                    fontSize="22px"
                    icon={GENDERS[gender].icon}
                    tooltip={GENDERS[gender].text}
                    tooltipPosition="top"
                  />
                </Stack.Item>
              );
<<<<<<< HEAD
            })}
          </Stack>
        )
=======
            },
          )}
        </Stack>
>>>>>>> tg-pr-88929
      }
    >
      <Button
        onClick={() => {
          setGenderMenuOpen(!genderMenuOpen);
        }}
        fontSize="22px"
        icon={GENDERS[props.gender].icon}
        tooltip="Gender"
        tooltipPosition="top"
      />
    </Popper>
  );
};

const MainFeature = (props: {
  catalog: FeatureChoicedServerData & {
    name: string;
<<<<<<< HEAD
    supplemental_feature?: string | string[]; // Allow string or array of strings
=======
    supplemental_feature?: string;
>>>>>>> tg-pr-88929
  };
  currentValue: string;
  isOpen: boolean;
  handleClose: () => void;
  handleOpen: () => void;
  handleSelect: (newClothing: string) => void;
  randomization?: RandomSetting;
  setRandomization: (newSetting: RandomSetting) => void;
}) => {
  const { act, data } = useBackend<PreferencesMenuData>();

  const {
    catalog,
    currentValue,
    isOpen,
    handleOpen,
    handleClose,
    handleSelect,
    randomization,
    setRandomization,
  } = props;

  // Normalize supplementalFeature to always be an array
  const supplementalFeatures = Array.isArray(catalog.supplemental_feature)
    ? catalog.supplemental_feature
    : catalog.supplemental_feature
      ? [catalog.supplemental_feature]
      : [];

  const supplementalValues = supplementalFeatures.map((feature) =>
    feature
      ? data.character_preferences.supplemental_features[feature]
      : undefined,
  );

  let [searchText, setSearchText] = useLocalState(
    catalog.name + '_choiced_search',
    '',
  );

  const handleCloseInternal = () => {
    handleClose();
    setSearchText('');
  };

  return (
    <Popper
<<<<<<< HEAD
      options={{
        placement: 'bottom-start',
      }}
      popperContent={
        isOpen && (
          <TrackOutsideClicks onOutsideClick={handleCloseInternal}>
            <ChoicedSelection
              name={catalog.name}
              catalog={catalog}
              selected={currentValue}
              supplementalFeatures={supplementalFeatures} // Pass array of features
              supplementalValues={supplementalValues} // Pass array of values
              onClose={handleCloseInternal}
              onSelect={handleSelect}
              searchText={searchText}
              setSearchText={setSearchText}
            />
          </TrackOutsideClicks>
        )
=======
      placement="bottom-start"
      isOpen={isOpen}
      onClickOutside={handleClose}
      baseZIndex={1} // Below the default popper at z 2
      content={
        <ChoicedSelection
          name={catalog.name}
          catalog={catalog}
          selected={currentValue}
          supplementalFeature={supplementalFeature}
          supplementalValue={
            supplementalFeature &&
            data.character_preferences.supplemental_features[
              supplementalFeature
            ]
          }
          onClose={handleClose}
          onSelect={handleSelect}
        />
>>>>>>> tg-pr-88929
      }
    >
      <Button
        onClick={(event) => {
          event.stopPropagation();
          if (isOpen) {
            handleCloseInternal();
          } else {
            handleOpen();
          }
        }}
        style={{
          height: `${CLOTHING_CELL_SIZE}px`,
          width: `${CLOTHING_CELL_SIZE}px`,
        }}
        position="relative"
        tooltip={catalog.name}
        tooltipPosition="right"
      >
        <Box
          className={classes([
            'preferences32x32',
            catalog.icons![currentValue],
            'centered-image',
          ])}
          style={{
            transform: randomization
              ? 'translateX(-70%) translateY(-70%) scale(1.1)'
              : 'translateX(-50%) translateY(-50%) scale(1.3)',
          }}
        />

        {randomization && (
          <RandomizationButton
            dropdownProps={{
              dropdownStyle: {
                bottom: 0,
                position: 'absolute',
                right: '1px',
              },
              onOpen: (event) => {
                // We're a button inside a button.
                // Did you know that's against the W3C standard? :)
                event.cancelBubble = true;
                event.stopPropagation();
              },
            }}
            value={randomization}
            setValue={setRandomization}
          />
        )}
      </Button>
    </Popper>
  );
};

const createSetRandomization =
  (act: typeof sendAct, preference: string) => (newSetting: RandomSetting) => {
    act('set_random_preference', {
      preference,
      value: newSetting,
    });
  };

const sortPreferences = (array: [string, unknown][]) =>
  sortBy(array, ([featureId, _]) => {
    const feature = features[featureId];
    return feature?.name;
  });

export const PreferenceList = (props: {
  act: typeof sendAct;
  preferences: Record<string, unknown>;
  randomizations: Record<string, RandomSetting>;
<<<<<<< HEAD
  children?: InfernoNode;
=======
  maxHeight: string;
  children?: ReactNode;
>>>>>>> tg-pr-88929
}) => {
  return (
    <Stack.Item
      basis="50%"
      grow
      style={{
        background: 'rgba(0, 0, 0, 0.5)',
        padding: '4px',
      }}
      overflowX="hidden"
<<<<<<< HEAD
      overflowY="scroll"
=======
      overflowY="auto"
      maxHeight={props.maxHeight}
>>>>>>> tg-pr-88929
    >
      <LabeledList>
        {sortPreferences(Object.entries(props.preferences)).map(
          ([featureId, value]) => {
            const feature = features[featureId];
            const randomSetting = props.randomizations[featureId];

            if (feature === undefined) {
              return (
                <Stack.Item key={featureId}>
                  <b>Feature {featureId} is not recognized.</b>
                </Stack.Item>
              );
            }

            return (
              <LabeledList.Item
                key={featureId}
                label={feature.name}
                tooltip={feature.description}
                verticalAlign="middle"
              >
                <Stack fill>
                  {randomSetting && (
                    <Stack.Item>
                      <RandomizationButton
                        setValue={createSetRandomization(props.act, featureId)}
                        value={randomSetting}
                      />
                    </Stack.Item>
                  )}

                  <Stack.Item grow>
                    <FeatureValueInput
                      act={props.act}
                      feature={feature}
                      featureId={featureId}
                      value={value}
                    />
                  </Stack.Item>
                </Stack>
              </LabeledList.Item>
            );
          },
        )}
      </LabeledList>
<<<<<<< HEAD
=======

>>>>>>> tg-pr-88929
      {props.children}
    </Stack.Item>
  );
};

<<<<<<< HEAD
export const MainPage = (props: { openSpecies: () => void }) => {
  const { act, data } = useBackend<PreferencesMenuData>();
  const [currentClothingMenu, setCurrentClothingMenu] = useLocalState<
    string | null
  >('currentClothingMenu', null);
  const [deleteCharacterPopupOpen, setDeleteCharacterPopupOpen] = useLocalState(
    'deleteCharacterPopupOpen',
    false,
  );
  const [multiNameInputOpen, setMultiNameInputOpen] = useLocalState(
    'multiNameInputOpen',
    false,
  );
=======
export const getRandomization = (
  preferences: Record<string, unknown>,
  serverData: ServerData | undefined,
  randomBodyEnabled: boolean,
): Record<string, RandomSetting> => {
  if (!serverData) {
    return {};
  }

  const { data } = useBackend<PreferencesMenuData>();

  if (!randomBodyEnabled) {
    return {};
  }

  return Object.fromEntries(
    map(
      filter(Object.keys(preferences), (key) =>
        serverData.random.randomizable.includes(key),
      ),
      (key) => [
        key,
        data.character_preferences.randomization[key] || RandomSetting.Disabled,
      ],
    ),
  );
};

export const MainPage = (props: { openSpecies: () => void }) => {
  const { act, data } = useBackend<PreferencesMenuData>();
  const [currentClothingMenu, setCurrentClothingMenu] = useState<string | null>(
    null,
  );
  const [deleteCharacterPopupOpen, setDeleteCharacterPopupOpen] =
    useState(false);
  const [multiNameInputOpen, setMultiNameInputOpen] = useState(false);
>>>>>>> tg-pr-88929
  const [randomToggleEnabled] = useRandomToggleState();

  return (
    <ServerPreferencesFetcher
      render={(serverData) => {
        const currentSpeciesData =
          serverData &&
          serverData.species[data.character_preferences.misc.species];

        const contextualPreferences =
          data.character_preferences.secondary_features || [];

        const mainFeatures = [
          ...Object.entries(data.character_preferences.clothing),
          ...Object.entries(data.character_preferences.features).filter(
            ([featureName]) => {
              if (!currentSpeciesData) {
                return false;
              }

              return (
                currentSpeciesData.enabled_features.indexOf(featureName) !== -1
              );
            },
          ),
        ];

        const randomBodyEnabled =
          data.character_preferences.non_contextual.random_body !==
            RandomSetting.Disabled || randomToggleEnabled;

<<<<<<< HEAD
        const getRandomization = (
          preferences: Record<string, unknown>,
        ): Record<string, RandomSetting> => {
          if (!serverData) {
            return {};
          }

          return Object.fromEntries(
            filterMap(Object.keys(preferences), (preferenceKey) => {
              if (
                serverData.random.randomizable.indexOf(preferenceKey) === -1
              ) {
                return undefined;
              }

              if (!randomBodyEnabled) {
                return undefined;
              }

              return [
                preferenceKey,
                data.character_preferences.randomization[preferenceKey] ||
                  RandomSetting.Disabled,
              ];
            }),
          );
        };

        const randomizationOfMainFeatures = getRandomization(
          Object.fromEntries(mainFeatures),
=======
        const randomizationOfMainFeatures = getRandomization(
          Object.fromEntries(mainFeatures),
          serverData,
          randomBodyEnabled,
>>>>>>> tg-pr-88929
        );

        const nonContextualPreferences = {
          ...data.character_preferences.non_contextual,
        };

        if (randomBodyEnabled) {
          nonContextualPreferences['random_species'] =
            data.character_preferences.randomization['species'];
        } else {
          // We can't use random_name/is_accessible because the
          // server doesn't know whether the random toggle is on.
          delete nonContextualPreferences['random_name'];
        }

        return (
          <>
            {multiNameInputOpen && (
              <MultiNameInput
                handleClose={() => setMultiNameInputOpen(false)}
                handleRandomizeName={(preference) =>
                  act('randomize_name', {
                    preference,
                  })
                }
                handleUpdateName={(nameType, value) =>
                  act('set_preference', {
                    preference: nameType,
                    value,
                  })
                }
                names={data.character_preferences.names}
              />
            )}

            {deleteCharacterPopupOpen && (
              <DeleteCharacterPopup
                close={() => setDeleteCharacterPopupOpen(false)}
              />
            )}

            <Stack height={`${CLOTHING_SIDEBAR_ROWS * CLOTHING_CELL_SIZE}px`}>
              <Stack.Item>
                <Stack vertical fill>
                  <Stack.Item>
                    <CharacterControls
                      gender={data.character_preferences.misc.gender}
                      handleOpenSpecies={props.openSpecies}
                      handleRotate={() => {
                        act('rotate');
                      }}
                      setGender={createSetPreference(act, 'gender')}
                      showGender={
                        currentSpeciesData ? !!currentSpeciesData.sexes : true
                      }
                      canDeleteCharacter={
                        Object.values(data.character_profiles).filter(
                          (name) => name,
                        ).length > 1
                      }
                      handleDeleteCharacter={() =>
                        setDeleteCharacterPopupOpen(true)
                      }
                    />
                  </Stack.Item>

                  <Stack.Item grow>
                    <CharacterPreview
                      height="100%"
                      id={data.character_preview_view}
                    />
                  </Stack.Item>

                  <Stack.Item position="relative">
                    <NameInput
                      name={data.character_preferences.names[data.name_to_use]}
                      handleUpdateName={createSetPreference(
                        act,
                        data.name_to_use,
                      )}
                      openMultiNameInput={() => {
                        setMultiNameInputOpen(true);
                      }}
                    />
                  </Stack.Item>
                </Stack>
              </Stack.Item>

              <Stack.Item width={`${CLOTHING_CELL_SIZE * 2 + 15}px`}>
                <Stack height="100%" vertical wrap>
                  {mainFeatures.map(([clothingKey, clothing]) => {
                    const catalog =
                      serverData &&
                      (serverData[clothingKey] as FeatureChoicedServerData & {
                        name: string;
                      });

                    return (
                      catalog && (
                        <Stack.Item key={clothingKey} mt={0.5} px={0.5}>
                          <MainFeature
                            catalog={catalog}
                            currentValue={clothing}
                            isOpen={currentClothingMenu === clothingKey}
                            handleClose={() => {
                              setCurrentClothingMenu(null);
                            }}
                            handleOpen={() => {
                              setCurrentClothingMenu(clothingKey);
                            }}
                            handleSelect={createSetPreference(act, clothingKey)}
                            randomization={
                              randomizationOfMainFeatures[clothingKey]
                            }
                            setRandomization={createSetRandomization(
                              act,
                              clothingKey,
                            )}
                          />
                        </Stack.Item>
                      )
                    );
                  })}
                </Stack>
              </Stack.Item>

              <Stack.Item grow basis={0}>
                <Stack vertical fill>
                  <PreferenceList
                    act={act}
                    randomizations={getRandomization(
                      contextualPreferences,
                      serverData,
                      randomBodyEnabled,
                    )}
                    preferences={contextualPreferences}
                    maxHeight="auto"
                  />

                  <PreferenceList
                    act={act}
                    randomizations={getRandomization(
                      nonContextualPreferences,
                      serverData,
                      randomBodyEnabled,
                    )}
                    preferences={nonContextualPreferences}
                    maxHeight="auto"
                  >
                    <Box my={0.5}>
                      <Button
                        color="red"
                        disabled={
                          Object.values(data.character_profiles).filter(
                            (name) => name,
                          ).length < 2
                        } // check if existing chars more than one
                        onClick={() => setDeleteCharacterPopupOpen(true)}
                      >
                        Delete Character
                      </Button>
                    </Box>
                  </PreferenceList>
                </Stack>
              </Stack.Item>
            </Stack>
          </>
        );
      }}
    />
  );
};
