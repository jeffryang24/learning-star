const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

const { APP_SECRET, getUserId } = require('../../utils');

module.exports = {
  post: async (_, args, context) => {
    const userId = getUserId(context);
    const { url, description } = args;
    return await context.prisma.link.create({
      data: {
        url,
        description,
        member: {
          connect: {
            id: userId,
          },
        },
      },
    });
  },
  signup: async (_, args, context) => {
    const hashedPassword = await bcrypt.hash(args.password, 10);
    const { password, ...user } = await context.prisma.member.create({
      data: {
        ...args,
        password: hashedPassword,
      },
    });
    const token = jwt.sign({ userId: user.id }, APP_SECRET);

    return { token, user };
  },
  login: async (_, args, context) => {
    const { password, ...user } = await context.prisma.member.findOne({
      where: {
        email: args.email,
      },
    });
    if (!user) {
      throw new Error('No such user found!');
    }

    const valid = await bcrypt.compare(args.password, password);
    if (!valid) {
      throw new Error('Invalid password!');
    }

    const token = jwt.sign({ userId: user.id }, APP_SECRET);

    return { token, user };
  },
  // updateLink: (_, { id, url, description }) => {
  //   const currentIndex = links.findIndex(link => link.id === id);
  //   if (currentIndex === -1) {
  //     return null;
  //   } else {
  //     const currentLink = links[currentIndex];
  //     const updatedLink = {
  //       ...currentLink,
  //       url: typeof url === 'undefined' ? currentLink.url : url,
  //       description:
  //         typeof description === 'undefined'
  //           ? currentLink.description
  //           : description,
  //     };
  //     const newArray = [
  //       ...links.slice(0, currentIndex),
  //       updatedLink,
  //       ...links.slice(currentIndex + 1),
  //     ];
  //     links = newArray;
  //     return updatedLink;
  //   }
  // },
  // deleteLink: (_, { id }) => {
  //   const willBeDeletedLink = links.find(link => link.id === id);
  //   if (willBeDeletedLink) {
  //     links = links.filter(link => link.id !== id);
  //     return willBeDeletedLink;
  //   }
  //   return null;
  // },
};
