import { defineConfig } from 'vite';
import reactRefresh from '@vitejs/plugin-react-refresh';
import { babel } from '@rollup/plugin-babel';

// https://vitejs.dev/config/
export default defineConfig({
  esbuild: {
    jsxInject: `import React from 'react'`,
  },
  plugins: [babel({ babelHelpers: 'bundled' }), reactRefresh()],
});
