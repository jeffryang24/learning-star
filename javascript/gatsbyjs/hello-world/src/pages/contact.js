import React from 'react';
// Part 1-2
// import { Link } from 'gatsby';

// Part 1-2
// import Header from '../components/header';
import Layout from '../components/layout';

export default () => (
  // Part 1-2
  // <div style={{ color: 'purple' }}>
  //   <Link to="/">Home</Link>
  //   <Header text="Contact" />
  //   <p>What a world!</p>
  //   <img src="https://source.unsplash.com/random/400x200" alt="" />
  // </div>
  <Layout>
    <h1>I'd love to talk! Email me at the address below</h1>
    <p>
      <a href="mailto:me@example.com">me@example.com</a>
    </p>
  </Layout>
);
