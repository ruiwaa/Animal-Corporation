import { defineConfig } from 'vite';
import { viteSingleFile } from 'vite-plugin-singlefile';

export default defineConfig({
  base: './',
  build: {
    // CSS를 한 파일로 모아야 플러그인이 HTML에 인라인할 수 있다.
    cssCodeSplit: false,
    // CSS의 url()은 CSS 파일 위치 기준으로 만들어지는데, CSS가 index.html 안으로 인라인되면
    // 기준이 dist 루트로 바뀐다. 에셋도 루트에 두어 두 기준을 일치시킨다.
    assetsDir: '',
  },
  plugins: [
    // 권장 설정은 이미지까지 base64로 인라인하므로 끄고, 이미지는 별도 파일로 둔다.
    viteSingleFile({ useRecommendedBuildConfig: false }),
  ],
});
