# 숲결 동물보호센터

가상의 동물보호센터 "숲결"을 소개하는 **반응형 단일 상세페이지**입니다.
360px 휴대폰부터 1280px 이상 데스크톱까지 한 페이지로 대응하고, 키보드와 스크린 리더 사용자도 같은 정보를 얻을 수 있도록 접근성(WCAG 2.1 AA)을 기준으로 만들었습니다.

> 숲결 동물보호센터는 과제용으로 만든 가상 단체입니다. 주소, 전화번호(`000-0000-0000`), 이메일(`example.com`), 수치는 모두 가상의 값입니다.

## 한눈에 보기

| 항목 | 내용 |
|---|---|
| 실행 | 압축을 풀고 `animal-center/index.html`을 더블클릭. **서버나 인터넷 연결 없이 file://에서 동작** |
| 기술 | HTML, CSS, Vanilla JS, Vite (프레임워크 없음) |
| 반응형 | 모바일 우선, `em` 단위 브레이크포인트 3개, 320px(200% 확대)까지 가로 스크롤 없음 |
| 접근성 | Lighthouse 접근성 **100점**(모바일·데스크톱), 전 색 조합 WCAG AA 대비 계산, 키보드만으로 모든 기능 사용 가능 |
| 다크 모드 | 운영체제 설정(`prefers-color-scheme`)에 따라 자동 전환 |
| JS 없을 때 | 모든 콘텐츠와 메뉴를 그대로 읽고 쓸 수 있음 (JS는 모바일 메뉴 접기만 담당) |

## 실행 방법

### 바로 보기

제출 폴더(`animal-center/`) 바로 아래의 **`index.html`을 브라우저로 엽니다.** 폰트, 아이콘, 이미지를 모두 파일로 포함했기 때문에 서버나 인터넷 연결 없이도 똑같이 보입니다.

> `source/index.html`은 개발용 파일이라 직접 열면 스크립트가 동작하지 않습니다. 실행은 바깥의 `index.html`로 해 주세요.

### 제출 폴더 구성

```
animal-center/
├── index.html          # 실행 파일 (빌드 결과: HTML 안에 CSS·JS 포함)
├── *.webp              # 사진 7장
├── *.woff2             # Pretendard 폰트 4종
├── favicon-*.svg       # 파비콘
├── README.md
└── source/             # 개발용 소스
    ├── index.html, vite.config.js, package.json, package-lock.json
    ├── src/            # CSS, JS, 원본 에셋, 폰트·아이콘 라이선스
    ├── docs/           # 디자인 가이드, 체크리스트
    └── scripts/        # 제출 폴더 생성 스크립트
```

`node_modules/`, `.git/`, 원본 대용량 이미지는 넣지 않았습니다. 이 README에 나오는 `src/...`, `docs/...` 경로는 제출 폴더에서는 `source/` 아래에 있습니다.

### 개발 환경

```bash
cd source
npm install
npm run dev      # 개발 서버
npm run build    # dist/ 에 실행 파일 생성
npm run preview  # 빌드 결과 미리보기
npm run package  # 빌드 후 submission/animal-center.zip 생성
```

## 페이지 구성

| 순서 | 섹션 | 내용 |
|---|---|---|
| 1 | 헤더 | 로고, 주요 메뉴(같은 페이지 앵커), 입양 문의 버튼, 모바일 메뉴 토글 |
| 2 | 히어로 | 헤드라인, 소개 문장, 입양 문의·후원 버튼, 대표 사진 |
| 3 | 센터 소개 | 소개 문단, 숫자로 보는 센터(누적 구조, 입양 완료, 현재 보호, 봉사자) |
| 4 | 운영 원칙 | 안락사 없는 보호, 책임 입양, 투명한 운영 |
| 5 | 제공 서비스 | 입소 상담, 입양, 동물 구조, 실종 동물 찾기, 임시 보호 |
| 6 | 보호 동물 | 동물 6마리 카드(사진, 이름, 종·나이·성별, 소개, 건강 상태 배지) |
| 7 | 입양 절차 | 신청 → 상담 → 만남 → 계약 → 사후 관리 5단계 |
| 8 | 함께하는 방법 | 정기 후원, 봉사 활동, 물품 후원과 문의 버튼 |
| 9 | 오시는 길 | 주소, 연락처, 운영 시간, 교통, 약도 |
| 10 | 푸터 | 센터명, 연락처, 저작권 |

