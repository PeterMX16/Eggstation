import { Section } from 'tgui-core/components';

import { useBackend } from '../backend';
<<<<<<< HEAD
import { GasmixParser } from './common/GasmixParser';
import type { Gasmix } from './common/GasmixParser';
import {
  AtmosHandbookContent,
  atmosHandbookHooks,
} from './common/AtmosHandbook';
=======
>>>>>>> tg-pr-88929
import { Window } from '../layouts';
import {
  AtmosHandbookContent,
  atmosHandbookHooks,
} from './common/AtmosHandbook';
import type { Gasmix } from './common/GasmixParser';
import { GasmixParser } from './common/GasmixParser';

export type GasAnalyzerData = {
  gasmixes: Gasmix[];
};

export const GasAnalyzerContent = (props) => {
  const { act, data } = useBackend<GasAnalyzerData>();
  const { gasmixes } = data;
  const [setActiveGasId, setActiveReactionId] = atmosHandbookHooks();
  return (
    <>
      {gasmixes.map((gasmix) => (
        <Section title={gasmix.name} key={gasmix.reference}>
          <GasmixParser
            gasmix={gasmix}
            gasesOnClick={setActiveGasId}
            reactionOnClick={setActiveReactionId}
          />
        </Section>
      ))}
      <AtmosHandbookContent vertical />
    </>
  );
};

export const GasAnalyzer = (props) => {
  return (
    <Window width={500} height={450}>
      <Window.Content scrollable>
        <GasAnalyzerContent />
      </Window.Content>
    </Window>
  );
};
