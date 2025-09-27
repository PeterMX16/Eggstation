<<<<<<< HEAD
import { useBackend, useLocalState } from '../../backend';
import { Button, NoticeBox, Section, TextArea, Stack } from '../../components';
=======
import { useState } from 'react';
import { Button, NoticeBox, Section, TextArea } from 'tgui-core/components';

import { useBackend } from '../../backend';
>>>>>>> tg-pr-88929
import { RequestsData } from './types';

export const AnnouncementTab = (props) => {
  const { act, data } = useBackend<RequestsData>();
  const { authentication_data, is_admin_ghost_ai } = data;
<<<<<<< HEAD
  const [messageText, setMessageText] = useLocalState('messageText', '');
  return (
    <Stack vertical fill>
      <Stack.Item grow>
        <TextArea
          fluid
          maxLength={1025}
          multiline
          height="100%"
          value={messageText}
          onChange={(_, value) => setMessageText(value)}
          placeholder="Type your announcement..."
        />
      </Stack.Item>
      <Stack.Item>
        <Section fill>
          <AuthenticationNoticeBox />
          <Button
            disabled={
              !(
                authentication_data.announcement_authenticated ||
                is_admin_ghost_ai
              ) || !messageText
            }
            icon="bullhorn"
            content="Send announcement"
            onClick={() => {
              if (
                !(
                  authentication_data.announcement_authenticated ||
                  is_admin_ghost_ai
                ) ||
                !messageText
              ) {
                return;
              }
              act('send_announcement', { message: messageText });
              setMessageText('');
            }}
          />
          <Button
            icon="trash-can"
            content="Discard announcement"
            onClick={() => {
              act('clear_authentication');
              setMessageText('');
            }}
          />
        </Section>
      </Stack.Item>
    </Stack>
=======
  const [messageText, setMessageText] = useState('');
  return (
    <Section>
      <TextArea
        fluid
        height={20}
        maxLength={1025}
        value={messageText}
        onChange={(_, value) => setMessageText(value)}
        placeholder="Type your announcement..."
      />
      <Section>
        <AuthenticationNoticeBox />
        <Button
          disabled={
            !(
              authentication_data.announcement_authenticated ||
              is_admin_ghost_ai
            ) || !messageText
          }
          icon="bullhorn"
          content="Send announcement"
          onClick={() => {
            if (
              !(
                authentication_data.announcement_authenticated ||
                is_admin_ghost_ai
              ) ||
              !messageText
            ) {
              return;
            }
            act('send_announcement', { message: messageText });
            setMessageText('');
          }}
        />
        <Button
          icon="trash-can"
          content="Discard announcement"
          onClick={() => {
            act('clear_authentication');
            setMessageText('');
          }}
        />
      </Section>
    </Section>
>>>>>>> tg-pr-88929
  );
};

const AuthenticationNoticeBox = (props) => {
  const { act, data } = useBackend<RequestsData>();
  const { authentication_data, is_admin_ghost_ai } = data;
  return (
    (!authentication_data.announcement_authenticated && !is_admin_ghost_ai && (
<<<<<<< HEAD
      <NoticeBox warning>
        {'Swipe your card to authenticate yourself'}
      </NoticeBox>
    )) || <NoticeBox info>{'Succesfully authenticated'}</NoticeBox>
=======
      <NoticeBox>Swipe your card to authenticate yourself</NoticeBox>
    )) || <NoticeBox info>Succesfully authenticated</NoticeBox>
>>>>>>> tg-pr-88929
  );
};
