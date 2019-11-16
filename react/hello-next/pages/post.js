import Layout from '../components/MyLayout';
import fetch from 'isomorphic-unfetch';
import ReactMarkdown from 'react-markdown';

const Content = ({show}) => (
  <div>
    <h1>{show.name}</h1>
    <p>{show.summary.replace(/<[/]?p>/g, '')}</p>
    <img src={show.image.medium} alt="img"/>
  </div>
);

const markDown = `
This is our blog post. We have a [link](/link).

### This is a title.

And this is the content.
`;

// url props only occurs on default component,
// to pass it into another component, we use url props
const Post = (props) => (
  <Layout>
    <Content show={props.show} />
    <div className="markdown">
      <ReactMarkdown source={markDown} />
    </div>
    <style jsx global>
      {`
      .markdown {
        font-family: 'Arial';
      }

      .markdwon a {
        text-decoration: none;
        color: blue;
      }

      .markdown a:hover {
        opacity: 0.6;
      }

      .markdown h3 {
        margin: 0;
        padding: 0;
        text-transform: uppercase;
      }
      `}
    </style>
  </Layout>
);
Post.getInitialProps = async(context) => {
  console.log(context);
  const {id} = context.query;
  const res = await fetch(`https://api.tvmaze.com/shows/${id}`);
  const show = await res.json();

  console.log(`Fetched show: ${show.name}`);

  return { show };
};

export default Post;
