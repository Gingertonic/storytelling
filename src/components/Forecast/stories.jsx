import React from 'react';

import { Forecast } from '.';

export default {
  title: 'Notifications/Forecast',
  component: Forecast,
  argTypes: {
      hasBones: { control: 'boolean' }
  }
};

export const Bones = (args) => <Forecast {...args} />;