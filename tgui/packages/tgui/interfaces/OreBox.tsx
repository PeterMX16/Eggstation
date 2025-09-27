import { Box, Button, Section, Table } from 'tgui-core/components';
import { toTitleCase } from 'tgui-core/string';

import { useBackend } from '../backend';
import { Window } from '../layouts';

type Material = {
  name: string;
  amount: number;
};

type Data = {
  materials: Material[];
};

<<<<<<< HEAD
type Material = {
  type: string;
  name: string;
  amount: number;
};

const OREBOX_INFO = `All ores will be placed in here when you are wearing a
mining stachel on your belt or in a pocket while dragging the ore box.`;

=======
>>>>>>> tg-pr-88929
export const OreBox = (props) => {
  const { act, data } = useBackend<Data>();
  const { materials } = data;

  return (
    <Window width={335} height={415}>
      <Window.Content scrollable>
        <Section
<<<<<<< HEAD
          title="Ores"
          buttons={<Button content="Empty" onClick={() => act('removeall')} />}
=======
          title="Ores & Boulders"
          buttons={
            <Button
              disabled={materials.length === 0}
              onClick={() => act('removeall')}
            >
              Empty
            </Button>
          }
>>>>>>> tg-pr-88929
        >
          <Table>
            <Table.Row header>
              <Table.Cell>Item</Table.Cell>
              <Table.Cell collapsing textAlign="right">
                Amount
              </Table.Cell>
            </Table.Row>
            {materials.map((material, id) => (
              <Table.Row key={id}>
                <Table.Cell>{toTitleCase(material.name)}</Table.Cell>
                <Table.Cell collapsing textAlign="right">
                  <Box color="label" inline>
                    {material.amount}
                  </Box>
                </Table.Cell>
              </Table.Row>
            ))}
          </Table>
        </Section>
        <Section>
          <Box>
            Ores can be loaded here via a mining satchel or by hand. Boulders
            can also be stored here
            <br />
            Gibtonite is not accepted.
          </Box>
        </Section>
      </Window.Content>
    </Window>
  );
};