## 반응형 설계

### 1. 모바일 우선과 `em` 단위 브레이크포인트

기본 스타일은 360px 휴대폰 기준으로 작성하고, 화면이 넓어질 때만 `min-width` 미디어 쿼리로 레이아웃을 더했습니다.

| 이름 | 조건 | 좌우 여백 | 주요 변화 |
|---|---|---|---|
| 모바일 | 기본 (360px~) | 20px | 대부분 1열 (숫자로 보는 센터만 2×2) |
| 소형 태블릿 | `min-width: 30em` (480px~) | 20px | 보호 동물 카드 2열 |
| 태블릿 | `min-width: 48em` (768px~) | 32px | 운영 원칙 3열 (서비스 카드는 `auto-fit`으로 이 폭에서 2열) |
| 데스크톱 | `min-width: 64em` (1024px~) | 40px | 12칼럼 2단 배치, 한 줄 헤더, 입양 절차 가로 5단계, 카드 3열 |

미디어 쿼리를 `px`가 아닌 **`em`으로 쓴 이유**: 사용자가 브라우저 글꼴 크기를 키우면 `em` 기준점도 함께 커집니다. 그래서 글자가 커진 만큼 더 이른 시점에 1열 레이아웃으로 바뀌어, 큰 글자에서도 레이아웃이 깨지지 않습니다.

### 2. 섹션마다 콘텐츠에 맞는 배치

모든 섹션을 같은 그리드로 처리하지 않고, 콘텐츠 성격에 맞게 배치를 바꿨습니다.

| 섹션 | 모바일 | 데스크톱 | 고려한 점 |
|---|---|---|---|
| 헤더 | 로고 + 메뉴 버튼 (64px 고정) | 로고 · 메뉴 · 입양 문의 한 줄 | 메뉴를 펼치면 헤더 아래에 겹쳐 열려 본문을 밀어내지 않음 |
| 히어로 | 사진(4:3) → 제목 → 버튼 | 텍스트 5칸 \| 사진 7칸 | 화면에서는 사진이 먼저 보이지만, 마크업은 제목이 먼저라 스크린 리더는 제목부터 읽음 |
| 센터 소개 | 문단 → 숫자 2×2 | 문단 6칸 \| 숫자 6칸 | 숫자는 2×2를 유지하고, 칸이 좁으면 단위("마리")를 아래 줄로 내림 |
| 서비스 카드 | 1열 | 3열 (5개라 3+2, 왼쪽 정렬) | `auto-fit` 그리드로 미디어 쿼리 없이 열 수가 바뀜 |
| 보호 동물 | 1열, 사진 4:3 | 3열, 사진 1:1 | 1열에서 사진을 낮춰 세로로 길어지는 것을 막고, 480px부터 2열 |
| 입양 절차 | 세로 스텝 (번호 원 + 세로선) | 가로 5단계 (번호 원 + 연결선) | 연결선은 다음 칸 번호 원 중심까지 계산해 화면 폭이 바뀌어도 이어짐 |
| 오시는 길 | 정보 → 약도 | 정보 5칸 \| 약도 7칸 | 약도는 SVG라 어떤 폭에서도 선명함 |

### 3. 크기가 흐르듯 변하는 요소

- **글자 크기**: 제목은 `clamp()`로 화면 폭에 따라 부드럽게 커집니다. 예: 히어로 제목 `clamp(2rem, 1.4rem + 3vw, 3.25rem)`
- **섹션 여백**: `clamp(4rem, 3rem + 5vw, 7.5rem)`로 화면이 좁을수록 여백도 줄어듭니다.
- **컨테이너**: `width: min(100% - 2 * var(--gutter), 72rem)`로 미디어 쿼리 없이 좌우 여백과 최대 폭(1152px)을 함께 처리합니다.
- **카드 그리드**: `repeat(auto-fit, minmax(min(100%, 18rem), 1fr))`로 공간에 맞게 열 수가 정해집니다.
- **본문 한 줄 길이**: 최대 `68ch`로 제한해 넓은 화면에서도 읽기 편합니다.

### 4. 이미지

