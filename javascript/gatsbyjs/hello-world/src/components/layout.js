import React from 'react';
import styled from 'styled-components';
import { Link } from 'gatsby';

const ListLink = styled.ul`
  list-style: none;
  float: right;
`;

const ListLinkItem = styled(props => (
  <li className={props.className}>
    <Link to={props.to}>{props.children}</Link>
  </li>
))`
  display: inline-block;
  margin-right: 1rem;
`;

const Header = styled(props => (
  <header className={props.className}>
    <Link to="/" style={{ textShadow: `none`, backgroundImage: `none` }}>
      <h3 style={{ display: `inline` }}>MySweetSite</h3>
    </Link>

    <ListLink>
      <ListLinkItem to="/">Home</ListLinkItem>
      <ListLinkItem to="/about/">About</ListLinkItem>
      <ListLinkItem to="/contact/">Contact</ListLinkItem>
    </ListLink>
  </header>
))`
  margin-bottom: 1.5rem;
`;

export default styled(props => (
  <div className={props.className}>
    <Header />
    {props.children}
  </div>
))`
  margin: 3rem auto;
  max-width: 650px;
  padding: 0 1rem;
`;
