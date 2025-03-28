module.exports = function babelConfig(api) {
  api.cache(true);

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
