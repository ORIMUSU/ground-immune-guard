# Roadmap

This document describes direction. It is **not a commitment**, a schedule, or a feature list for a future release. Items may be delayed, changed, or dropped. Dates in other documents (for example a Product Hunt launch) are separate operational plans and do not become promises here.

GROUND IMMUNE Guard is a **Technical Preview**. It ships a **simulated Broker**. It is for local evaluation. It is not production-qualified.

## In this repository

Facts about what you can read and run today (or, for preview.3, once that package is published):

- Documentation, examples, packaging scripts, and community files for GROUND IMMUNE Guard.
- A three-valued verdict: ADMITTED, DENIED, UNRESOLVED. Missing evidence is not treated as allow.
- Default SHADOW (observe only).
- Optional LIMITED_BLOCKING with a local simulated Broker.
- Preview Broker binding that rejects a changed operation after admission (`TARGET_CHANGED`) in LIMITED_BLOCKING.
- GitHub metadata mapping without a real GitHub write transport.
- An Apache-2.0 license for the materials in this repository.
- Historical checksums and validation records for earlier preview tarballs.

## Not in this repository

- Full IMMUNE, including its Recovery, Governance and Adaptive layers.
- A dedicated Broker host, credential provisioning, or a real GitHub write executor.
- Physical or OS-level credential isolation, cryptographic signing of releases, or an npm registry package.
- The original TypeScript sources used to produce the installable `dist/` build.
- Production certification, a support SLA, or a promise of API stability.

## Directions under consideration

These are topics the maintainer wants to explore. None of them is scheduled:

- A new preview tarball (0.1.0-preview.3) that carries this repository's Apache-2.0 documentation and license while keeping the reviewed runtime unless a later change is explicitly described.
- Publishing more of the source that produces `dist/`, if that can be done without pulling unpublished Full IMMUNE code into this tree.
- Additional local examples, including the post-admission substitution example already in `examples/`.
- Signing or attestation for release artifacts.
- An npm registry publication decision (not part of this preview as it stands).
- Independent qualification of a dedicated Broker deployment — a separate body of work, not a switch in this package.

If a direction above is later accepted, it will appear as a concrete change in the changelog and a new immutable preview version. Until then, please treat this file as context for discussion, not as a plan you can depend on.
