/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

import { Box } from 'tgui-core/components';
import { classes } from 'tgui-core/react';

import { useBackend } from '../backend';
<<<<<<<< HEAD:tgui/packages/tgui/layouts/Pane.jsx
import { Box } from '../components';
import { Layout } from './Layout';

export const Pane = (props) => {
  const { theme, children, className, ...rest } = props;
  const { suspended, debug } = useBackend();
  let debugLayout = false;
  if (debug) {
    debugLayout = debug.debugLayout;
  }
========
import { useDebug } from '../debug';
import { Layout } from './Layout';

type BoxProps = React.ComponentProps<typeof Box>;

type Props = Partial<{
  theme: string;
}> &
  BoxProps;

export function Pane(props: Props) {
  const { theme, children, className, ...rest } = props;
  const { suspended } = useBackend();
  const { debugLayout = false } = useDebug();
>>>>>>>> tg-pr-88929:tgui/packages/tgui/layouts/Pane.tsx

  return (
    <Layout className={classes(['Window', className])} theme={theme} {...rest}>
      <Box fillPositionedParent className={debugLayout && 'debug-layout'}>
        {!suspended && children}
      </Box>
    </Layout>
  );
}

type ContentProps = Partial<{
  fitted: boolean;
  scrollable: boolean;
}> &
  BoxProps;

function PaneContent(props: ContentProps) {
  const { className, fitted, children, ...rest } = props;

  return (
    <Layout.Content
      className={classes(['Window__content', className])}
      {...rest}
    >
<<<<<<<< HEAD:tgui/packages/tgui/layouts/Pane.jsx
      {(fitted && children) || (
========
      {fitted ? (
        children
      ) : (
>>>>>>>> tg-pr-88929:tgui/packages/tgui/layouts/Pane.tsx
        <div className="Window__contentPadding">{children}</div>
      )}
    </Layout.Content>
  );
}

Pane.Content = PaneContent;
