# Independent version identities

Product/package: **0.1.0-preview.2** is the last frozen, published runtime (GitHub prerelease, 2026-11-10; repacked from 0.1.0-preview.1 with a CLI exit-code change and refreshed docs/metadata). A **0.1.0-preview.3** package is planned so that the installable tarball can carry this repository's Apache-2.0 documentation and license; its SHA-256 is not yet assigned. A Technical Preview is not a stable compatibility guarantee. Pin the exact version.

Guard evidence protocol: **guard-v0.1**. Product changes do not authorize rewriting existing evidence. Unsupported formats fail unresolved; never reset history to accept them.

Advanced IMMUNE evidence/schema identities remain owned by the separate protocols of Full IMMUNE, the broader unpublished system, which is not in this repository. Guard neither redefines their versions nor automatically migrates their journals. The legacy compatibility adapter maps operation fields only. Follow that module's explicit compatibility rules before importing advanced evidence.

The package keeps `"private": true` so it cannot be published to the npm registry by accident. 0.1.0-preview.2 used `license: "SEE LICENSE IN LICENSE"` with PolyForm Free Trial 1.0.0 in that tarball. 0.1.0-preview.1 still carries the earlier `UNLICENSED` placeholder in its package metadata; the license text shipped with that release governs that artifact historically. A new preview that changes the license should set the package `license` field to `Apache-2.0` and ship the Apache-2.0 text as `LICENSE`. Any licensing or contact change produces a new immutable preview version.
