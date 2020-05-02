const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

async function main() {
  const newLink = await prisma.link.create({
    data: {
      url: 'www.prisma.io',
      description: 'Prisma replaces traditional ORMs 2',
    },
  });
  console.log(`Created new link: ${newLink.url} (ID: ${newLink.id})`);

  const allLinks = await prisma.link.findMany({ first: 5 });
  console.log({ allLinks });
}

main()
  .catch(e => {
    console.error(e);
    throw e;
  })
  .finally(async () => {
    await prisma.disconnect();
  });
