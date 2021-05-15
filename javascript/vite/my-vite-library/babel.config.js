module.exports = function babelConfig(api) {
  return {
    presets: [
      [
        require.resolve('@babel/preset-react'),
        { runtime: 'automatic', importSource: '@emotion/react' },
      ],
    ],
    plugins: [require.resolve('@emotion/babel-plugin')],
  };
};
