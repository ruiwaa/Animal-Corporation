# 숲결 동물보호센터

가상의 동물보호센터를 소개하는 반응형 상세페이지입니다.

## 실행 방법

### 바로 보기

빌드된 `index.html`을 브라우저로 엽니다. 로컬 서버나 인터넷 연결 없이 동작합니다.

### 개발 환경

```bash
npm install
npm run dev      # 개발 서버
npm run build    # dist/ 에 제출용 파일 생성
npm run preview  # 빌드 결과 미리보기
```

## 빌드 방식

Vite 기본 빌드는 `<script type="module" crossorigin>`을 써서 file://로 열면 CORS 정책 때문에 JS와 CSS가 차단됩니다. 그래서 `vite-plugin-singlefile`로 JS와 CSS를 `index.html` 안에 인라인하고, 이미지는 별도 파일로 둡니다. 자세한 테스트 결과는 `docs/04-build-checklist.md`에 있습니다.

## 사용한 라이브러리와 도구

| 이름 | 버전 | 용도 |
|---|---|---|
| [Vite](https://vite.dev/) | 8.3.4 | 개발 서버, 빌드 |
| [vite-plugin-singlefile](https://github.com/richardtallent/vite-plugin-singlefile) | 2.3.3 | file:// 실행을 위해 JS·CSS를 HTML에 인라인 |
| [Pretendard](https://github.com/orioncactus/pretendard) | 1.3.9 | 본문 글꼴. KS X 1001 서브셋 woff2를 로컬 파일로 포함. [SIL Open Font License 1.1](src/assets/fonts/Pretendard-LICENSE.txt) |

## 이미지 출처

모든 이미지는 원본을 내려받아 가로 1200px WebP로 변환해 `src/assets/images/`에 포함했습니다.

| 파일 | 사용 위치 | 원본 | 작가 | 라이선스 |
|---|---|---|---|---|
| `hero-dog.webp` | 히어로 | [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Earnest_dog_in_the_grass_(Unsplash).jpg) (원출처 [Unsplash](https://unsplash.com/photos/-KppBfOlugc)) | Rodion Kutsaev | [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/) |
