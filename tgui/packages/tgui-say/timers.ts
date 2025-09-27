<<<<<<< HEAD
import { debounce, throttle } from 'common/timer';
=======
import { debounce, throttle } from 'tgui-core/timer';

import { Channel } from './ChannelIterator';
>>>>>>> tg-pr-88929

const SECONDS = 1000;

/** Timers: Prevents overloading the server, throttles messages */
export const byondMessages = {
  // Debounce: Prevents spamming the server
  channelIncrementMsg: debounce(
    (visible: boolean) => Byond.sendMessage('thinking', { visible }),
    0.4 * SECONDS,
  ),
  forceSayMsg: debounce(
<<<<<<< HEAD
    (entry: string) => Byond.sendMessage('force', { entry, channel: 'Say' }),
=======
    (entry: string, channel: Channel) =>
      Byond.sendMessage('force', { entry, channel }),
>>>>>>> tg-pr-88929
    1 * SECONDS,
    true,
  ),
  // Throttle: Prevents spamming the server
  typingMsg: throttle(() => Byond.sendMessage('typing'), 4 * SECONDS),
} as const;
