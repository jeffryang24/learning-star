import Layout from '../components/MyLayout_ForCSS';
import Link from 'next/link';

function getPosts() {
  return [
    {id: 'hello-nextjs', title: 'Hello Next.js'},
    {id: 'learn-nextjs', title: 'Learn Next.js is awesome'},
    {id: 'deploy-nextjs', title: 'Deploy apps with Zeit!'},
  ];
}

const Index = (props) => (
  <Layout>
    <h1>My Blog</h1>
    {getPosts().map(post => (
      <li key={post.id}>
        <Link as={`/p/${post.id}`} href={`/post?id=${post.id}`}>
          <a>{post.title}</a>
        </Link>
      </li>
    ))}
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
  </Layout>
);

export default Index;
