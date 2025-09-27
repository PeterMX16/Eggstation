import { filter, sortBy } from 'common/collections';
import { useState } from 'react';
import { useBackend, useLocalState } from 'tgui/backend';
import {
<<<<<<< HEAD
  Stack,
  Input,
  Section,
  Tabs,
  NoticeBox,
  Box,
  Icon,
  Button,
} from 'tgui/components';
=======
  Box,
  Button,
  Icon,
  Input,
  NoticeBox,
  Section,
  Stack,
  Tabs,
} from 'tgui-core/components';

>>>>>>> tg-pr-88929
import { JOB2ICON } from '../common/JobToIcon';
import { CRIMESTATUS2COLOR } from './constants';
import { isRecordMatch } from './helpers';
import { SecurityRecord, SecurityRecordsData } from './types';

/** Tabs on left, with search bar */
export const SecurityRecordTabs = (props) => {
  const { act, data } = useBackend<SecurityRecordsData>();
  const { higher_access, records = [], station_z } = data;

  const errorMessage = !records.length
    ? 'No records found.'
    : 'No match. Refine your search.';

<<<<<<< HEAD
  const [search, setSearch] = useLocalState('search', '');
=======
  const [search, setSearch] = useState('');
>>>>>>> tg-pr-88929

  const sorted = sortBy(
    filter(records, (record) => isRecordMatch(record, search)),
    (record) => record.name,
  );

  return (
    <Stack fill vertical>
      <Stack.Item>
        <Input
          fluid
          placeholder="Name/Job/Fingerprints"
          onInput={(event, value) => setSearch(value)}
        />
      </Stack.Item>
      <Stack.Item grow>
        <Section fill scrollable>
          <Tabs vertical>
            {!sorted.length ? (
              <NoticeBox>{errorMessage}</NoticeBox>
            ) : (
              sorted.map((record, index) => (
                <CrewTab record={record} key={index} />
              ))
            )}
          </Tabs>
        </Section>
      </Stack.Item>
      <Stack.Item align="center">
        <Stack fill>
          <Stack.Item>
            <Button
              disabled
              icon="plus"
              tooltip="Add new records by inserting a 1 by 1 meter photo into the terminal. You do not need this screen open."
            >
              Create
            </Button>
          </Stack.Item>
        </Stack>
      </Stack.Item>
    </Stack>
  );
};

/** Individual record */
const CrewTab = (props: { record: SecurityRecord }) => {
  const [selectedRecord, setSelectedRecord] = useLocalState<
    SecurityRecord | undefined
  >('securityRecord', undefined);

  const { act, data } = useBackend<SecurityRecordsData>();
  const { assigned_view } = data;
  const { record } = props;
  const { crew_ref, name, trim, wanted_status } = record;

  /** Chooses a record */
  const selectRecord = (record: SecurityRecord) => {
    if (selectedRecord?.crew_ref === crew_ref) {
      setSelectedRecord(undefined);
    } else {
      // See MedicalRecords/RecordTabs.tsx for explanation
      if (selectedRecord === undefined) {
        setTimeout(() => {
          act('view_record', {
            assigned_view: assigned_view,
            crew_ref: crew_ref,
          });
        });
      }
      setSelectedRecord(record);
      act('view_record', { assigned_view: assigned_view, crew_ref: crew_ref });
    }
  };

  const isSelected = selectedRecord?.crew_ref === crew_ref;

  return (
    <Tabs.Tab
      className="candystripe"
      onClick={() => selectRecord(record)}
      selected={isSelected}
    >
<<<<<<< HEAD
      <Box bold={isSelected} color={CRIMESTATUS2COLOR[wanted_status]} wrap>
        <Icon name={JOB2ICON[rank] || 'question'} /> {name}
=======
      <Box bold={isSelected} color={CRIMESTATUS2COLOR[wanted_status]}>
        <Icon name={JOB2ICON[trim] || 'question'} /> {name}
>>>>>>> tg-pr-88929
      </Box>
    </Tabs.Tab>
  );
};
