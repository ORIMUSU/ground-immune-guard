#!/usr/bin/env bash
# Build ground-immune-guard-0.1.0-preview.2.tgz from the frozen preview.1 tarball.
#
# preview.2 is NOT a fresh esbuild build from the original source. It is the
# byte-identical preview.1 runtime (dist/) with exactly the reviewed patches in
# packaging/preview.2/*.patch applied, plus refreshed documentation, LICENSE and
# package metadata from this repository. Offline; no network; no install scripts.
#
# The base tarball is not stored in this repository. Download it from the
# v0.1.0-preview.1 GitHub release first (the SHA-256 below is checked):
#   Obtain ground-immune-guard-0.1.0-preview.1.tgz from the historical preview.1 release
#   (SHA-256 709691519c8cf91743188eaa2a65b0978c36df3fc02e7e8d4a961603cf9fc441) and run:
#   BASE=./ground-immune-guard-0.1.0-preview.1.tgz packaging/build-preview.sh [outdir]
# The published preview.2 bytes are reproduced from tag v0.1.0-preview.2;
# later documentation changes on main change the repacked tarball.
set -euo pipefail
CALLER=$(pwd)
abspath(){ case $1 in /*) printf %s "$1";; *) printf %s "$CALLER/$1";; esac; }
cd "$(dirname "$0")/.."
REPO=$(pwd)
if [ -n "${BASE:-}" ]; then BASE=$(abspath "$BASE"); else BASE="$REPO/ground-immune-guard-0.1.0-preview.1.tgz"; fi
BASE_SHA=709691519c8cf91743188eaa2a65b0978c36df3fc02e7e8d4a961603cf9fc441
VERSION=0.1.0-preview.2
if [ -n "${1:-}" ]; then OUTDIR=$(abspath "$1"); else OUTDIR="$REPO"; fi; mkdir -p "$OUTDIR"
[ -f "$BASE" ] || { echo "base tarball not found: $BASE (see the header of this script)" >&2; exit 2; }
echo "$BASE_SHA  $BASE" | sha256sum -c - >/dev/null
W=$(mktemp -d); trap 'rm -rf "$W"' EXIT
tar xzf "$BASE" -C "$W"
P="$W/package"
# 1. Runtime patches (reviewed, minimal).
for p in packaging/preview.2/*.patch; do patch -s -p1 -d "$P" --no-backup-if-mismatch < "$p"; done
# 2. Replace embedded docs with the repository docs (drop stale/internal drafts).
find "$P" -maxdepth 1 -name '*.md' -delete
cp README.md QUICKSTART.md CHANGELOG.md SECURITY.md LICENSE THIRD-PARTY-NOTICES.txt sbom.json demo.mjs "$P/"
rm -rf "$P/docs" "$P/examples"; cp -r docs examples "$P/"
# README images (docs/assets/) are for the GitHub page only; keep them out of the tarball.
rm -rf "$P/docs/assets"
# 3. Package metadata: version and license pointer (license choice unchanged).
node -e '
const fs=require("fs"),f=process.argv[1],v=process.argv[2];
const p=JSON.parse(fs.readFileSync(f,"utf8"));
p.version=v; p.license="SEE LICENSE IN LICENSE";
p.files=["dist","*.md","LICENSE","docs","sbom.json","THIRD-PARTY-NOTICES.txt","examples","demo.mjs"];
fs.writeFileSync(f, JSON.stringify(p,null,2)+"\n");' "$P/package.json" "$VERSION"
# 4. Deterministic pack (npm normalises mtimes/ownership).
( cd "$P" && npm pack --ignore-scripts --pack-destination "$OUTDIR" >/dev/null )
mv "$OUTDIR/ground-immune-guard-$VERSION.tgz" "$OUTDIR/ground-immune-guard-$VERSION.tgz" 2>/dev/null || true
ls "$OUTDIR"/*immune-guard-$VERSION.tgz
