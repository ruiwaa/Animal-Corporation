# 접근성 체크리스트

기준: WCAG 2.1 AA. 각 섹션 PR에서는 해당 항목을, 이슈 #13에서는 전체 항목을 확인합니다.

## 1. 시맨틱 마크업

### 문서 구조
- [ ] `<html lang="ko">`
- [ ] `<title>`이 페이지 내용을 설명함 (예: "숲결 동물보호센터 | 안락사 없는 보호센터")
- [ ] `<meta name="viewport" content="width=device-width, initial-scale=1">`이 있고, `user-scalable=no`나 `maximum-scale=1`로 확대를 막지 않음
- [ ] 랜드마크: `<header>`, `<nav>`, `<main>`, `<footer>`가 각각 한 번씩
- [ ] 각 섹션은 `<section aria-labelledby="섹션제목id">`

### 제목 순서
- [ ] `<h1>`은 페이지에 하나 (히어로 헤드라인)
- [ ] 섹션 제목은 `<h2>`, 카드 제목은 `<h3>`
- [ ] 단계를 건너뛰지 않음 (h2 → h4 금지)
- [ ] 크기를 위해 제목 태그를 고르지 않음. 크기는 CSS로 조절
- [ ] 확인 방법: WAVE의 Structure 탭이나 HeadingsMap 확장 프로그램

### 콘텐츠 구조
| 콘텐츠 | 태그 |
|---|---|
| 내비게이션 메뉴 | `<nav aria-label="주요 메뉴">` + `<ul>` |
| 숫자로 보는 센터 | `<dl>` (`<dt>` 항목명, `<dd>` 숫자) |
| 서비스, 동물 카드 목록 | `<ul>` + `<li>` 안에 `<article>` |
| 입양 절차 | `<ol>` (순서가 의미 있음) |
| 주소, 연락처 | `<address>` |
| 운영 시간 | `<time>` (선택) |

- [ ] 클릭해서 이동하면 `<a href>`, 동작을 실행하면 `<button type="button">`
- [ ] `<div onclick>`이나 `<a href="#">`를 버튼 대신 쓰지 않음

### 이미지
- [ ] 정보가 있는 이미지: 내용을 설명하는 `alt` (예: "잔디밭에 앉은 갈색 믹스견 콩이")
- [ ] 장식 이미지와 아이콘: `alt=""` 또는 CSS 배경
- [ ] 텍스트 옆 SVG 아이콘: `aria-hidden="true"` + `focusable="false"`
- [ ] 아이콘만 있는 버튼: `aria-label` (예: `aria-label="메뉴 열기"`)
- [ ] 로고 링크: `alt="숲결 동물보호센터 홈"` (링크 목적)
- [ ] `alt`에 "이미지", "사진" 같은 말을 넣지 않음

## 2. 색상과 대비

- [ ] 본문 텍스트 대비 4.5:1 이상
- [ ] 큰 텍스트 (24px 이상, 또는 bold 18.66px 이상) 3:1 이상
- [ ] 버튼 테두리, 입력 필드 테두리, 포커스 표시 등 UI 요소 3:1 이상
- [ ] `--color-border`(라이트 3.47:1)를 텍스트에 쓰지 않음
- [ ] 버튼 글자색은 `--color-on-primary`, `--color-on-secondary` 토큰을 씀 (다크 모드에서 글자색이 바뀜)
- [ ] 프라이머리와 세컨더리를 서로 겹치지 않음 (대비 2.92 / 다크 1.09)
- [ ] **라이트와 다크 모드 둘 다** 대비 확인 (개발자 도구 Rendering 탭 → prefers-color-scheme 에뮬레이션)
- [ ] 이미지 위 텍스트는 오버레이로 대비를 확보
- [ ] 색만으로 정보를 구분하지 않음 (예: "입양 대기" 배지는 색과 함께 텍스트 표시)
- [ ] hover, focus 상태 색상도 대비 확인
- [ ] 확인 방법: 개발자 도구의 색상 선택기 대비 표시, WebAIM Contrast Checker
- [ ] 새 색 조합을 추가하면 `docs/02-design-guide.md`의 색상 표를 갱신

## 3. 키보드와 포커스

- [ ] 첫 Tab에 "본문 바로가기" 링크가 나타남 (`<a href="#main" class="skip-link">`)
- [ ] Tab 순서가 화면에 보이는 순서와 같음
- [ ] 양수 `tabindex`(`tabindex="1"` 등)를 쓰지 않음
- [ ] 모든 링크와 버튼에 포커스 표시가 보임
  ```css
  :focus-visible {
    outline: 3px solid var(--color-primary);
    outline-offset: 3px;
  }
  ```
