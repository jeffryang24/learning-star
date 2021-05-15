import { defineConfig } from 'vite';
import { resolve } from 'path';
import baseConfig from '../../vite.config';

export default defineConfig({
  ...baseConfig,
  build: {
    lib: {
      entry: resolve(__dirname, 'src/index.ts'),
      name: 'constants',
      fileName: 'constants',
    },
  },
});
