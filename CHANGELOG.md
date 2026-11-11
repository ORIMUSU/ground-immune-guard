# Changelog

## Unreleased — 0.1.0-preview.3 (planned)

This repository is being prepared as a clean, Apache-2.0 public tree. The installable preview.3 tarball is **not produced in this tree**; it is a separate packaging task. Until preview.3 exists, do not treat the commands in the README as a published download.

Intended repository changes (this tree):

- License for repository materials: Apache License 2.0 (see LICENSE and NOTICE).
- Community files: CONTRIBUTING.md (Discussions/Issues first, DCO), CODE_OF_CONDUCT.md, SECURITY.md, issue and pull-request templates, ROADMAP.md.
- Documentation: "What this is / is not", Apache-2.0 wording, and a local example of post-admission substitution (`examples/tamper-after-approval.mjs`) that exercises preview Broker binding.
- History: a new public git history. Author and committer use a GitHub noreply address.

The last frozen runtime remains 0.1.0-preview.2 (SHA-256 `7b8b6bb7a2409e12cf2d7396089e059f728bd4b94a9dd5186aafef4f1d8bb99d`). That tarball still embeds the PolyForm Free Trial 1.0.0 text. preview.3 should record whether its `dist/` bytes are identical to preview.2 except for documented packaging changes.

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
