# 디자인 가이드

구현할 때 이 문서의 토큰과 규칙만 사용합니다. 새 색이나 간격이 필요하면 먼저 이 문서에 추가하고 대비를 검증합니다.

## 1. 디자인 방향

**키워드: 숲, 햇살, 쉼**

- **프라이머리 (숲의 초록)**: 센터 이름 "숲결"에서 가져온 안정감 있는 초록
- **세컨더리 (숲 사이 햇살의 호박색)**: 초록의 보색 계열인 따뜻한 앰버. 차분한 초록 화면에서 시선이 머물러야 할 곳을 표시
- **깔끔함의 원칙**
  1. 색은 배경, 텍스트, 프라이머리, 세컨더리 4가지 역할만 씁니다. 세컨더리는 화면당 1~2곳에만 씁니다.
  2. 그림자 대신 여백과 옅은 배경색으로 영역을 나눕니다.
  3. 모서리 둥글기는 토큰 3개만 씁니다.
  4. 한 섹션에는 메시지 하나만 둡니다.

## 2. 색상

### 라이트 모드

| 토큰 | 값 | 용도 | 검증된 대비 |
|---|---|---|---|
| `--color-bg` | `#FAF8F3` | 페이지 배경 (따뜻한 오프화이트) | — |
| `--color-surface` | `#FFFFFF` | 카드 배경 | — |
| `--color-surface-soft` | `#E8F1EC` | 섹션 강조 배경, 배지 | — |
| `--color-text` | `#1F2A24` | 본문, 제목 | bg 13.98 · surface 14.84 · soft 12.88 |
| `--color-text-sub` | `#4A5750` | 보조 텍스트 | bg 7.14 · surface 7.58 |
| `--color-border` | `#8A8577` | 입력·카드 테두리, 구분선 | bg 3.47 · surface 3.68 (**텍스트 금지**) |
| `--color-primary` | `#2F6B4F` | 버튼 배경, 링크, 포커스 링 | bg 5.93 · surface 6.29 · soft 5.46 |
| `--color-primary-hover` | `#24543E` | 버튼 hover | — |
| `--color-on-primary` | `#FFFFFF` | 프라이머리 위 텍스트 | primary 6.29 · hover 8.70 |
| `--color-secondary` | `#E8A33D` | 강조 버튼, 하이라이트 배경 | — |
| `--color-secondary-hover` | `#D18F2A` | 세컨더리 hover | — |
| `--color-on-secondary` | `#1F2A24` | 세컨더리 위 텍스트 | secondary 6.88 · hover 5.42 |
| `--color-secondary-text` | `#9A5B0F` | 세컨더리 계열 텍스트 (라벨 등) | bg 5.10 · surface 5.42 |
| `--color-secondary-soft` | `#FBEFD9` | 세컨더리 강조 배경 | text 13.04 · secondary-text 4.76 |

### 다크 모드

다크 모드는 라이트 색을 반전하지 않고, 어두운 배경에서 눈이 편하도록 채도를 낮추고 명도를 올린 색을 따로 씁니다.

| 토큰 | 값 | 검증된 대비 |
|---|---|---|
| `--color-bg` | `#121814` | — |
| `--color-surface` | `#1A231E` | — |
| `--color-surface-soft` | `#1F3329` | — |
| `--color-text` | `#E6ECE8` | bg 15.03 · surface 13.45 · soft 11.21 |
| `--color-text-sub` | `#A9B7AF` | bg 8.64 · surface 7.74 |
| `--color-border` | `#6E7A73` | bg 4.02 · surface 3.60 (**텍스트 금지**) |
| `--color-primary` | `#7CC9A0` | bg 9.19 · surface 8.23 · soft 6.85 |
| `--color-primary-hover` | `#99D8B5` | — |
| `--color-on-primary` | `#0F1A14` | primary 9.10 · hover 10.90 |
| `--color-secondary` | `#F2B759` | — |
| `--color-secondary-hover` | `#F6C97E` | — |
| `--color-on-secondary` | `#1A1206` | secondary 10.32 · hover 11.98 |
| `--color-secondary-text` | `#F2B759` | bg 10.02 · surface 8.97 |
| `--color-secondary-soft` | `#3A2C14` | text 11.31 · secondary-text 7.54 |

> 다크 모드에서는 프라이머리 버튼 글자가 흰색이 아니라 어두운 색(`--color-on-primary`)입니다. 버튼 글자색을 하드코딩하지 말고 반드시 `on-*` 토큰을 씁니다.