- 모든 `<img>`에 `width`/`height`를 지정해, 이미지를 불러오는 동안 레이아웃이 밀리지 않습니다(CLS 방지).
- `aspect-ratio` + `object-fit: cover`로 화면 폭이 달라도 사진 비율을 유지합니다.
- 첫 화면의 히어로 사진은 `fetchpriority="high"`로 먼저 불러오고, 아래쪽 사진 6장은 `loading="lazy"`로 스크롤할 때 불러옵니다.
- 이미지는 WebP로 변환했습니다. 7장 합계 538KB입니다.

### 5. 한국어 줄바꿈

`word-break: keep-all`로 단어 중간에서 줄이 바뀌지 않게 하고, 제목에는 `text-wrap: balance`로 줄 길이를 고르게 맞췄습니다. 예를 들어 "때까/지"처럼 단어가 잘리는 대신 "다시 가족을 만날 때까지, / 숲결이 곁에 있을게요"로 줄이 바뀝니다.

### 6. 검증

| 확인 항목 | 결과 |
|---|---|
| 360px, 768px, 1280px 레이아웃 | 섹션마다 PR에서 화면을 캡처해 확인 |
| 가로 스크롤 (320·360·640·768·1280px) | 모두 0. 320px은 200% 확대와 같은 폭(WCAG 1.4.10 Reflow) |
| 터치 대상 44×44px | 미달 0 (문장 안의 인라인 링크 제외) |

