# 커밋 컨벤션

## 형식

```
<type>(<scope>): <제목> #<이슈번호>

<본문: 무엇을, 왜 바꿨는지> (선택)
```

- 제목은 한국어, 50자 이내, 마침표 없이 씁니다.
- 명령형으로 씁니다. 예: "추가", "수정" (O) / "추가했음" (X)
- 이슈 번호를 반드시 붙입니다.
- 본문에는 **왜** 바꿨는지를 적습니다. 무엇을 바꿨는지는 diff로 보입니다.

## type

| type | 용도 | 예시 |
|---|---|---|
| `feat` | 새 섹션, 기능 추가 | `feat(hero): 히어로 섹션 마크업 추가 #4` |
| `fix` | 버그 수정 | `fix(header): 모바일 메뉴 닫힘 후 포커스 복귀 #11` |
| `style` | CSS 스타일 작업 (레이아웃, 반응형 포함) | `style(animals): 카드 그리드 반응형 적용 #7` |
| `a11y` | 접근성 개선 | `a11y(nav): 현재 섹션에 aria-current 적용 #13` |
| `refactor` | 동작 변화 없는 구조 개선 | `refactor(css): 섹션 간격을 토큰으로 통일 #2` |
| `perf` | 성능 개선 | `perf(images): 보호 동물 사진 WebP 변환 #12` |
| `docs` | 문서, README | `docs(readme): 이미지 출처 추가 #14` |
| `chore` | 설정, 빌드, 패키지 | `chore(vite): base 경로를 상대경로로 설정 #1` |
| `asset` | 이미지, 폰트, 아이콘 추가 | `asset(icons): 서비스 아이콘 SVG 추가 #6` |

## scope

섹션이나 영역 이름을 씁니다.

`header`, `hero`, `about`, `principles`, `services`, `animals`, `process`, `support`, `location`, `footer`, `css`, `js`, `images`, `vite`, `readme`

## 단위 원칙

- 커밋 하나에는 **변경 하나**만 담습니다. 마크업 추가와 스타일 작업은 나눕니다.
- 커밋할 때마다 페이지가 깨지지 않은 상태를 유지합니다.

## 예시

```
fix(header): 앵커 이동 시 섹션 제목이 고정 헤더에 가려지는 문제 수정 #3

sticky 헤더 높이(64px)만큼 이동 위치가 밀리지 않아 제목이 가려졌다.
섹션에 scroll-margin-top을 헤더 높이 토큰으로 지정해 해결했다.
```
