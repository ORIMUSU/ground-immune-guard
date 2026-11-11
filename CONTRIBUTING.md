# Contributing

Thank you for taking the time to look at this Technical Preview. This is a small project, and careful, well-scoped feedback is more useful than volume.

Please follow the [Code of Conduct](CODE_OF_CONDUCT.md).

## Start with a conversation

1. **Security issues** — report privately, following [SECURITY.md](SECURITY.md). Do not file a public issue, pull request, or discussion with vulnerability details, tokens, or credentials.
2. **Questions and first-try feedback** — open a GitHub Discussion (Q&A or Feedback) once Discussions are enabled. If Discussions are not yet available, use a Feedback issue and never paste secrets.
3. **Bugs and feature ideas** — search existing issues first, then use the issue templates.
4. **Pull requests** — please open an issue or discussion first, except for typographical fixes and broken links. Unexpected PRs that change behavior are hard to review while the installable package is a frozen preview build.

## What you can contribute today

This repository contains documentation, examples, packaging scripts and release records. The installable package is a readable ESM build in `dist/` inside the release tarball. The original TypeScript sources used to produce that build are not in this repository.

Helpful contributions in this tree include:

- documentation clarifications and typo fixes
- additional local examples that use the public API only (no real credentials, no network writes)
- packaging or validation-script fixes that do not change frozen release bytes unless a new preview version is explicitly planned
- issue reports from running the published preview (include the package version and SHA-256)

Changes to the unpublished original sources, to Full IMMUNE, or to a already-published tarball's bytes are out of scope for a pull request here.

## Developer Certificate of Origin (DCO)

This project uses the [Developer Certificate of Origin](https://developercertificate.org/) instead of a Contributor License Agreement.

A CLA would add paperwork and a separate legal process before a first-time contributor could help. Apache-2.0 already treats intentional contributions as being offered under the same license (see section 5 of LICENSE), and the DCO adds a clear, per-commit attestation of provenance. For a security-related preview, knowing that a change was made by someone who has the right to submit it matters; a one-line sign-off is enough to record that without a CLA.

Every commit in a pull request must include:

```
Signed-off-by: Your Name <your.email@example.com>
```

Use the email associated with your GitHub account (a `users.noreply.github.com` address is fine). You can add the line automatically:

```sh
git commit -s -m "Your message"
```

By signing off, you agree to the Developer Certificate of Origin, version 1.1, reproduced here for convenience:

```
Developer's Certificate of Origin 1.1

By making a contribution to this project, I certify that:

(a) The contribution was created in whole or in part by me and I
    have the right to submit it under the open source license
    indicated in the file; or

(b) The contribution is based upon previous work that, to the best
    of my knowledge, is covered under an appropriate open source
    license and I have the right under that license to submit that
    work with modifications, whether created in whole or in part
    by me, under the same open source license (unless I am
    permitted to submit under a different license), as indicated
    in the file; or

(c) The contribution was provided directly to me by some other
    person who certified (a), (b) or (c) and I have not modified
    it.

(d) I understand and agree that this project and the contribution
    are public and that a record of the contribution (including all
    personal information I submit with it, including my sign-off) is
    maintained indefinitely and may be redistributed consistent with
    this project or the open source license(s) involved.
```

## Pull request guidelines

- Keep the change small and explain why it is needed.
- Do not include credentials, tokens, private keys, personal paths, or production host names.
- Do not weaken honest limitation language (simulated Broker, not production-qualified, no physical isolation claim).
- Match the surrounding documentation style: English, plain language, no internal project nicknames.
- If you change an example, say how you ran it (Node version, operating system, package SHA-256).
- Sign off every commit (`git commit -s`).

## Local evaluation

Follow the [README](README.md) or [Quickstart](QUICKSTART.md). Use a new empty directory, Node.js 22 or later, and the published tarball. No account or credential is required.

Maintainer contact for process questions: **immune@orimusu.com**.
