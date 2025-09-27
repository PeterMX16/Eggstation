/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

import { useDispatch, useSelector } from 'tgui/backend';
import { Box, Button, Flex, Tabs } from 'tgui-core/components';

import { openChatSettings } from '../settings/actions';
import { addChatPage, changeChatPage } from './actions';
import { selectChatPages, selectCurrentChatPage } from './selectors';

const UnreadCountWidget = ({ value }) => (
  <Box
    style={{
<<<<<<< HEAD
      'font-size': '0.7em',
      'border-radius': '0.25em',
      width: '1.7em',
      'line-height': '1.55em',
      'background-color': 'crimson',
=======
      fontSize: '0.7em',
      borderRadius: '0.25em',
      width: '1.7em',
      lineHeight: '1.55em',
      backgroundColor: 'crimson',
>>>>>>> tg-pr-88929
      color: '#fff',
    }}
  >
    {Math.min(value, 99)}
  </Box>
);

export const ChatTabs = (props) => {
  const pages = useSelector(selectChatPages);
  const currentPage = useSelector(selectCurrentChatPage);
  const dispatch = useDispatch();
  return (
    <Flex align="center">
      <Flex.Item>
        <Tabs textAlign="center">
          {pages.map((page) => (
            <Tabs.Tab
              key={page.id}
              selected={page === currentPage}
              rightSlot={
                !page.hideUnreadCount &&
                page.unreadCount > 0 && (
                  <UnreadCountWidget value={page.unreadCount} />
                )
              }
              onClick={() =>
                dispatch(
                  changeChatPage({
                    pageId: page.id,
                  }),
                )
              }
            >
              {page.name}
            </Tabs.Tab>
          ))}
        </Tabs>
      </Flex.Item>
      <Flex.Item ml={1}>
        <Button
          color="transparent"
          icon="plus"
          onClick={() => {
            dispatch(addChatPage());
            dispatch(openChatSettings());
          }}
        />
      </Flex.Item>
    </Flex>
  );
};
