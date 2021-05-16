import React from 'react';
import { css } from '@emotion/react';
import { RedRibbon } from '../../constants/color';

interface Props {
  children?: React.ReactNode;
}

export default function Paragraph(props: Props) {
  return (
    <p
      css={css`
        background-color: ${RedRibbon};
        font-size: 14px;
        color: lime;
      `}
    >
      {props.children}
    </p>
  );
}
