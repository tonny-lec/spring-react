import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import path, { resolve } from 'path';

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
      '@components': path.resolve(__dirname, './src/components'),
      '@pages': path.resolve(__dirname, './src/pages'),
      '@layouts': path.resolve(__dirname, './src/layouts'),
      '@assets': path.resolve(__dirname, './src/assets'),
    },
  },
  build: {
    manifest: true, // manifest.jsonを生成
    outDir: '../backend/src/main/resources/static', // 出力先をSpring Bootのstaticフォルダに指定
    rollupOptions: {
      input: {
        home: resolve(__dirname, './src/components/home/main.tsx'),
      },
    },
  },
});
