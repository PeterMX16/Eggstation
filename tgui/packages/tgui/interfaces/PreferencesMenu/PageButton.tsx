<<<<<<< HEAD
import { InfernoNode } from 'inferno';
import { Button } from '../../components';
import { useBackend } from '../../backend';
import { PreferencesMenuData } from './data';
=======
import { ReactNode } from 'react';
import { Button } from 'tgui-core/components';
>>>>>>> tg-pr-88929

export const PageButton = <P extends unknown>(props: {
  currentPage: P;
  page: P;
  otherActivePages?: P[];

  setPage: (page: P) => void;
<<<<<<< HEAD
  children?: InfernoNode;
=======

  children?: ReactNode;
>>>>>>> tg-pr-88929
}) => {
  const { act } = useBackend<PreferencesMenuData>();
  const pageIsActive =
    props.currentPage === props.page ||
    (props.otherActivePages &&
      props.otherActivePages.indexOf(props.currentPage) !== -1);

  return (
    <Button
      align="center"
      fontSize="1.2em"
      fluid
      selected={pageIsActive}
<<<<<<< HEAD
      onClick={() => {
        props.setPage(props.page);
      }}
=======
      onClick={() => props.setPage(props.page)}
>>>>>>> tg-pr-88929
    >
      {props.children}
    </Button>
  );
};