### 색 조합 규칙

- **프라이머리와 세컨더리를 서로 겹치지 않습니다.** 둘 사이 대비는 라이트 2.92, 다크 1.09라서 초록 글자를 앰버 배경에 올리면 읽히지 않습니다.
- 흰 글자를 세컨더리 배경에 올리지 않습니다. 항상 `--color-on-secondary`를 씁니다.
- `--color-border`는 3:1 이상이라 UI 경계로는 충분하지만 본문 텍스트로는 부족합니다.
- 색만으로 상태를 구분하지 않고 텍스트나 아이콘을 함께 씁니다.

### CSS

```css
:root {
  color-scheme: light dark;

  --color-bg: #FAF8F3;
  --color-surface: #FFFFFF;
  --color-surface-soft: #E8F1EC;
  --color-text: #1F2A24;
  --color-text-sub: #4A5750;
  --color-border: #8A8577;
  --color-primary: #2F6B4F;
  --color-primary-hover: #24543E;
  --color-on-primary: #FFFFFF;
  --color-secondary: #E8A33D;
  --color-secondary-hover: #D18F2A;
  --color-on-secondary: #1F2A24;
  --color-secondary-text: #9A5B0F;
  --color-secondary-soft: #FBEFD9;
}

@media (prefers-color-scheme: dark) {
  :root {
    --color-bg: #121814;
    --color-surface: #1A231E;
    --color-surface-soft: #1F3329;
    --color-text: #E6ECE8;
    --color-text-sub: #A9B7AF;
    --color-border: #6E7A73;
    --color-primary: #7CC9A0;
    --color-primary-hover: #99D8B5;
    --color-on-primary: #0F1A14;
    --color-secondary: #F2B759;
    --color-secondary-hover: #F6C97E;
    --color-on-secondary: #1A1206;
    --color-secondary-text: #F2B759;
    --color-secondary-soft: #3A2C14;
  }
}
```

- 기본은 운영체제 설정(`prefers-color-scheme`)을 따릅니다. 수동 전환 토글은 선택 작업이며, 만들 경우 `:root[data-theme="dark"]`에 같은 값을 정의하고 토글 버튼에 `aria-pressed`를 씁니다.
- `color-scheme: light dark`를 선언해야 스크롤바, 폼 요소 같은 브라우저 기본 UI도 모드에 맞게 바뀝니다.
- SVG 아이콘은 `fill="currentColor"`로 만들어 텍스트 색을 따라가게 합니다.

## 3. 타이포그래피

- **글꼴**: Pretendard (SIL Open Font License). `woff2` 파일을 `src/assets/fonts/`에 넣고 `@font-face`로 불러옵니다. README에 라이선스를 기재합니다.
- **대체 글꼴**: `system-ui, -apple-system, "Apple SD Gothic Neo", "Malgun Gothic", sans-serif`
- 단위는 `rem`을 씁니다. 사용자의 브라우저 글꼴 크기 설정을 따르기 위해서입니다.

| 토큰 | 크기 | 굵기 | 줄 간격 | 용도 |
|---|---|---|---|---|
| `--fs-display` | `clamp(2rem, 1.4rem + 3vw, 3.25rem)` | 700 | 1.25 | 히어로 h1 |
| `--fs-h2` | `clamp(1.5rem, 1.2rem + 1.5vw, 2.25rem)` | 700 | 1.3 | 섹션 제목 |
| `--fs-h3` | `1.25rem` | 600 | 1.4 | 카드 제목 |
| `--fs-body` | `1rem` | 400 | 1.7 | 본문 |
| `--fs-small` | `0.875rem` | 500 | 1.5 | 배지, 캡션 (14px 미만 금지) |

- 본문 한 줄 길이는 최대 `68ch`로 제한합니다.
- 한국어 줄바꿈: `word-break: keep-all;`을 본문에 적용합니다.
- 섹션 제목 위에 작은 라벨(예: "ABOUT")을 둘 때는 `--color-secondary-text`를 씁니다.

## 4. 간격과 모양

**간격 (4px 기반)**

| 토큰 | 값 |
|---|---|
| `--space-1` | 0.25rem (4px) |
| `--space-2` | 0.5rem (8px) |
| `--space-3` | 0.75rem (12px) |
| `--space-4` | 1rem (16px) |
| `--space-6` | 1.5rem (24px) |
| `--space-8` | 2rem (32px) |
| `--space-12` | 3rem (48px) |
| `--space-section` | `clamp(4rem, 3rem + 5vw, 7.5rem)` |

