#!/bin/sh
# 제출용 폴더와 ZIP을 만든다.
#   animal-center/
#   ├── index.html 외 빌드 결과   ← 더블클릭으로 실행 (file://)
#   ├── README.md
#   └── source/                   ← 개발용 소스 (npm install && npm run dev)
# 사용: npm run package  (빌드 후 이 스크립트를 실행한다)
set -eu

ROOT=$(cd "$(dirname "$0")/.." && pwd)
OUT="$ROOT/submission"
NAME="animal-center"
PKG="$OUT/$NAME"

if [ ! -f "$ROOT/dist/index.html" ]; then
  echo "dist/index.html이 없습니다. npm run build를 먼저 실행하세요." >&2
  exit 1
fi

rm -rf "$OUT"
mkdir -p "$PKG/source"

# 실행 파일: 빌드 결과 전체
cp -R "$ROOT/dist/." "$PKG/"

# 문서
cp "$ROOT/README.md" "$PKG/"

# 소스: 개발 환경을 다시 만들 수 있는 파일만 (node_modules, dist, .git 제외)
cp -R "$ROOT/src" "$ROOT/docs" "$PKG/source/"
cp "$ROOT/index.html" "$ROOT/vite.config.js" "$ROOT/package.json" "$ROOT/package-lock.json" "$PKG/source/"
mkdir -p "$PKG/source/scripts"
cp "$ROOT/scripts/package.sh" "$PKG/source/scripts/"

# macOS 메타데이터 파일 제거
find "$PKG" -name ".DS_Store" -delete

(cd "$OUT" && zip -qr -X "$NAME.zip" "$NAME")
echo "생성 완료: submission/$NAME.zip"
