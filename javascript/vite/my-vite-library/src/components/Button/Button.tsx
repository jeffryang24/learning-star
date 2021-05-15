import React from 'react';
import styled from '@emotion/styled';

import { RedRibbon } from '../../constants/src/color';

interface Props {
  name: string;
}

const StyledButton = styled.button`
  background-color: ${RedRibbon};
`;

export default function Button(props: Props) {
  return <StyledButton>{`Hello ${props.name}`}</StyledButton>;
}
