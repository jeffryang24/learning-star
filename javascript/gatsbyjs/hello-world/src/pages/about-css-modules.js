import React from 'react';
import styled from 'styled-components';
import { Link } from 'gatsby';

import Container from '../components/container';

// import styles from './about-css-modules.module.css';

const UserContainer = styled.div`
  display: flex;
  align-items: center;
  margin: 0 auto 12px auto;

  &:last-child {
    margin-bottom: 0;
  }
`;

const UserAvatar = styled.img.attrs(props => ({
  alt: props.alt || '',
  src: props.avatar,
}))`
  flex: 0 0 96px;
  width: 96px;
  height: 96px;
  margin: 0;
`;

const UserDescription = styled.div`
  flex: 1;
  margin-left: 18px;
  padding: 12px;
`;

const Username = styled.h2`
  margin: 0 0 12px 0;
  padding: 0;
`;

const Excerpt = styled.p`
  margin: 0;
`;

function User(props) {
  return (
    <UserContainer>
      <UserAvatar alt="avatar" avatar={props.avatar} />
      <UserDescription>
        <Username>{props.username}</Username>
        <Excerpt>{props.excerpt}</Excerpt>
      </UserDescription>
    </UserContainer>
  );
}

export default () => (
  <Container>
    <Link to="/">Home</Link>
    <h1>About CSS Modules</h1>
    <p>CSS Modules are cool</p>
    <User
      username="Jane Doe"
      avatar="https://s3.amazonaws.com/uifaces/faces/twitter/adellecharles/128.jpg"
      excerpt="I'm Jane Doe. Lorem ipsum dolor sit amet, consectetur adipisicing elit."
    />
    <User
      username="Bob Smith"
      avatar="https://s3.amazonaws.com/uifaces/faces/twitter/vladarbatov/128.jpg"
      excerpt="I'm Bob Smith, a vertically aligned type of guy. Lorem ipsum dolor sit amet, consectetur adipisicing elit."
    />
  </Container>
);
