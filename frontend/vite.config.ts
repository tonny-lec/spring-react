import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import { resolve } from 'path';

export default defineConfig({
  plugins: [react()],
  build: {
    manifest: true, // manifest.jsonを生成
    outDir: '../backend/src/main/resources/static', // 出力先をSpring Bootのstaticフォルダに指定
    rollupOptions: {
      input: {
        main: resolve(__dirname, 'src/main.tsx'),
      },
    },
  },
});
