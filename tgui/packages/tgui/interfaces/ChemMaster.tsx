<<<<<<< HEAD
import { BooleanLike } from 'common/react';
import { capitalize } from 'common/string';
import { useBackend, useLocalState } from '../backend';
=======
import { useState } from 'react';
>>>>>>> tg-pr-88929
import {
  AnimatedNumber,
  Box,
  Button,
<<<<<<< HEAD
  DmIcon,
  Icon,
  Section,
  Table,
  NumberInput,
  Tooltip,
  LabeledList,
  ColorBox,
  ProgressBar,
  Stack,
  Divider,
} from '../components';
import { Window } from '../layouts';

type Data = {
  reagentAnalysisMode: BooleanLike;
  analysisData: Analysis;
  isPrinting: BooleanLike;
  printingProgress: number;
  printingTotal: number;
  transferMode: BooleanLike;
  hasBeaker: BooleanLike;
  beakerCurrentVolume: number;
  beakerMaxVolume: number;
  beakerContents: Reagent[];
  bufferContents: Reagent[];
  bufferCurrentVolume: number;
  bufferMaxVolume: number;
  categories: Category[];
  selectedContainerRef: string;
  selectedContainerVolume: number;
  hasContainerSuggestion: BooleanLike;
  doSuggestContainer: BooleanLike;
  suggestedContainer: string;
};

type Analysis = {
  name: string;
  state: string;
  pH: number;
  color: string;
  description: string;
  purity: number;
  metaRate: number;
  overdose: number;
  addictionTypes: string[];
};

type Category = {
  name: string;
  containers: Container[];
};

type Reagent = {
  ref: string;
  name: string;
  volume: number;
};
=======
  ColorBox,
  Divider,
  DmIcon,
  Icon,
  LabeledList,
  NumberInput,
  ProgressBar,
  Section,
  Stack,
  Table,
  Tooltip,
} from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';
import { capitalize } from 'tgui-core/string';

import { useBackend } from '../backend';
import { Window } from '../layouts';
import { Beaker, BeakerReagent } from './common/BeakerDisplay';
>>>>>>> tg-pr-88929

type Container = {
  icon: string;
  icon_state: string;
  ref: string;
  name: string;
  volume: number;
};

