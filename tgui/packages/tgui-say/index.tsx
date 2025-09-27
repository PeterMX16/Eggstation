import './styles/main.scss';
<<<<<<< HEAD
import { render } from 'inferno';

import { TguiSay } from './TguiSay';

document.onreadystatechange = function () {
  if (document.readyState !== 'complete') return;

  const root = document.getElementById('react-root');
  render(<TguiSay />, root);
=======

import { createRoot, Root } from 'react-dom/client';

import { TguiSay } from './TguiSay';

let reactRoot: Root | null = null;

document.onreadystatechange = function () {
  if (document.readyState !== 'complete') return;

  if (!reactRoot) {
    const root = document.getElementById('react-root');
    reactRoot = createRoot(root!);
  }

  reactRoot.render(<TguiSay />);
>>>>>>> tg-pr-88929
};
