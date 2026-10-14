#!/bin/sh
# 제출용 ZIP을 만든다. 빌드(npm run build) 후 실행한다.
#
# 소스 포함 (기본) → submission/animal-center.zip
#   animal-center/
#   ├── index.html 외 빌드 결과   ← 더블클릭으로 실행 (file://)
#   ├── README.md
#   └── source/                   ← 개발용 소스 (npm install && npm run dev)
#
# 실행 전용 (--run-only) → submission/animal-center-run.zip
#   .js 첨부를 막는 전송 경로를 위해 source/를 뺀다.
#   실행에 필요한 JS·CSS는 빌드된 index.html 안에 들어 있다.
#
# 사용: npm run package / npm run package:run
set -eu

MODE=full
if [ "${1:-}" = "--run-only" ]; then
  MODE=run
fi

ROOT=$(cd "$(dirname "$0")/.." && pwd)
OUT="$ROOT/submission"
NAME="animal-center"
if [ "$MODE" = run ]; then
  ZIP="$NAME-run.zip"
else
  ZIP="$NAME.zip"
fi

if [ ! -f "$ROOT/dist/index.html" ]; then
  echo "dist/index.html이 없습니다. npm run build를 먼저 실행하세요." >&2
  exit 1
fi

# submission/에 있는 다른 파일(이름을 바꾼 이전 ZIP 등)은 건드리지 않고,
# 이 스크립트가 만드는 작업 폴더와 ZIP만 다시 만든다.
mkdir -p "$OUT"
STAGE=$(mktemp -d "$OUT/.stage.XXXXXX")
trap 'rm -rf "$STAGE"' EXIT
PKG="$STAGE/$NAME"
mkdir -p "$PKG"

# 실행 파일: 빌드 결과 전체
cp -R "$ROOT/dist/." "$PKG/"

# 문서와 라이선스 (폰트·아이콘을 배포하므로 라이선스 문서를 함께 둔다. OFL 1.1 요구 사항)
cp "$ROOT/README.md" "$PKG/"
mkdir -p "$PKG/licenses"
cp "$ROOT/src/assets/fonts/Pretendard-LICENSE.txt" "$ROOT/src/assets/icons/Lucide-LICENSE.txt" "$PKG/licenses/"

# 소스: 개발 환경을 다시 만들 수 있는 파일만 (node_modules, dist, .git 제외)
if [ "$MODE" = full ]; then
  mkdir -p "$PKG/source/scripts"
  cp -R "$ROOT/src" "$ROOT/docs" "$PKG/source/"
  cp "$ROOT/index.html" "$ROOT/vite.config.js" "$ROOT/package.json" "$ROOT/package-lock.json" "$PKG/source/"
  cp "$ROOT/scripts/package.sh" "$PKG/source/scripts/"
fi

# macOS 메타데이터 파일 제거
find "$PKG" -name ".DS_Store" -delete

rm -f "$OUT/$ZIP"
(cd "$STAGE" && zip -qr -X "$OUT/$ZIP" "$NAME")
echo "생성 완료: submission/$ZIP"