- [ ] `outline: none`만 쓰고 대체 스타일 없이 끝내지 않음
- [ ] sticky 헤더가 포커스된 요소를 가리지 않음 (`scroll-padding-top`)
- [ ] 앵커로 이동한 섹션 제목이 헤더에 가려지지 않음 (`scroll-margin-top`)

## 4. JavaScript 동작

### 순서와 상태가 명확할 것
- [ ] 스크립트는 `defer`로 불러와서 DOM이 준비된 뒤 실행됨
- [ ] 초기화 순서를 `main.js` 한 곳에서 관리
  ```js
  // main.js — 실행 순서가 한눈에 보이도록
  initMobileMenu();
  initCounter();
  ```
- [ ] 각 init 함수는 대상 요소가 없으면 조용히 끝남 (`if (!el) return;`)
- [ ] 상태는 `aria-*` 속성 하나로 관리하고, CSS도 그 속성을 기준으로 스타일링
  ```css
  .nav-toggle[aria-expanded="true"] + .nav-menu { display: block; }
  ```
  클래스와 ARIA 상태를 따로 관리하면 둘이 어긋날 수 있습니다.

### 모바일 메뉴
- [ ] 토글 버튼은 `<button type="button" aria-expanded="false" aria-controls="nav-menu">`
- [ ] 열고 닫을 때 `aria-expanded`가 바뀜
- [ ] 버튼의 접근 가능한 이름이 상태에 맞게 바뀜 ("메뉴 열기" ↔ "메뉴 닫기")
- [ ] Esc로 닫히고, 닫힌 뒤 포커스가 토글 버튼으로 돌아감
- [ ] 메뉴 항목을 누르면 메뉴가 닫히고 해당 섹션으로 이동
- [ ] 데스크톱 폭으로 바뀌면 메뉴 상태가 초기화됨

### 모달 (선택 작업 시)
- [ ] 네이티브 `<dialog>`와 `showModal()` 사용 (포커스 가두기와 Esc가 기본 제공)
- [ ] 열리면 모달 안 첫 요소나 제목으로 포커스 이동
- [ ] 닫히면 모달을 연 버튼으로 포커스 복귀
- [ ] `aria-labelledby`로 모달 제목 연결

### 아코디언 (선택 작업 시)
- [ ] 네이티브 `<details>`/`<summary>` 사용

### 공통
- [ ] JS를 꺼도 모든 콘텐츠를 읽을 수 있음 (메뉴는 펼쳐진 상태로 노출)
- [ ] 화면에 보이는 변화가 스크린 리더에도 전달됨
- [ ] 키보드와 마우스 모두 같은 결과

## 5. 움직임

- [ ] 부드러운 스크롤과 애니메이션은 `prefers-reduced-motion`을 존중
  ```css
  @media (prefers-reduced-motion: no-preference) {
    html { scroll-behavior: smooth; }
  }
  ```
- [ ] 숫자 카운터 애니메이션은 움직임 줄이기 설정에서 최종값을 바로 표시
- [ ] 자동 재생 슬라이드를 쓰지 않음. 쓴다면 정지 버튼 제공
- [ ] 1초에 3번 이상 깜빡이는 효과 없음

## 6. 반응형과 확대

- [ ] 360px 폭에서 가로 스크롤 없음
- [ ] 브라우저 200% 확대에서 콘텐츠가 잘리거나 겹치지 않음
- [ ] 글자 크기는 `rem` 단위 (브라우저 글꼴 설정 반영)
- [ ] 터치 대상은 최소 44×44px
- [ ] 가로 모드에서도 사용 가능

## 7. 도구 검증 (이슈 #13)

| 도구 | 기준 | 결과 |
|---|---|---|
| Lighthouse 접근성 | 90점 이상 | |
| WAVE | Errors 0, Contrast Errors 0 | |
| 키보드만으로 전체 페이지 탐색 | 막힘 없음 | |
| 스크린 리더 (VoiceOver: Cmd+F5 / NVDA) | 제목 목록, 랜드마크 이동, 메뉴 상태 읽기 | |

> 자동 도구는 문제의 일부만 찾습니다. 키보드와 스크린 리더 수동 테스트를 반드시 함께 합니다.