320px 점검에서 숫자 카드가 7px 넘치는 문제를 찾았습니다. 원인은 grid 칸이 카드의 최소 폭에 밀려난 것이었고, `minmax(0, 1fr)`로 고쳤습니다(이슈 #13).

## 접근성 설계

### 1. 의미에 맞는 마크업

| 콘텐츠 | 마크업 | 이유 |
|---|---|---|
| 페이지 골격 | `<header>`, `<nav>`, `<main>`, `<footer>` 각 1개 | 스크린 리더의 랜드마크 이동으로 원하는 영역에 바로 감 |
| 각 섹션 | `<section aria-labelledby="제목 id">` | 섹션 이름이 영역 이름으로 읽힘 |
| 제목 | `<h1>` 1개 → 섹션 `<h2>` → 카드 `<h3>` | 단계를 건너뛰지 않아 제목 목록만으로 페이지 구조를 파악할 수 있음 |
| 숫자로 보는 센터 | `<dl>`, `<dt>`, `<dd>` | "누적 구조, 1,240마리"처럼 항목명과 값이 짝지어 읽힘 |
| 서비스·동물 카드 | `<ul>` + `<li>` 안의 `<article>` | "목록, 6개 항목"처럼 개수가 전달됨 |
| 입양 절차 | `<ol>` | 순서가 의미 있는 정보라 순서 있는 목록 사용 |
| 연락처 | `<address>`, `<a href="tel:">`, `<a href="mailto:">` | 바로 전화·메일 앱으로 연결 |
| 운영 시간 | `<time datetime="10:00">` | 기계가 읽을 수 있는 시간 |
| 이동 / 동작 | 이동은 `<a href>`, 동작은 `<button type="button">` | `<div onclick>`이나 `<a href="#">`를 버튼 대신 쓰지 않음 |

### 2. 키보드만으로 모든 기능 사용

- **본문 바로가기**: 첫 Tab에 "본문 바로가기" 링크가 나타나 메뉴를 건너뛸 수 있습니다.
- **잘 보이는 포커스 링**: 모든 링크와 버튼에 `:focus-visible` 3px 링을 둡니다. `outline-offset`으로 링을 버튼 바깥에 그려, 초록 버튼 위에서도 보입니다.
- **고정 헤더가 가리지 않음**: `scroll-padding-top`을 헤더 높이(64px)로 두어, 메뉴로 이동하거나 Tab으로 포커스가 옮겨질 때 대상이 헤더 아래에 가려지지 않습니다. 헤더 테두리 1px까지 포함해 정확히 64px로 맞췄습니다.
- **Tab 순서 = 화면 순서**: 양수 `tabindex`를 쓰지 않았습니다. 히어로처럼 화면 배치를 바꾼 곳은 포커스가 없는 이미지만 옮겼습니다.
- **터치 대상**: 버튼 높이 48px, 메뉴 링크 44×44px 이상입니다.

### 3. 모바일 메뉴

| 동작 | 구현 |
|---|---|
| 상태 전달 | `aria-expanded`와 `aria-controls`를 쓰고, 버튼 이름도 "메뉴 열기" ↔ "메뉴 닫기"로 바뀜 |
| 상태 관리 | `aria-expanded` 하나만 기준으로 삼고, CSS도 이 속성으로 메뉴를 보이거나 숨김. 클래스와 ARIA 상태가 어긋날 수 없음 |
| Esc | 메뉴를 닫고 포커스를 토글 버튼으로 돌려줌 |
| 메뉴 항목 클릭 | 메뉴를 닫고 해당 섹션으로 이동 |
| 메뉴 밖으로 Tab, 빈 곳 클릭 | 메뉴를 닫음 (다른 창으로 전환할 때는 닫지 않음) |
| 데스크톱 폭으로 전환 | 상태 초기화 |

### 4. 스크린 리더 배려

- **이미지 대체 텍스트**: 사진은 내용을 설명합니다. 예: "초록 벽 앞에 엎드려 카메라를 바라보는 노란 털의 노령견 보리". "사진", "이미지" 같은 말은 넣지 않았습니다.
- **장식 아이콘 숨김**: 텍스트 옆 아이콘은 `aria-hidden="true"`, `focusable="false"`로 숨겨 같은 말이 두 번 읽히지 않게 했습니다.
- **입양 절차 번호**: 번호 원은 `aria-hidden`으로 숨겼습니다. `<ol>`이 이미 순서를 알려 주므로 "1, 1. 입양 신청"처럼 겹쳐 읽히지 않습니다.
- **약도**: SVG에 `role="img"`와 `<title>`, `<desc>`를 넣어 "센터는 솔바람로와 숲결천 사이, 숲결공원 북쪽에 있습니다"처럼 위치를 글로 전달합니다.
- **로고 링크**: 화면에는 "숲결 동물보호센터"만 보이지만, 숨긴 텍스트로 "숲결 동물보호센터 홈"이라고 읽혀 링크 목적이 분명합니다.
- **배지**: "중성화 완료"처럼 색이 아니라 텍스트로 정보를 전달합니다.

### 5. 색과 대비

- 라이트·다크 모드의 **모든 글자·배경 조합을 WCAG 공식으로 직접 계산**했습니다. 본문은 4.5:1, UI 요소는 3:1 이상입니다. hover 상태와 포커스 링도 포함했습니다.
- 다크 모드는 색을 단순히 뒤집지 않고 따로 정했습니다. 버튼 글자색을 하드코딩하지 않고 `--color-on-primary` 토큰을 써서, 다크 모드에서는 밝은 초록 버튼에 어두운 글자가 올라갑니다.
- 초록(프라이머리)과 앰버(세컨더리)는 서로 겹치지 않습니다. 둘 사이 대비가 2.92(다크 1.09)라 글자로 올리면 읽히지 않기 때문입니다.
- 회색 테두리 색(`--color-border`, 3.47:1)은 구분선에만 쓰고 글자에는 쓰지 않습니다.
- 전체 대비표는 `docs/02-design-guide.md`에 있습니다.

### 6. 확대와 움직임

- 글자 크기는 `rem` 단위라 브라우저 글꼴 설정을 따릅니다. `viewport`에서 확대를 막지 않았습니다.
- 부드러운 스크롤과 전환 효과는 `prefers-reduced-motion: no-preference`일 때만 적용합니다. 움직임 줄이기를 켠 사용자에게는 바로 이동합니다.
- 자동 재생 슬라이드나 깜빡이는 효과는 쓰지 않았습니다.

### 7. JS 없이도 읽을 수 있는 페이지

JS는 기능을 더하는 용도로만 씁니다.

- 섹션 이동은 JS가 아니라 `<a href="#about">` 앵커 링크와 CSS(`scroll-padding-top`, `scroll-behavior`)가 처리합니다.
- 메뉴 버튼은 `hidden` 상태로 시작하고, JS가 실행된 뒤에야 나타납니다. JS가 꺼져 있거나 실패하면 버튼 없이 메뉴가 펼쳐진 채로 보입니다.

### 8. 검증 결과

| 도구 / 방법 | 기준 | 결과 |
|---|---|---|
| Lighthouse 접근성 (13.5.0) | 90점 이상 | **모바일 100 / 데스크톱 100** |
| Lighthouse 권장사항 · SEO · 성능 | 기록 | 100 · 92 · 94(모바일) / 100 · 92 · 93(데스크톱) |
| 색 대비 계산 | AA | 라이트·다크 전 조합 통과 |
| 제목 구조, 랜드마크, `alt` 누락, 양수 `tabindex` | 오류 0 | 0 |
| 모바일 메뉴 동작 (헤드리스 Chrome 스크립트) | 열기·닫기, Esc, 포커스 복귀 | 전부 통과 |
| JS를 끈 상태 | 콘텐츠와 메뉴 사용 가능 | 메뉴가 펼쳐진 상태로 노출 |

자동 도구는 문제의 일부만 찾습니다. 점검 과정에서 Lighthouse가 잡지 못한 문제 두 가지를 직접 측정으로 찾아 고쳤습니다. 320px 가로 넘침, 그리고 데스크톱 메뉴 "소개" 링크의 터치 대상 폭(28px)입니다. 항목별 체크리스트는 `docs/05-a11y-checklist.md`에 있습니다.

## file:// 실행을 위한 빌드 방식

과제 조건은 "별도 추가 파일 없이 제출 파일만으로 정상 실행"입니다. 그런데 Vite 기본 빌드를 `index.html` 더블클릭(file://)으로 열면 **JS와 CSS가 모두 CORS 정책으로 차단**됩니다. Vite가 `<script type="module" crossorigin>`과 `<link crossorigin>`을 쓰기 때문입니다. 이 문제를 프로젝트 첫 이슈(#1)에서 실제로 열어 확인한 뒤 빌드 방식을 정했습니다.

- `vite-plugin-singlefile`로 JS와 CSS를 `index.html` 안에 넣어, 외부 모듈 요청을 없앴습니다.
- 플러그인 권장 설정은 이미지까지 base64로 넣어 HTML이 커지므로 끄고, 이미지와 폰트는 별도 파일로 두었습니다.
- CSS의 `url()`은 원래 CSS 파일 위치 기준으로 경로가 만들어지는데, CSS가 HTML 안으로 들어가면 기준이 바뀌어 경로가 깨집니다. 에셋을 같은 폴더에 두어(`assetsDir: ''`) 두 기준을 맞췄습니다.
- 모든 경로는 상대경로이고 CDN을 쓰지 않습니다. 오프라인에서도 동작합니다.

테스트 기록은 `docs/04-build-checklist.md`에 있습니다.

## 소스 폴더 구조

```
source/
├── index.html              # 개발용 진입 파일 (빌드하면 dist/index.html 생성)
├── vite.config.js          # 상대경로 base, 단일 파일 빌드 설정
├── package.json
├── src/
│   ├── styles/
│   │   ├── tokens.css      # 색상(라이트·다크), 타이포, 간격 토큰
│   │   ├── base.css        # 리셋, 폰트, 공통 요소, 포커스 링, 버튼·카드·배지
│   │   └── sections/       # 섹션별 CSS 10개
│   ├── scripts/
│   │   ├── main.js         # 초기화 순서 관리
│   │   └── mobile-menu.js  # 모바일 메뉴 토글
│   └── assets/
│       ├── images/         # WebP 사진 7장
│       ├── icons/          # Lucide 원본 SVG, 파비콘, 라이선스
│       └── fonts/          # Pretendard woff2 4종, 라이선스
├── docs/                   # 디자인 가이드, 빌드·접근성 체크리스트, 작업 흐름
└── scripts/package.sh      # 제출 폴더·ZIP 생성
```

## 사용한 라이브러리와 도구

| 이름 | 버전 | 용도 | 라이선스 |
|---|---|---|---|
| [Vite](https://vite.dev/) | 8.3.4 | 개발 서버, 빌드 | MIT |
| [vite-plugin-singlefile](https://github.com/richardtallent/vite-plugin-singlefile) | 2.3.3 | file:// 실행을 위해 JS·CSS를 HTML에 인라인 | MIT |
| [Pretendard](https://github.com/orioncactus/pretendard) | 1.3.9 | 글꼴. KS X 1001 서브셋 woff2 4종(400·500·600·700)을 로컬 파일로 포함 | SIL OFL 1.1 (`src/assets/fonts/Pretendard-LICENSE.txt`) |
| [Lucide](https://lucide.dev/) | lucide-static 1.57.0 | 라인 아이콘. 필요한 SVG만 HTML에 인라인 | ISC (`src/assets/icons/Lucide-LICENSE.txt`) |
| [Lighthouse](https://developer.chrome.com/docs/lighthouse) | 13.5.0 | 접근성·성능 점검 (`npx`로 실행, 프로젝트 의존성 아님) | Apache 2.0 |

Vite와 플러그인은 개발·빌드용이라 실행 파일(`index.html`)에는 포함되지 않습니다. 화면에 쓰이는 외부 리소스는 Pretendard와 Lucide뿐이고, 둘 다 파일로 포함했습니다.

## 이미지 출처

모든 이미지는 원본을 내려받아 WebP로 변환해 `src/assets/images/`에 포함했습니다. 원본 대용량 파일은 제출물에 넣지 않았습니다.

- 변환 방법: Chrome `<canvas>`에 원본을 그린 뒤 `toDataURL('image/webp', 품질)`로 저장 (별도 설치 도구 없이 진행)
- 히어로: 가로 1200px, 품질 0.8
- 보호 동물: 동물이 가운데 오도록 800×800 정사각형으로 잘라 품질 0.8. 배경 질감 때문에 용량이 큰 `animal-tabby`, `animal-rabbit`은 품질 0.7
- 약도는 사진이 아니라 직접 그린 SVG입니다. 실제 지도 서비스 이미지는 라이선스 문제가 있고 가상 주소와도 맞지 않습니다.

| 파일 | 사용 위치 | 원본 | 작가 | 라이선스 |
|---|---|---|---|---|
| `hero-dog.webp` | 히어로 | [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Earnest_dog_in_the_grass_(Unsplash).jpg) (원출처 [Unsplash](https://unsplash.com/photos/-KppBfOlugc)) | Rodion Kutsaev | [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/) |
| `animal-senior.webp` | 보호 동물 카드 (보리) | [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Dog_for_Senior_Dog_Food_Diet_Wikipedia_Page.jpg) (원출처 [Pixabay](https://pixabay.com/photos/dog-hybrid-senior-domestic-dog-2231453/)) | Leo_65 | [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/) |
| `animal-poodle.webp` | 보호 동물 카드 (몽실) | [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Cute_Senior_Small_Poodle_Mix.jpg) | Twawri | [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/) |
| `animal-shepherd.webp` | 보호 동물 카드 (두부) | [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:White_Swiss_Shepherd_Dog.jpg) | Avietar | [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/) |
| `animal-tabby.webp` | 보호 동물 카드 (나비) | [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Sleepy_European_tabby_cat.jpg) | Gugalcrom123 | [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/) |
| `animal-grey.webp` | 보호 동물 카드 (구름) | [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Grey_cat_looking_up_at_camera.jpg) | Aleenamustlive | [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/) |
| `animal-rabbit.webp` | 보호 동물 카드 (솜이) | [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Bunny_in_a_basket.jpg) | Catlover1133 | [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/) |

## 작업 방식

기능 하나를 이슈 하나, PR 하나로 나눠 진행했습니다. 흐름은 이슈 발행 → 브랜치 → 커밋 → PR(셀프 리뷰 체크리스트) → Squash 머지입니다.

| 마일스톤 | 이슈 |
|---|---|
| M1 기반 세팅 | #1 Vite 세팅과 file:// 실행 검증, #2 디자인 토큰과 기본 스타일 |
| M2 섹션 구현 | #3 헤더 ~ #10 오시는 길과 푸터 (섹션별 1개씩) |
| M3 인터랙션과 마무리 | #11 모바일 메뉴, #12 이미지 최적화, #13 접근성 전체 점검, #14 README와 제출 빌드 |

- 섹션을 만들 때마다 PR에서 360·768·1280px, 라이트·다크 모드, 콘솔 에러를 확인했습니다.
- 우회 처리 대신 원인을 찾아 고쳤습니다. 예: 헤더 높이가 테두리 때문에 65px이 되어 섹션 위쪽이 1px 가려지던 문제, 입양 절차 제목 높이가 칸마다 어긋나던 grid 행 늘어남 문제.

| 문서 | 내용 |
|---|---|
| `docs/02-design-guide.md` | 색상(라이트·다크 대비표), 타이포, 간격, 반응형 레이아웃, 컴포넌트 |
| `docs/04-build-checklist.md` | file:// 실행 테스트와 빌드 방식 결정 기록 |
| `docs/05-a11y-checklist.md` | 접근성 체크리스트와 도구 검증 결과 |
| `docs/03-workflow.md` | 이슈 → 브랜치 → PR 흐름과 작업 구간 |
