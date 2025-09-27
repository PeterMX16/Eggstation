import { Channel } from './ChannelIterator';
import { WINDOW_SIZES } from './constants';

/**
 * Once byond signals this via keystroke, it
 * ensures window size, visibility, and focus.
 */
<<<<<<< HEAD
export const windowOpen = (channel: Channel, scale: boolean) => {
  setWindowVisibility(true, scale);
  Byond.winset('tgui_say.browser', {
    focus: true,
  });
=======
export const windowOpen = (channel: Channel) => {
  setWindowVisibility(true);
>>>>>>> tg-pr-88929
  Byond.sendMessage('open', { channel });
};

/**
 * Resets the state of the window and hides it from user view.
 * Sending "close" logs it server side.
 */
<<<<<<< HEAD
export const windowClose = (scale: boolean) => {
  setWindowVisibility(false, scale);
=======
export const windowClose = () => {
  setWindowVisibility(false);
>>>>>>> tg-pr-88929
  Byond.winset('map', {
    focus: true,
  });
  Byond.sendMessage('close');
};

/**
 * Modifies the window size.
 */
<<<<<<< HEAD
export const windowSet = (size = WINDOW_SIZES.small, scale: boolean) => {
  const pixelRatio = scale ? window.devicePixelRatio : 1;
  const sizeStr = `${WINDOW_SIZES.width * pixelRatio}x${size * pixelRatio}`;

  Byond.winset(null, {
    'tgui_say.size': sizeStr,
    'tgui_say.browser.size': sizeStr,
=======
export const windowSet = (size = WINDOW_SIZES.small) => {
  let sizeStr = `${WINDOW_SIZES.width}x${size}`;

  Byond.winset('tgui_say.browser', {
    size: sizeStr,
  });

  Byond.winset('tgui_say', {
    size: sizeStr,
>>>>>>> tg-pr-88929
  });
};

/** Helper function to set window size and visibility */
<<<<<<< HEAD

const setWindowVisibility = (visible: boolean, scale: boolean) => {
  const pixelRatio = scale ? window.devicePixelRatio : 1;

  const sizeStr = `${WINDOW_SIZES.width * pixelRatio}x${WINDOW_SIZES.small * pixelRatio}`;

  Byond.winset(null, {
    'tgui_say.is-visible': visible,

    'tgui_say.size': sizeStr,

    'tgui_say.browser.size': sizeStr,
=======
const setWindowVisibility = (visible: boolean) => {
  Byond.winset('tgui_say', {
    'is-visible': visible,
    size: `${WINDOW_SIZES.width}x${WINDOW_SIZES.small}`,
>>>>>>> tg-pr-88929
  });
};
