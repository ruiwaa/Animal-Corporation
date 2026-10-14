# Vite 빌드와 실행 테스트 체크리스트

## 왜 이 문서가 필요한가

과제 조건은 "별도 추가 파일 없이 제출 파일만으로 정상 실행"입니다. 채점자는 로컬 서버 없이 `index.html`을 더블클릭할 수 있습니다. 이때 주소는 `file:///.../index.html`입니다.

Vite 기본 빌드 결과에는 두 가지 문제가 있습니다.

1. **경로**: 기본값 `base: '/'` 때문에 `src="/assets/index-xxxx.js"`처럼 절대경로가 생깁니다. file://에서는 드라이브 루트를 가리켜 파일을 찾지 못합니다.
2. **모듈 스크립트**: 빌드된 HTML은 `<script type="module" crossorigin src="...">`를 씁니다. 브라우저는 모듈 스크립트를 CORS 규칙으로 불러오는데, file://의 출처는 `null`이라 Chrome 등에서 차단됩니다. 경로를 고쳐도 JS가 실행되지 않을 수 있습니다.

그래서 **dev 서버에서 잘 되는 것만으로는 부족하고, 제출 형태 그대로 file://로 여는 테스트가 필수**입니다.

## 1. 초기 설정 확인 (이슈 #1)

- [x] `vite.config.js`에 `base: './'` 설정
  ```js
  import { defineConfig } from 'vite';
  export default defineConfig({
    base: './',
  });
  ```
- [x] `index.html`의 모든 경로가 상대경로 (`./src/...`)
- [x] CSS의 `url()`도 상대경로
- [x] 빈 페이지에 CSS 한 줄, JS 한 줄(`document.body.dataset.js = 'on'`), 이미지 하나를 넣고 아래 2번 테스트를 실행
- [x] **file://에서 JS가 막히면 제출 방식을 결정하고 README와 이 문서에 기록** → 아래 "결정" 참고

### file://에서 JS가 실행되지 않을 때 선택지

| 방식 | 내용 | 장점 | 주의할 점 |
|---|---|---|---|
| A. 단일 파일 빌드 | `vite-plugin-singlefile`로 JS와 CSS를 HTML 안에 인라인 | 외부 모듈 요청이 없어서 file://에서 동작. Vite 개발 경험 유지 | 기본 설정은 이미지까지 base64로 넣어 HTML이 커짐. 이미지는 별도 파일로 두도록 설정을 확인. README에 플러그인 기재 필요 |
| B. Vite는 개발 서버로만 사용 | 소스를 클래식 스크립트(`<script src="./js/main.js" defer>`)로 작성하고, 소스 폴더 자체를 제출 | 빌드 결과와 소스가 같아서 단순함. 추가 의존성 없음 | 번들링, 해시 파일명, 최적화 이점이 없음. JS 파일 간 `import` 불가 |

> 어느 쪽이든 **실제로 file://에서 열어 확인한 결과**를 근거로 결정합니다. 플러그인 옵션은 도입 시점에 공식 문서로 확인합니다.

### 결정: A. 단일 파일 빌드 (이슈 #1, 2026-10-14)

**테스트 결과** (Chrome 헤드리스, Firefox 헤드리스, file://)

| 대상 | 결과 |
|---|---|
| 기본 빌드 `dist/index.html` | JS **와 CSS 모두** CORS로 차단. `<link>`에도 `crossorigin`이 붙기 때문 |
| 소스 `index.html` | `type="module"` JS 차단 |
| A안 빌드 `dist/index.html` | JS·CSS·`<img>`·CSS `url()` 이미지 모두 정상, 콘솔 에러 0개. 다른 경로로 복사해도 정상 |

**설정** (`vite.config.js`)

- `viteSingleFile({ useRecommendedBuildConfig: false })`: 권장 설정은 `assetsInlineLimit`을 무제한으로 바꿔 모든 이미지를 base64로 넣기 때문에 끕니다. 이미지는 Vite 기본값(4KB 미만만 인라인)을 따릅니다.
- `build.cssCodeSplit: false`: CSS를 하나로 모아야 플러그인이 인라인합니다.
- `build.assetsDir: ''`: CSS의 `url()`은 CSS 파일 위치(`assets/`) 기준 상대경로로 만들어집니다. CSS가 `index.html` 안으로 인라인되면 기준이 `dist/` 루트로 바뀌어 `./assets/` 아래 이미지를 찾지 못합니다. 에셋도 루트에 두어 두 기준을 맞춥니다.

**제출 시 주의**

- 채점자가 여는 `index.html`은 **빌드 결과물**이어야 합니다. 소스 `index.html`은 file://에서 JS가 막힙니다.
- 제출 폴더 구성안: 루트에 `dist/` 내용(빌드된 `index.html`과 이미지), `source/`에 프로젝트 소스. 최종 구성은 이슈 #14에서 확정합니다.

## 2. 실행 테스트 매트릭스

| 실행 방식 | 명령 / 방법 | 확인 시점 |
|---|---|---|
| 개발 서버 | `npm run dev` | 매 작업 |
| 빌드 미리보기 | `npm run build && npm run preview` | PR마다 |
| **file:// 직접 열기** | 빌드 결과(또는 제출 폴더)의 `index.html` 더블클릭 | 구조 변경 PR, 제출 전 필수 |
| **ZIP 해제 후 열기** | ZIP을 **다른 위치**에 풀고 `index.html` 더블클릭 | 제출 전 필수 |

### 각 실행 방식에서 확인할 것

- [ ] CSS 적용 (폰트, 색상, 레이아웃)
- [ ] JS 동작 (모바일 메뉴 토글 등)
- [ ] 모든 이미지와 SVG 아이콘 표시
- [ ] 로컬 폰트 로드 (개발자 도구 Network 탭)
- [ ] 헤더 앵커와 로고 `#top` 이동
- [ ] 콘솔 에러 0개 (특히 `CORS`, `net::ERR_FILE_NOT_FOUND`)
- [ ] Network 탭에 외부 도메인 요청 없음

## 3. 브라우저 확인

- [ ] Chrome (file:// 제약이 가장 엄격함)
- [ ] Safari 또는 Firefox 중 하나 이상
- [ ] 모바일 화면: 개발자 도구 기기 모드 360px, 768px

## 4. 오프라인 테스트

- [ ] 네트워크를 끊거나 개발자 도구에서 Offline으로 설정한 뒤 file://로 열어도 모든 것이 표시됨
  - CDN이나 외부 이미지가 숨어 있는지 찾는 가장 확실한 방법입니다.

## 5. 제출 전 최종 체크 (이슈 #14)

- [ ] `npm run build` 경고 없이 성공
- [ ] 제출 폴더 구성 확인
  - 실행 파일: `index.html`과 필요한 에셋
  - 소스: `src/`, `vite.config.js`, `package.json`, `package-lock.json`
  - 문서: `README.md`
- [ ] 제외할 것: `node_modules/`, `.git/`, `.DS_Store`, 원본 대용량 이미지
- [ ] README에 기재
  - 바로 보는 방법: `index.html`을 브라우저로 열기
  - 개발 환경 실행: `npm install && npm run dev`
  - 사용한 라이브러리와 도구: 이름, 버전, 용도 (Vite, 플러그인, 폰트, 아이콘)
  - 이미지 출처와 라이선스
- [ ] ZIP 생성 후 **새 폴더에 풀어서** 2번 매트릭스의 file://, 오프라인 항목 재확인
- [ ] Lighthouse (`vite preview` 기준): 접근성 90 이상, 성능·권장사항·SEO 점수 기록
