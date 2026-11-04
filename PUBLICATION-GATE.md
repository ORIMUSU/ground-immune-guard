# Human Publication Gate — GITHUB RELEASE REQUIRED

The repository `ORIMUSU/ground-immune-guard` is now public. No GitHub Release, npm publication or Product Hunt launch has occurred yet. GROUND Core production remains separately blocked.

Resolved Technical Preview decisions:

- Repository: **PUBLIC** — `ORIMUSU/ground-immune-guard`.
- Security reporting: **RESOLVED** — monitored inbound contact `security@orimusu.com`.
- Shadow Pilot CTA: **RESOLVED** — monitored inbound contact `immune@orimusu.com`.
- License: **RESOLVED** — PolyForm Free Trial License 1.0.0; see LICENSE.md.
- Distribution: **RESOLVED** — public GitHub repository plus GitHub Release containing the frozen tarball. No npm registry publication for this preview.
- Signing: **RESOLVED FOR PREVIEW** — SHA-256 checksums plus SBOM. The release must explicitly state that it is not cryptographically signed or attested.
- Qualification route: **RESOLVED FOR TECHNICAL PREVIEW / SHADOW ONLY** — this does not qualify production enforcement, a dedicated Broker host, or GROUND Core production.

Remaining release gate:

- Create the GitHub prerelease `v0.1.0-preview.1` from the exact public repository HEAD after this documentation update.
- Attach the frozen tarball whose SHA-256 is `709691519c8cf91743188eaa2a65b0978c36df3fc02e7e8d4a961603cf9fc441`.
- Verify the published release notes, artifact digest, manifest and checksums from the public repository.
- Product Hunt publication remains a separate action after GitHub Release verification.

Any package-byte change requires fresh artifact validation. Any public-text change requires refreshed integrity/exposure review and checksums. This repository contains no automatic publishing workflow.
