import hljs from 'highlight.js/lib/core';
<<<<<<< HEAD
import { Box, Button, Modal, Section } from '../../components';
=======
import { Dispatch, SetStateAction } from 'react';
import { Box, Button, Modal, Section } from 'tgui-core/components';

>>>>>>> tg-pr-88929
import { sanitizeText } from '../../sanitize';
import { LuaEditorModal } from './types';

type ChunkViewModalProps = {
<<<<<<< HEAD
  setModal: (modal: LuaEditorModal) => void;
  viewedChunk: string;
  setViewedChunk: (chunk: string | undefined) => void;
=======
  setModal: Dispatch<SetStateAction<LuaEditorModal>>;
  viewedChunk: string;
  setViewedChunk: Dispatch<SetStateAction<string | undefined>>;
>>>>>>> tg-pr-88929
};

export const ChunkViewModal = (props: ChunkViewModalProps) => {
  const { setModal, viewedChunk, setViewedChunk } = props;
<<<<<<< HEAD

=======
>>>>>>> tg-pr-88929
  return (
    <Modal position="absolute" width="50%" height="80%" top="10%" left="25%">
      <Section
        fill
        scrollable
        scrollableHorizontal
        title="Chunk"
        buttons={
          <Button
            color="red"
            icon="window-close"
            onClick={() => {
              setModal(undefined);
              setViewedChunk(undefined);
            }}
          >
            Close
          </Button>
        }
      >
        <Box
          as="pre"
          dangerouslySetInnerHTML={{
            __html: hljs.highlight(sanitizeText(viewedChunk), {
              language: 'lua',
            }).value,
          }}
        />
      </Section>
    </Modal>
  );
};
