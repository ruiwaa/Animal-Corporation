# Stitch 프롬프트

사용 방법
1. 아래 **프롬프트 1 (데스크톱)**을 Stitch에 붙여넣고 Web 모드로 생성합니다.
2. 같은 프로젝트에서 **프롬프트 2 (모바일)**로 모바일 화면을 만듭니다.
3. 마음에 들지 않는 부분은 **수정용 프롬프트**로 고칩니다.
4. 결과는 **스크린샷만** 저장합니다. 내보낸 코드는 쓰지 않습니다. (CDN 사용, 비시맨틱 마크업 때문)

영어 프롬프트가 지시를 더 정확하게 따르는 편이라 지시문은 영어로, 화면에 들어갈 글은 한국어로 썼습니다.

---

## 프롬프트 1: 데스크톱

```
Design a single-page landing page (desktop, 1280px wide) for a fictional Korean animal shelter called "숲결 동물보호센터" (Sumgyeol Animal Shelter). The name means "texture of the forest". Mood: calm, warm, trustworthy, clean. Minimal and airy, not cute or childish.

STYLE RULES
- Flat design. No shadows, no gradients. Separate sections with alternating background colors and generous whitespace.
- Font: Pretendard (or a clean Korean sans-serif). Bold headings, regular body.
- Rounded corners: 16px for cards and images, fully rounded pill buttons.
- Max content width 1152px, centered. 12-column grid.
- All Korean text, no English UI text.

COLORS (use exactly these)
- Page background: #FAF8F3
- Card/surface background: #FFFFFF
- Soft green section background: #E8F1EC
- Soft amber section background: #FBEFD9
- Main text: #1F2A24
- Secondary text: #4A5750
- Primary (forest green) buttons and links: #2F6B4F with white text
- Secondary (sunlight amber) button: #E8A33D with dark text #1F2A24
- Small section labels above headings: #9A5B0F
- Never put green text on amber, never white text on amber. Use amber only for the donation button and the "함께하는 방법" section.

SECTIONS (top to bottom)
1. Sticky header, 64px tall, background #FAF8F3. Left: simple logo (a leaf + paw mark in green, then "숲결 동물보호센터"). Center: nav links "소개 · 서비스 · 보호동물 · 입양절차 · 함께하기". Right: green pill button "입양 문의".
2. Hero (background #FAF8F3). Left 5 columns: small label "안락사 없는 보호센터", large heading "다시 가족을 만날 때까지, 숲결이 곁에 있을게요", one line of body text, two buttons: green "입양 문의하기" and amber "후원하기". Right 7 columns: large rounded photo of a dog resting in a sunny green park.
3. About (background #FFFFFF). Left: heading "잠시 머무는 쉼터, 새로운 시작" and a short paragraph. Right: 2x2 grid of statistics, big green numbers with small labels: "1,240 누적 구조", "980 입양 완료", "86 현재 보호 중", "320 활동 봉사자".
4. Principles (background #E8F1EC). Heading "운영 원칙". Three columns, each with a simple line icon, title and one sentence: "안락사 없는 보호", "책임 입양", "투명한 운영".
5. Services (background #FAF8F3). Heading "제공 서비스". Five white cards in a 3-column grid (3 + 2, left aligned), each with a green line icon, title and one sentence: "입소 상담", "입양", "동물 구조", "실종동물 찾기", "임시 돌봄".
6. Animals (background #FFFFFF). Label "새 가족을 기다려요", heading "보호 중인 아이들". Six cards in a 3-column grid. Each card: square rounded photo, name as title, "종 · 나이 · 성별" in secondary text, one-line description, small soft-green badges "중성화 완료" "예방접종 완료". Animals: 콩이 (믹스견, 2살 수컷), 나비 (코리안숏헤어, 4살 암컷), 보리 (푸들, 7살 수컷), 솜이 (토끼, 1살 암컷), 두부 (진돗개 믹스, 3살 암컷), 모카 (페르시안, 5살 수컷).
7. Adoption process (background #E8F1EC). Heading "입양 절차". Five horizontal steps connected by a thin line, each with a numbered green circle, title and short text: 입양 신청, 상담, 만남, 입양 계약, 사후 관리.
8. Ways to help (background #FBEFD9). Heading "함께하는 방법". Three columns: "정기 후원", "봉사 활동", "물품 후원", each with an icon and one sentence. One amber button "후원하기" below.
9. Location (background #FAF8F3). Left 5 columns: heading "오시는 길", address, opening hours "화–일 10:00–18:00 (월요일 휴무)", phone, email. Right 7 columns: a simple rounded map illustration.
10. Footer (background #E8F1EC): logo, contact info, copyright.
```

---

## 프롬프트 2: 모바일

```
Create the mobile version (360px wide) of the same page, keeping exactly the same colors, fonts, content and section order.

MOBILE LAYOUT
- Header: logo on the left, hamburger menu icon button on the right. No nav links visible.
- Hero: photo on top (4:3 ratio), then label, heading, body text, and the two buttons stacked full width.
- About: paragraph first, then statistics in a 2x2 grid.
- Principles, services, animals, ways to help: single column cards.
- Adoption process: vertical steps with numbered circles connected by a vertical line on the left.
- Location: info first, then map.
- Side padding 20px. Buttons at least 48px tall. Body text at least 16px.
```

---

## 수정용 프롬프트 (필요할 때)

```
Make the layout cleaner: reduce decorative elements, increase spacing between sections, and keep only one accent color per section.
```

```
Show the same page in dark mode with these colors: background #121814, cards #1A231E, soft section #1F3329, text #E6ECE8, secondary text #A9B7AF, primary green #7CC9A0 with dark text #0F1A14 on buttons, amber #F2B759 with dark text #1A1206 on buttons.
```

```
The hero feels too crowded. Make the heading larger, the body text shorter, and give the photo more space.
```

---

## Stitch 결과를 가져올 때

- 데스크톱 전체 스크린샷 1장, 모바일 전체 스크린샷 1장
- (선택) 다크 모드 스크린샷
- 마음에 드는 점, 바꾸고 싶은 점을 한두 줄로 함께 적어주세요.

Stitch가 프롬프트와 다른 색을 쓰는 경우가 있습니다. 색은 스크린샷이 아니라 `02-design-guide.md`의 토큰을 기준으로 구현합니다.