<<<<<<< HEAD
export const ChemMaster = (props) => {
  const { data } = useBackend<Data>();
  const { reagentAnalysisMode } = data;
  return (
    <Window width={400} height={620}>
      <Window.Content scrollable>
        {reagentAnalysisMode ? <AnalysisResults /> : <ChemMasterContent />}
=======
type Category = {
  name: string;
  containers: Container[];
};

type AnalyzableReagent = BeakerReagent & {
  ref: string;
  pH: number;
  color: string;
  description: string;
  purity: number;
  metaRate: number;
  overdose: number;
  addictionTypes: string[];
};

type AnalyzableBeaker = {
  contents: AnalyzableReagent[];
} & Beaker;

type Data = {
  categories: Category[];
  isPrinting: BooleanLike;
  printingProgress: number;
  printingTotal: number;
  maxPrintable: number;
  beaker: AnalyzableBeaker;
  buffer: AnalyzableBeaker;
  isTransfering: BooleanLike;
  suggestedContainerRef: string;
  selectedContainerRef: string;
  selectedContainerVolume: number;
};

export const ChemMaster = (props) => {
  const [analyzedReagent, setAnalyzedReagent] = useState<AnalyzableReagent>();

  return (
    <Window width={450} height={620}>
      <Window.Content scrollable>
        {analyzedReagent ? (
          <AnalysisResults
            analysisData={analyzedReagent}
            onExit={() => setAnalyzedReagent(undefined)}
          />
        ) : (
          <ChemMasterContent
            analyze={(chemical: AnalyzableReagent) =>
              setAnalyzedReagent(chemical)
            }
          />
        )}
>>>>>>> tg-pr-88929
      </Window.Content>
    </Window>
  );
};

<<<<<<< HEAD
const ChemMasterContent = (props) => {
=======
const ChemMasterContent = (props: {
  analyze: (chemical: AnalyzableReagent) => void;
}) => {
>>>>>>> tg-pr-88929
  const { act, data } = useBackend<Data>();
  const {
    isPrinting,
    printingProgress,
    printingTotal,
<<<<<<< HEAD
    transferMode,
    hasBeaker,
    beakerCurrentVolume,
    beakerMaxVolume,
    beakerContents,
    bufferContents,
    bufferCurrentVolume,
    bufferMaxVolume,
    categories,
    selectedContainerVolume,
    hasContainerSuggestion,
    doSuggestContainer,
    suggestedContainer,
  } = data;

  const [itemCount, setItemCount] = useLocalState('itemCount', 1);
=======
    maxPrintable,
    isTransfering,
    beaker,
    buffer,
    categories,
    selectedContainerVolume,
  } = data;

  const [itemCount, setItemCount] = useState<number>(1);
  const [showPreferredContainer, setShowPreferredContainer] =
    useState<BooleanLike>(false);
  const buffer_contents = buffer.contents;
>>>>>>> tg-pr-88929

  return (
    <Box>
      <Section
        title="Beaker"
        buttons={
<<<<<<< HEAD
          !!hasBeaker && (
            <Box>
              <Box inline color="label" mr={2}>
                <AnimatedNumber value={beakerCurrentVolume} initial={0} />
                {` / ${beakerMaxVolume} units`}
              </Box>
              <Button
                icon="eject"
                content="Eject"
                onClick={() => act('eject')}
              />
=======
          beaker && (
            <Box>
              <Box inline color="label" mr={2}>
                <AnimatedNumber value={beaker.currentVolume} initial={0} />
                {` / ${beaker.maxVolume} units`}
              </Box>
              <Button icon="eject" onClick={() => act('eject')}>
                Eject
              </Button>
>>>>>>> tg-pr-88929
            </Box>
          )
        }
      >
<<<<<<< HEAD
        {!hasBeaker && (
          <Box color="label" my={'4px'}>
            No beaker loaded.
          </Box>
        )}
        {!!hasBeaker && beakerCurrentVolume === 0 && (
          <Box color="label" my={'4px'}>
            Beaker is empty.
          </Box>
        )}
        <Table>
          {beakerContents.map((chemical) => (
            <ReagentEntry
              key={chemical.ref}
              chemical={chemical}
              transferTo="buffer"
            />
          ))}
        </Table>
=======
        {!beaker ? (
          <Box color="label" my={'4px'}>
            No beaker loaded.
          </Box>
        ) : beaker.currentVolume === 0 ? (
          <Box color="label" my={'4px'}>
            Beaker is empty.
          </Box>
        ) : (
          <Table>
            {beaker.contents.map((chemical) => (
              <ReagentEntry
                key={chemical.ref}
                chemical={chemical}
                transferTo="buffer"
                analyze={props.analyze}
              />
            ))}
          </Table>
        )}
>>>>>>> tg-pr-88929
      </Section>
      <Section
        title="Buffer"
        buttons={
          <>
            <Box inline color="label" mr={1}>
<<<<<<< HEAD
              <AnimatedNumber value={bufferCurrentVolume} initial={0} />
              {` / ${bufferMaxVolume} units`}
            </Box>
            <Button
              color={transferMode ? 'good' : 'bad'}
              icon={transferMode ? 'exchange-alt' : 'trash'}
              content={transferMode ? 'Moving reagents' : 'Destroying reagents'}
              onClick={() => act('toggleTransferMode')}
            />
          </>
        }
      >
        {bufferContents.length === 0 && (
          <Box color="label" my={'4px'}>
            Buffer is empty.
          </Box>
        )}
        <Table>
          {bufferContents.map((chemical) => (
            <ReagentEntry
              key={chemical.ref}
              chemical={chemical}
              transferTo="beaker"
            />
          ))}
        </Table>
=======
              <AnimatedNumber value={buffer.currentVolume} initial={0} />
              {` / ${buffer.maxVolume} units`}
            </Box>
            <Button
              color={isTransfering ? 'good' : 'bad'}
              icon={isTransfering ? 'exchange-alt' : 'trash'}
              onClick={() => act('toggleTransferMode')}
            >
              {isTransfering ? 'Moving reagents' : 'Destroying reagents'}
            </Button>
          </>
        }
      >
        {buffer_contents.length === 0 ? (
          <Box color="label" my={'4px'}>
            Buffer is empty.
          </Box>
        ) : (
          <Table>
            {buffer_contents.map((chemical) => (
              <ReagentEntry
                key={chemical.ref}
                chemical={chemical}
                transferTo="beaker"
                analyze={props.analyze}
              />
            ))}
          </Table>
        )}
>>>>>>> tg-pr-88929
      </Section>
      {!isPrinting && (
        <Section
          title="Packaging"
          buttons={
<<<<<<< HEAD
            bufferContents.length !== 0 &&
            (!isPrinting ? (
              <Box>
=======
            buffer_contents.length !== 0 && (
              <Box>
                <Button.Checkbox
                  checked={showPreferredContainer}
                  onClick={() =>
                    setShowPreferredContainer((currentValue) => !currentValue)
                  }
                >
                  Suggest
                </Button.Checkbox>
>>>>>>> tg-pr-88929
                <NumberInput
                  unit={'items'}
                  step={1}
                  value={itemCount}
                  minValue={1}
<<<<<<< HEAD
                  maxValue={50}
                  onChange={(e, value) => {
=======
                  maxValue={maxPrintable}
                  onChange={(value) => {
>>>>>>> tg-pr-88929
                    setItemCount(value);
                  }}
                />
                <Box inline mx={1}>
                  {`${
                    Math.round(
                      Math.min(
                        selectedContainerVolume,
<<<<<<< HEAD
                        bufferCurrentVolume / itemCount,
=======
                        buffer.currentVolume / itemCount,
>>>>>>> tg-pr-88929
                      ) * 100,
                    ) / 100
                  } u. each`}
                </Box>
                <Button
<<<<<<< HEAD
                  content="Print"
=======
>>>>>>> tg-pr-88929
                  icon="flask"
                  onClick={() =>
                    act('create', {
                      itemCount: itemCount,
                    })
                  }
<<<<<<< HEAD
                />
              </Box>
            ) : (
              <Button content="Printing..." icon="gear" iconSpin disabled />
            ))
          }
        >
          {!!hasContainerSuggestion && (
            <Button.Checkbox
              onClick={() => act('toggleContainerSuggestion')}
              checked={doSuggestContainer}
              mb={1}
            >
              Guess container by main reagent in the buffer
            </Button.Checkbox>
          )}
          {categories.map((category) => (
            <Box key={category.name}>
              <GroupTitle title={category.name} />
              {category.containers.map(
                (container) =>
                  (!hasContainerSuggestion || // Doesn't have suggestion
                    (!!hasContainerSuggestion && !doSuggestContainer) || // Has sugestion and it's disabled
                    (!!doSuggestContainer &&
                      container.ref === suggestedContainer)) && ( // Suggestion enabled and container matches
                    <ContainerButton
                      key={container.ref}
                      category={category}
                      container={container}
                    />
                  ),
              )}
=======
                >
                  Print
                </Button>
              </Box>
            )
          }
        >
          {categories.map((category) => (
            <Box key={category.name}>
              <GroupTitle title={category.name} />
              {category.containers.map((container) => (
                <ContainerButton
                  key={container.ref}
                  category={category}
                  container={container}
                  showPreferredContainer={showPreferredContainer}
                />
              ))}
>>>>>>> tg-pr-88929
            </Box>
          ))}
        </Section>
      )}
      {!!isPrinting && (
        <Section
          title="Printing"
          buttons={
            <Button
              color="bad"
              icon="times"
<<<<<<< HEAD
              content="Stop"
              onClick={() => act('stopPrinting')}
            />
=======
              onClick={() => act('stopPrinting')}
            >
              Stop
            </Button>
>>>>>>> tg-pr-88929
          }
        >
          <ProgressBar
            value={printingProgress}
            minValue={0}
            maxValue={printingTotal}
            color="good"
          >
            <Box
              lineHeight={1.9}
              style={{
<<<<<<< HEAD
                'text-shadow': '1px 1px 0 black',
=======
                textShadow: '1px 1px 0 black',
>>>>>>> tg-pr-88929
              }}
            >
              {`Printing ${printingProgress} out of ${printingTotal}`}
            </Box>
          </ProgressBar>
        </Section>
      )}
    </Box>
  );
};

<<<<<<< HEAD
const ReagentEntry = (props) => {
  const { data, act } = useBackend<Data>();
  const { chemical, transferTo } = props;
=======
type ReagentProps = {
  chemical: AnalyzableReagent;
  transferTo: string;
  analyze: (chemical: AnalyzableReagent) => void;
};

const ReagentEntry = (props: ReagentProps) => {
  const { data, act } = useBackend<Data>();
  const { chemical, transferTo, analyze } = props;
>>>>>>> tg-pr-88929
  const { isPrinting } = data;
  return (
    <Table.Row key={chemical.ref}>
      <Table.Cell color="label">
        {`${chemical.name} `}
        <AnimatedNumber value={chemical.volume} initial={0} />
        {`u`}
      </Table.Cell>
      <Table.Cell collapsing>
        <Button
<<<<<<< HEAD
          content="1"
=======
>>>>>>> tg-pr-88929
          disabled={isPrinting}
          onClick={() => {
            act('transfer', {
              reagentRef: chemical.ref,
              amount: 1,
              target: transferTo,
            });
          }}
<<<<<<< HEAD
        />
        <Button
          content="5"
=======
        >
          1
        </Button>
        <Button
>>>>>>> tg-pr-88929
          disabled={isPrinting}
          onClick={() =>
            act('transfer', {
              reagentRef: chemical.ref,
              amount: 5,
              target: transferTo,
            })
          }
<<<<<<< HEAD
        />
        <Button
          content="10"
=======
        >
          5
        </Button>
        <Button
>>>>>>> tg-pr-88929
          disabled={isPrinting}
          onClick={() =>
            act('transfer', {
              reagentRef: chemical.ref,
              amount: 10,
              target: transferTo,
            })
          }
<<<<<<< HEAD
        />
        <Button
          content="All"
=======
        >
          10
        </Button>
        <Button
>>>>>>> tg-pr-88929
          disabled={isPrinting}
          onClick={() =>
            act('transfer', {
              reagentRef: chemical.ref,
              amount: 1000,
              target: transferTo,
            })
          }
<<<<<<< HEAD
        />
        <Button
          icon="ellipsis-h"
          title="Custom amount"
=======
        >
          All
        </Button>
        <Button
          icon="ellipsis-h"
          tooltip="Custom amount"
>>>>>>> tg-pr-88929
          disabled={isPrinting}
          onClick={() =>
            act('transfer', {
              reagentRef: chemical.ref,
              amount: -1,
              target: transferTo,
            })
          }
        />
        <Button
          icon="question"
<<<<<<< HEAD
          title="Analyze"
          onClick={() =>
            act('analyze', {
              reagentRef: chemical.ref,
            })
          }
=======
          tooltip="Analyze"
          onClick={() => analyze(chemical)}
>>>>>>> tg-pr-88929
        />
      </Table.Cell>
    </Table.Row>
  );
};

<<<<<<< HEAD
const ContainerButton = ({ container, category }) => {
  const { act, data } = useBackend<Data>();
  const { isPrinting, selectedContainerRef } = data;
  const isPillPatch = ['pills', 'patches'].includes(category.name);
  const fallback = <Icon m="18px" name="spinner" spin />;
  const fallbackPillPatch = <Icon m="10px" name="spinner" spin />;
=======
type CategoryButtonProps = {
  category: Category;
  container: Container;
  showPreferredContainer: BooleanLike;
};

const ContainerButton = (props: CategoryButtonProps) => {
  const { act, data } = useBackend<Data>();
  const { isPrinting, selectedContainerRef, suggestedContainerRef } = data;
  const { category, container, showPreferredContainer } = props;
  const isPillPatch = ['pills', 'patches'].includes(category.name);
  const fallback = <Icon m="18px" name="spinner" spin />;
  const fallbackPillPatch = <Icon m="10px" name="spinner" spin />;

>>>>>>> tg-pr-88929
  return (
    <Tooltip
      key={container.ref}
      content={`${capitalize(container.name)}\xa0(${container.volume}u)`}
    >
      <Button
        overflow="hidden"
<<<<<<< HEAD
        color="transparent"
=======
        color={'transparent'}
        backgroundColor={
          showPreferredContainer &&
          selectedContainerRef !== suggestedContainerRef && // if we selected the same container as the suggested then don't override color
          container.ref === suggestedContainerRef
            ? 'blue'
            : 'transparent'
        }
>>>>>>> tg-pr-88929
        width={isPillPatch ? '32px' : '48px'}
        height={isPillPatch ? '32px' : '48px'}
        selected={container.ref === selectedContainerRef}
        disabled={isPrinting}
        p={0}
        onClick={() => {
          act('selectContainer', {
            ref: container.ref,
          });
        }}
      >
        <DmIcon
          m={isPillPatch ? '-16px' : '-8px'}
          fallback={isPillPatch ? fallbackPillPatch : fallback}
          icon={container.icon}
          icon_state={container.icon_state}
          height="64px"
          width="64px"
        />
      </Button>
    </Tooltip>
  ) as any;
};

<<<<<<< HEAD
const AnalysisResults = (props) => {
  const { act, data } = useBackend<Data>();
  const {
    name,
    state,
=======
const AnalysisResults = (props: {
  analysisData: AnalyzableReagent;
  onExit: () => void;
}) => {
  const {
    name,
>>>>>>> tg-pr-88929
    pH,
    color,
    description,
    purity,
    metaRate,
    overdose,
    addictionTypes,
<<<<<<< HEAD
  } = data.analysisData;
  const purityLevel =
    purity <= 0.5 ? 'bad' : purity <= 0.75 ? 'average' : 'good'; // Color names
=======
  } = props.analysisData;

  const purityLevel =
    purity <= 0.5 ? 'bad' : purity <= 0.75 ? 'average' : 'good'; // Color names

>>>>>>> tg-pr-88929
  return (
    <Section
      title="Analysis Results"
      buttons={
<<<<<<< HEAD
        <Button
          icon="arrow-left"
          content="Back"
          onClick={() => act('stopAnalysis')}
        />
=======
        <Button icon="arrow-left" onClick={() => props.onExit()}>
          Back
        </Button>
>>>>>>> tg-pr-88929
      }
    >
      <LabeledList>
        <LabeledList.Item label="Name">{name}</LabeledList.Item>
        <LabeledList.Item label="Purity">
          <Box
            style={{
<<<<<<< HEAD
              'text-transform': 'capitalize',
=======
              textTransform: 'capitalize',
>>>>>>> tg-pr-88929
            }}
            color={purityLevel}
          >
            {purityLevel}
          </Box>
        </LabeledList.Item>
        <LabeledList.Item label="pH">{pH}</LabeledList.Item>
<<<<<<< HEAD
        <LabeledList.Item label="State">{state}</LabeledList.Item>
=======
>>>>>>> tg-pr-88929
        <LabeledList.Item label="Color">
          <ColorBox color={color} mr={1} />
          {color}
        </LabeledList.Item>
        <LabeledList.Item label="Description">{description}</LabeledList.Item>
        <LabeledList.Item label="Metabolization Rate">
          {metaRate} units/second
        </LabeledList.Item>
        <LabeledList.Item label="Overdose Threshold">
          {overdose > 0 ? `${overdose} units` : 'N/A'}
        </LabeledList.Item>
        <LabeledList.Item label="Addiction Types">
          {addictionTypes.length ? addictionTypes.toString() : 'N/A'}
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
};

const GroupTitle = ({ title }) => {
  return (
    <Stack my={1}>
      <Stack.Item grow>
        <Divider />
      </Stack.Item>
      <Stack.Item
        style={{
<<<<<<< HEAD
          'text-transform': 'capitalize',
=======
          textTransform: 'capitalize',
>>>>>>> tg-pr-88929
        }}
        color={'gray'}
      >
        {title}
      </Stack.Item>
      <Stack.Item grow>
        <Divider />
      </Stack.Item>
    </Stack>
  ) as any;
};
