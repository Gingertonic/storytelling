import React from 'react';

export const Forecast = ({ hasBones }) => {
    return (
        <div>
            It's a {hasBones ? 'bones' : 'no bones'} day!  
        </div>
    );
}
