import styled from '@emotion/styled';

import { RedRibbon } from '../../constants/color';

interface Props {
  name: string;
}

const StyledButton = styled.button`
  background-color: ${RedRibbon};
  color: blue;
  font-size: 14px;
`;

export default function Button(props: Props) {
  return <StyledButton>{`Hello ${props.name}`}</StyledButton>;
}