**모서리**: `--radius-sm` 8px (배지, 입력) · `--radius-md` 16px (카드, 이미지) · `--radius-full` 999px (버튼)

**그림자**: 쓰지 않는 것이 기본입니다. 카드는 `1px solid` 테두리나 `--color-surface`와 `--color-bg`의 차이로 구분합니다.

## 5. 반응형 레이아웃

### 브레이크포인트 (모바일 우선)

| 이름 | 조건 | 컨테이너 좌우 여백 | 그리드 |
|---|---|---|---|
| 모바일 | 기본 (360px~) | 20px | 1열 |
| 태블릿 | `min-width: 48em` (768px) | 32px | 2열 |
| 데스크톱 | `min-width: 64em` (1024px) | 40px | 3열 / 12칼럼 |

- 미디어 쿼리는 `em` 단위로 씁니다. 사용자가 글꼴을 키우면 레이아웃도 함께 전환됩니다.
- 컨테이너 최대 폭: `72rem` (1152px), 가운데 정렬
  ```css
  .container {
    width: min(100% - 2 * var(--gutter), 72rem);
    margin-inline: auto;
  }
  ```
- 카드 그리드는 가능한 한 `auto-fit`으로 미디어 쿼리 없이 처리합니다.
  ```css
  .card-grid {
    display: grid;
    gap: var(--space-6);
    grid-template-columns: repeat(auto-fit, minmax(min(100%, 18rem), 1fr));
  }
  ```

### 섹션별 레이아웃

```
[헤더] sticky, 높이 64px
  모바일: 로고 ─────────── [메뉴 버튼]
  데스크톱: 로고 ── 소개 · 서비스 · 보호동물 · 입양절차 · 함께하기 ── [입양 문의]

[히어로] 배경 bg
  모바일:  사진 (4:3)
           h1 / 설명 / [입양 문의 · primary] [후원하기 · secondary]
  데스크톱: 텍스트 (5칸) | 사진 (7칸, 둥근 모서리)

[센터 소개 + 숫자] 배경 surface
  모바일:  소개 문단 → 숫자 2×2
  데스크톱: 소개 문단 (6칸) | 숫자 2×2 (6칸)

[운영 원칙] 배경 surface-soft
  모바일 1열 → 태블릿 이상 3열. 아이콘 + 제목 + 한 줄 설명

[제공 서비스] 배경 bg
  카드 auto-fit (1 → 2 → 3열, 5개라 마지막 줄은 왼쪽 정렬)

[보호 동물] 배경 surface
  카드 auto-fit (1 → 2 → 3열)
  카드: 사진(1:1) / 이름 h3 / 종·나이·성별 / 소개 / 배지

[입양 절차] 배경 surface-soft
  모바일:  세로 스텝 (번호 원 + 세로선)
  데스크톱: 가로 5단계

[함께하는 방법] 배경 secondary-soft (화면에서 세컨더리를 쓰는 유일한 섹션)
  모바일 1열 → 데스크톱 3열 + 하단 CTA

[오시는 길] 배경 bg
  모바일:  주소·운영시간·연락처 → 지도 이미지
  데스크톱: 정보 (5칸) | 지도 이미지 (7칸)

[푸터] 배경 surface-soft, 센터명 · 연락처 · 저작권
```

배경색이 `bg → surface → surface-soft`로 번갈아 바뀌어서 그림자 없이도 섹션이 구분됩니다.

## 6. 컴포넌트

### 버튼
| 종류 | 배경 | 글자 | 용도 |
|---|---|---|---|
| Primary | `--color-primary` | `--color-on-primary` | 입양 문의 등 주요 행동 |
| Secondary | `--color-secondary` | `--color-on-secondary` | 후원하기 (화면당 1~2개) |
| Ghost | 투명 + `--color-primary` 테두리 2px | `--color-primary` | 보조 행동 |

- 최소 높이 48px, 좌우 패딩 `--space-6`, `--radius-full`
- hover는 `*-hover` 토큰, 포커스는 아래 포커스 링 공통 스타일

