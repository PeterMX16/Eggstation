import { useState } from 'react';
import { Window } from 'tgui/layouts';
import { Stack, Tabs } from 'tgui-core/components';

import { AvailableDisplay } from './Available';
import { PAI_TAB } from './constants';
import { DirectiveDisplay } from './Directives';
import { InstalledDisplay } from './Installed';
import { SystemDisplay } from './System';

<<<<<<< HEAD
export const PaiInterface = (props) => {
  const [tab] = useLocalState('tab', PAI_TAB.System);
=======
export function PaiInterface(props) {
  const [tab, setTab] = useState(PAI_TAB.System);
>>>>>>> tg-pr-88929

  return (
    <Window title="pAI Software Interface v2.5" width={380} height={480}>
      <Window.Content>
        <Stack fill vertical>
          <Stack.Item grow>
            {tab === PAI_TAB.System && <SystemDisplay />}
            {tab === PAI_TAB.Directive && <DirectiveDisplay />}
            {tab === PAI_TAB.Installed && <InstalledDisplay />}
            {tab === PAI_TAB.Available && <AvailableDisplay />}
          </Stack.Item>
          <Stack.Item>
            <Tabs fluid>
              <Tabs.Tab
                icon="list"
                onClick={() => setTab(PAI_TAB.System)}
                selected={tab === PAI_TAB.System}
              >
                System
              </Tabs.Tab>
              <Tabs.Tab
                icon="list"
                onClick={() => setTab(PAI_TAB.Directive)}
                selected={tab === PAI_TAB.Directive}
              >
                Directives
              </Tabs.Tab>
              <Tabs.Tab
                icon="list"
                onClick={() => setTab(PAI_TAB.Installed)}
                selected={tab === PAI_TAB.Installed}
              >
                Installed
              </Tabs.Tab>
              <Tabs.Tab
                icon="list"
                onClick={() => setTab(PAI_TAB.Available)}
                selected={tab === PAI_TAB.Available}
              >
                Download
              </Tabs.Tab>
            </Tabs>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
<<<<<<< HEAD
};

/**
 * Tabs at bottom of screen. YES THIS IS INTENTIONAL. It's a phone screen
 * and the buttons are on the bottom. Android!
 */
const TabDisplay = (props) => {
  const [tab, setTab] = useLocalState('tab', PAI_TAB.System);

  return (
    <Tabs fluid>
      <Tabs.Tab
        icon="list"
        onClick={() => setTab(PAI_TAB.System)}
        selected={tab === PAI_TAB.System}
      >
        System
      </Tabs.Tab>
      <Tabs.Tab
        icon="list"
        onClick={() => setTab(PAI_TAB.Directive)}
        selected={tab === PAI_TAB.Directive}
      >
        Directives
      </Tabs.Tab>
      <Tabs.Tab
        icon="list"
        onClick={() => setTab(PAI_TAB.Installed)}
        selected={tab === PAI_TAB.Installed}
      >
        Installed
      </Tabs.Tab>
      <Tabs.Tab
        icon="list"
        onClick={() => setTab(PAI_TAB.Available)}
        selected={tab === PAI_TAB.Available}
      >
        Download
      </Tabs.Tab>
    </Tabs>
  );
};
=======
}
>>>>>>> tg-pr-88929
