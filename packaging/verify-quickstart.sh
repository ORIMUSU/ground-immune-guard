#!/usr/bin/env bash
# Offline consumer check of the README "Try it" sequence against a local tarball.
# Usage: packaging/verify-quickstart.sh <tarball> [node-bin-dir]
# Fresh temp dir, empty npm cache, npm init -y, offline install, then asserts
# decisions and exit codes. Also checks the install under a parent directory
# that already has node_modules/, and into an existing project (package.json +
# node_modules/ already present). Exit 0 = all checks passed.
set -u
TGZ=$(readlink -f "$1"); NB=${2:-$(dirname "$(command -v node)")}
export PATH="$NB:/usr/bin:/bin"
fail=0
check(){ local want=$1 field=$2; shift 2; local out rc; out=$("$@" 2>&1); rc=$?
  if [ "$rc" != "$want" ] || ! grep -q -- "$field" <<<"$out"; then echo "FAIL rc=$rc want=$want ($field): $*"; echo "$out" | head -3; fail=1; else echo "ok   rc=$rc $field"; fi; }
for layout in fresh parent-node_modules existing-project; do
  T=$(mktemp -d); export npm_config_cache="$T/cache" npm_config_userconfig="$T/npmrc" npm_config_update_notifier=false npm_config_fund=false npm_config_audit=false; touch "$T/npmrc"
  case $layout in
    fresh) W="$T/guard-try";;
    parent-node_modules) mkdir -p "$T/p/node_modules"; W="$T/p/guard-try";;
    existing-project) W="$T/proj"; mkdir -p "$W/node_modules/.bin";;
  esac
  mkdir -p "$W" && cd "$W" && cp "$TGZ" .
  [ $layout = existing-project ] && echo '{"name":"proj","version":"1.0.0","private":true}' > package.json
  echo "== node $(node --version) npm $(npm --version) layout=$layout"
  { [ $layout = existing-project ] || npm init -y >/dev/null; } && npm install --offline --ignore-scripts "./$(basename "$TGZ")" >/dev/null 2>&1 || { echo "FAIL install"; fail=1; continue; }
  G=./node_modules/.bin/guard
  check 0 '"mode":"LIMITED_BLOCKING"' $G init ./blocking --limited
  check 0 '"realCredentialReady":false' $G doctor ./blocking
  check 0 '"decision":"ADMITTED","reason":"AUTHORIZED","execution":{"outcome":"SUCCEEDED"}' $G protect ./blocking allowed
  check 4 '"reason":"DECISION_REUSED","execution":{"outcome":"NOT_EXECUTED"}' $G protect ./blocking allowed
  check 3 '"decision":"DENIED","reason":"OUT_OF_SCOPE","execution":{"outcome":"NOT_EXECUTED"}' $G protect ./blocking denied
  check 4 '"decision":"UNRESOLVED","reason":"EVIDENCE_MISSING","execution":{"outcome":"NOT_EXECUTED"}' $G protect ./blocking unresolved
  check 0 '"status":"UNRESOLVED"' $G status ./blocking
  check 0 '"count":5' $G verify ./blocking
  check 0 '"mode":"SHADOW"' $G init ./shadow
  check 0 '"outcome":"OBSERVED"},"decisionIdentity":"[0-9a-f]*","mode":"SHADOW"},"simulatedExecutions":0' $G protect ./shadow allowed
  check 0 '"decision":"DENIED","reason":"OUT_OF_SCOPE","execution":{"outcome":"OBSERVED"}' $G protect ./shadow denied
  check 0 '"decision":"UNRESOLVED","reason":"EVIDENCE_MISSING","execution":{"outcome":"OBSERVED"}' $G protect ./shadow unresolved
  check 3 '"decision":"DENIED"' $G protect ./shadow denied --fail-on-verdict
  check 4 '"decision":"UNRESOLVED"' $G protect ./shadow unresolved --fail-on-verdict
  check 0 '"decision":"ADMITTED"' $G protect ./shadow allowed --fail-on-verdict
  check 3 '"decision":"DENIED"' $G protect ./blocking denied --fail-on-verdict
  check 2 'UNRESOLVED: local configuration' $G protect ./does-not-exist denied --fail-on-verdict
  check 2 'UNRESOLVED: local configuration' $G protect ./does-not-exist allowed
  check 0 '"simulatedExecutions":1,"credential":"NONE"' node node_modules/@ground/immune-guard/examples/first-operation.mjs
  check 0 '"brokerCalls":0' node node_modules/@ground/immune-guard/examples/github-shadow.mjs
  [ -e "$T/p/node_modules/@ground" ] && { echo "FAIL installed into parent node_modules"; fail=1; }
done
[ $fail = 0 ] && echo "ALL CHECKS PASSED" || echo "CHECKS FAILED"; exit $fail
