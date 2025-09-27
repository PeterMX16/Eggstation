/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

import { map } from 'common/collections';

export const selectChat = (state) => state.chat;

export const selectChatPages = (state) =>
<<<<<<< HEAD
  map((id: string) => state.chat.pageById[id])(state.chat.pages);
=======
  map(state.chat.pages, (id: string) => state.chat.pageById[id]);
>>>>>>> tg-pr-88929

export const selectCurrentChatPage = (state) =>
  state.chat.pageById[state.chat.currentPageId];

export const selectChatPageById = (id) => (state) => state.chat.pageById[id];