### 포커스 링 (모든 인터랙티브 요소 공통)
```css
:focus-visible {
  outline: 3px solid var(--color-primary);
  outline-offset: 3px;
}
```
프라이머리 버튼 위에서도 `outline-offset` 때문에 링이 배경 위에 그려지므로 보입니다.

### 카드
- 배경 `--color-surface`, 테두리 `1px solid` (bg와 대비가 약한 곳에서만), `--radius-md`, 안쪽 여백 `--space-6`
- 카드 전체를 링크로 만들지 않습니다. 필요하면 제목 링크에 `::after`로 클릭 영역을 넓힙니다.

### 배지
- 배경 `--color-surface-soft`, 글자 `--color-text`, `--fs-small`, `--radius-sm`
- 예: "중성화 완료", "예방접종 완료"

### 이미지
- 비율은 `aspect-ratio`로 고정하고 `object-fit: cover`
- 동물 사진 1:1, 히어로 4:3 (모바일) / 자유 (데스크톱)
- 다크 모드에서도 사진은 그대로 둡니다. 필터로 어둡게 바꾸지 않습니다.

## 7. 움직임

- 전환은 `150ms~200ms ease-out`, 색과 투명도 위주로만 씁니다.
- 모든 애니메이션과 부드러운 스크롤은 `prefers-reduced-motion: no-preference` 안에서만 적용합니다.
- 숫자 카운터는 움직임 줄이기 설정에서 최종값을 바로 표시합니다.

## 8. Stitch 시안 반영 사항

참고 시안: `docs/design/stitch-desktop.png`, `docs/design/stitch-mobile.png`

시안은 **레이아웃과 분위기의 참고 자료**입니다. 색, 글꼴, 간격, 문구는 이 문서와 `CLAUDE.md`가 우선합니다.

### 그대로 따를 것
- 섹션 순서와 배경색 교차 (bg → surface → soft)
- 히어로: 데스크톱 텍스트 5칸 | 사진 7칸, 모바일은 사진 → 텍스트 → 버튼 세로 배치
- 소개 섹션의 숫자 2×2 카드
- 서비스 카드 3+2 왼쪽 정렬, 원형 배경 안의 라인 아이콘
- 보호 동물 카드: 사진 위, 이름과 종·나이·성별을 한 줄에, 하단 배지
- 입양 절차: 데스크톱 가로 5단계 (번호 원 + 연결선), 모바일 세로 스텝
- 함께하는 방법: 앰버 배경, 흰 카드 3개, 가운데 앰버 버튼

### 시안과 다르게 구현할 것
| 시안 | 구현 | 이유 |
|---|---|---|
| 히어로 제목이 단어 중간에서 줄바꿈 ("때까/지", "있을게/요") | `word-break: keep-all`, 필요하면 `<br>` 대신 `text-wrap: balance` | 한국어 가독성 |
| 숫자에 세리프 글꼴 사용 | Pretendard 700 + `font-variant-numeric: tabular-nums` | 글꼴 1종 원칙 |
| 카드 설명 글씨가 매우 작음 | 본문 16px, 최소 14px | 가독성, 확대 대응 |
| 모바일 하단 고정 탭 바 | **넣지 않음.** 헤더 햄버거 메뉴만 사용 | 명세에 없음, 헤더 메뉴와 중복, 콘텐츠를 가리고 포커스 순서가 복잡해짐 |
| 실제 지도 스크린샷 | 단순한 SVG 지도 일러스트 + "지도 앱에서 보기" 텍스트 | 지도 서비스 이미지는 라이선스 문제, 가상 주소와 맞지 않음 |
| 시안의 주소, 전화번호, 이메일 | `example.com`, `000-0000-0000`, 가상 주소 | 실제 정보처럼 보이지 않게 |
| 푸터의 "개인정보처리방침", "이용약관" 링크 | 넣지 않음 | 연결할 페이지가 없는 링크는 키보드·스크린 리더 사용자에게 혼란 |
| 시안의 동물 사진 | 무료 라이선스 사진을 직접 골라 사용 | 생성 이미지에 다른 웹페이지 화면이 섞인 사진이 있음, 출처 기록 필요 |

### 모바일 보완
- 보호 동물 카드가 1열로 6개 이어져 페이지가 길어짐 → 360px에서는 1열을 유지하되 사진 비율을 4:3으로 낮추고, 480px 이상부터 2열로 전환
- 서비스 목록은 시안처럼 아이콘 + 텍스트 가로형 행으로 구현해도 됨 (카드보다 짧음)
