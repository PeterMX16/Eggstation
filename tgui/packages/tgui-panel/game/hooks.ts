/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

<<<<<<< HEAD
import { useSelector } from 'common/redux';
import { selectGame } from './selectors';

export const useGame = (context) => {
  return useSelector(context, selectGame);
=======
import { useSelector } from 'tgui/backend';

import { selectGame } from './selectors';

export const useGame = () => {
  return useSelector(selectGame);
>>>>>>> tg-pr-88929
};
