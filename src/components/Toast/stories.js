import React from 'react';

import { Toast } from '.';

export default {
  title: 'Notifications/Toast',
  component: Toast,
  argTypes: {
      variant: {
        control: 'select',
        options: ['general', 'post', 'dm'],
        defaultValue: { summary: 'general' },
        required: true,
        description: 'notification type'
      },
      user: {
        required: false,
        control: 'object',
        description: 'user object',
        defaultValue: { 
            username: 'Bruce Banner',
            friend: true
        }
    }
  }
};

export const Template = (args) => <Toast {...args} />;

export const Post = Template.bind({});
Post.args = {
    variant: 'post', 
    user: {
        username: 'PhwoarThor',
        friend: false
    }
};

export const DM = Template.bind({});
DM.args = {
    variant: 'dm', 
    user: {
        username: 'PhwoarThor',
        friend: true
    }
};
