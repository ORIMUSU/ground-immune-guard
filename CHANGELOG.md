# Changelog

## 0.1.0-preview.4 — 2026-11-12 (Technical Preview, GitHub prerelease)

Tarball `ground-immune-guard-0.1.0-preview.4.tgz`, SHA-256 `6bdc758c1059b2e530393e9f9a61706bbb097410ab88afb80adde55668e88168`. Apache-2.0. **Anyone using Guard on Windows should upgrade from preview.3.**

- Windows: fix `guard protect` returning `UNRESOLVED` / `GUARD_UNAVAILABLE` (exit 4) for every operation. After the atomic rename of an evidence record, the file evidence store flushed the evidence directory by opening it and calling `fsync`. Windows cannot flush a directory handle (`EPERM`, or `EISDIR` on open), so every `protect` against a file store failed after the ADMISSION record had already been written; the simulated Broker never ran. On `win32` the directory flush is now skipped when it fails with `EISDIR`/`EPERM`/`EACCES`/`EINVAL`; the rename remains the commit point. Other platforms are unchanged and still fail closed on any directory-flush error. Evidence written by preview.3 on Windows still verifies but holds ADMISSION records without DISPATCH/RESULT; start a fresh `guard init` directory.
- CLI: `GUARD_DEBUG=1` writes the underlying evidence-store or CLI error (`code`, `syscall`, redacted message) to stderr as a `guard debug:` line. Paths are redacted. stdout, verdicts and exit codes are unchanged; without the variable nothing extra is printed.
- Regression test: `packaging/test-windows-evidence.mjs` (in the tarball) simulates the Windows directory-handle errors, checks the README sequence (exit codes 0/4/3/4, `verify` `count: 5`, SHADOW `OBSERVED`) and checks that non-Windows platforms still fail closed.
- Verified with these exact tarball bytes on Linux x86_64 (Node 22.23.4 and 24.22.1), Windows 11 (Node 24.14.0) and macOS 26.6.2 on Apple Silicon (Node 24.15.0): SHA-256 match, `guard --version` 0.1.0-preview.4, README CLI exits 0/4/3/4, `verify` count 5, SHADOW `OBSERVED`, regression test all checks passed, both examples matched. See `validation-preview.4.json`.
- Public API, decisions, other platforms' behaviour and examples are otherwise unchanged from preview.3.
- Known cosmetic leftovers inside the tarball (not runtime): the bundled terminal GIF and architecture badge still show preview.3, and the bundled `CHANGELOG.md` / `RELEASE-NOTES.md` / `README.md` were frozen before publication and describe this version as a local candidate. The repository copies of the GIF and diagram show preview.4.

## 0.1.0-preview.3 — 2026-11-11 (Technical Preview, GitHub prerelease)

Tarball `ground-immune-guard-0.1.0-preview.3.tgz`, SHA-256 `8b8e0ce3a546f623be88e69d857402d4c7cc2e68596b51cffd58e021c975067d`. **Known issue:** on Windows every `guard protect` returns `UNRESOLVED` / `GUARD_UNAVAILABLE`; use 0.1.0-preview.4.

- License: Apache-2.0 (copyright ORIMUSU Inc.) with NOTICE. preview.1 and preview.2 artifacts stay under the PolyForm Free Trial terms they shipped with.
- The tarball includes the TypeScript source of the Guard public surface and the admission kernel; `npm run build` reproduces `dist/`. `dist/` is not byte-identical to preview.2 (comment and license-banner changes); the public API and example/quickstart behaviour are unchanged.
- New example `examples/tamper-after-approval.mjs`: a post-admission substitution yields `UNRESOLVED` / `TARGET_CHANGED` and does not execute (LIMITED_BLOCKING only).
- Breaking, kernel evidence protocol: the compatibility token changed; envelopes created with the preview.2 token return `UNSUPPORTED_PROTOCOL`. Guard `guard-v0.1` journals are unaffected.
- Repository: new public git history (author and committer use a GitHub noreply address), community files, Apache-2.0 docs.

## 0.1.0-preview.2 — 2026-11-10 (Technical Preview, GitHub prerelease)

Repacked from the frozen 0.1.0-preview.1 tarball; see `packaging/build-preview.sh`. Decision, evidence and execution logic are byte-identical to preview.1, except for the CLI changes below.

- CLI: in LIMITED_BLOCKING, `guard protect` exits 0 ADMITTED, 3 DENIED, 4 UNRESOLVED (2 usage/configuration/evidence error); `guard --version`. Previously every evaluated decision exited 0.
- CLI: SHADOW (observe-only) keeps exit 0 for every verdict by default so it can be added to CI without failing jobs; `--fail-on-verdict` opts in to 3/4. Errors exit 2 in all modes.
- Package metadata: `license` is `SEE LICENSE IN LICENSE`; the full PolyForm Free Trial 1.0.0 text shipped as `LICENSE` in that tarball.
- Embedded documentation replaced with the then-current repository docs; stale pre-release drafts (`WEBSITE.md`, `LAUNCH-DRAFT.md`) and "publication blocked / license UNDECIDED" text removed from the package.
- Docs: install sequence (new directory + `npm init -y`), real output in EXPLAIN, `status` semantics, license summary; secondary docs moved under `docs/`.

## 0.1.0-preview.1 — 2026-11-04 (Technical Preview, GitHub prerelease)

- Small Guard surface with exact operation/scope admission and separate ADMITTED, DENIED and UNRESOLVED decisions.
- Default non-blocking Shadow observation; explicit local Limited Blocking and one-use Broker binding.
- GitHub metadata adapter; no built-in GitHub credential or write transport.
- Durable local evidence, slim explanation, replay and restart duplicate protection in tested conditions.
- Local development CLI, JS/TS examples and offline consumer validation.
- Advanced Recovery/Governance/Adaptive stay outside default Guard runtime.

Known limitations and physical qualification remain mandatory. No real credential isolation, malicious-attack protection or production readiness is claimed by this version. This release was licensed under PolyForm Free Trial 1.0.0.

## Publication preparation — 2026-11-04

- Standalone documentation and tarball repository, minimal architecture, and an explicit human approval step before publication.
- Added separately scoped later Broker evidence summary. Frozen package bytes and runtime unchanged.
