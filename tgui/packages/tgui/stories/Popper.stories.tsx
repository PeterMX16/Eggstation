import { Box, Popper } from 'tgui-core/components';

export const meta = {
  title: 'Popper',
  render: () => <Story />,
};

const Story = () => {
  return (
    <>
      <Popper
        isOpen
        content={
          <Box
            style={{
              background: 'white',
              border: '2px solid blue',
            }}
          >
            Loogatme!
          </Box>
        }
<<<<<<<< HEAD:tgui/packages/tgui/stories/Popper.stories.jsx
        options={{
          placement: 'bottom',
        }}
========
        placement="bottom"
>>>>>>>> tg-pr-88929:tgui/packages/tgui/stories/Popper.stories.tsx
      >
        <Box
          style={{
            border: '5px solid white',
            height: '300px',
            width: '200px',
          }}
        />
      </Popper>

      <Popper
        isOpen
        content={
          <Box
            style={{
              background: 'white',
              border: '2px solid blue',
            }}
          >
            I am on the right!
          </Box>
        }
<<<<<<<< HEAD:tgui/packages/tgui/stories/Popper.stories.jsx
        options={{
          placement: 'right',
        }}
========
        placement="right"
>>>>>>>> tg-pr-88929:tgui/packages/tgui/stories/Popper.stories.tsx
      >
        <Box
          style={{
            border: '5px solid white',
            height: '500px',
            width: '100px',
          }}
        />
      </Popper>
    </>
  );
};
