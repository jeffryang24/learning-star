module.exports = {
  link: async (parent, _, context) => {
    return await context.prisma.member.findMany({
      where: {
        id: {
          equals: parent.id,
        },
      },
      select: {
        link: true,
      },
    });
  },
};
