import Layout from '../components/MyLayout';
import Link from 'next/link';
import fetch from 'isomorphic-unfetch';

const PostLink = ({shows}) => (
  <ul>
    {shows.map(({show}) => (
      <li key={show.id}>
        <Link as={`/p/${show.id}`} href={`/post?id=${show.id}`}>
          <a>{show.name}</a>
        </Link>
      </li>
    ))}
    {/* Without using global selector */}
    <style jsx>{`
      h1, a {
        font-family: "Arial";
      }

      ul {
        padding: 0;
      }

      li {
        list-style: none;
        margin: 5px 0;
      }

      a {
        text-decoration: none;
        color: blue;
      }

      a:hover {
        opacity: 0.6;
      }
    `}</style>
  </ul>
);

{/* <li>
    <Link as={`/p/${props.id}`} href={`/post?title=${props.title}`}>
      <a>{props.title}</a>
    </Link>
  </li> */}

const Index = (props) => (
  <Layout>
    <h1>My Blog</h1>
    <PostLink shows={props.shows} />
    {/* <PostLink id="hello-nextjs" title="Hello Next. Js!" />
    <PostLink id="learn-nextjs" title="Learn Next.js is awesome" />
    <PostLink id="deploy-nextjs" title="Deploy app with Zeit" /> */}
  </Layout>
);

Index.getInitialProps = async() => {
  const res = await fetch('https://api.tvmaze.com/search/shows?q=batman');
  const data = await res.json();

  console.log(`Show data fetched. Count: ${data.length}`);

  return {
    shows: data
  }
}

export default Index;
