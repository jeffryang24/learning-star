module.exports = {
  links: async (parent, _, context) => {
    return (
      await context.prisma.member.findOne({
        where: {
          id: parent.id,
        },
        select: {
          link: true,
        },
      })
    ).link;
  },
};
