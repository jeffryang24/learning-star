import React from 'react';
import styled from 'styled-components';
import { graphql, useStaticQuery, Link } from 'gatsby';

import { rhythm } from '../utils/typography';

export default styled(({ className, children }) => {
  const data = useStaticQuery(graphql`
    query {
      site {
        siteMetadata {
          title
        }
      }
    }
  `);

  return (
    <div className={className}>
      <Link to={`/index-4`}>
        <h3
          css={`
            margin-bottom: ${rhythm(2)};
            display: inline-block;
            font-style: normal;
          `}
        >
          {data.site.siteMetadata.title}
        </h3>
      </Link>

      <Link
        to={`/about-4`}
        css={`
          float: right;
        `}
      >
        About
      </Link>

      <Link
        to={`/`}
        css={`
          float: right;
          margin-right: ${rhythm(0.5)};
        `}
      >
        Back to Index
      </Link>

      {children}
    </div>
  );
})`
  margin: 0 auto;
  max-width: 700px;
  padding: ${rhythm(2)};
  padding-top: ${rhythm(1.5)};
`;
