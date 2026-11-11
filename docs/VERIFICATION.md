# Verification scope

The frozen 0.1.0-preview.1 package was built from a source checkpoint in a private development repository (not included here). Rebuilding that checkpoint twice reproduces the exact package SHA-256 `709691519c8cf91743188eaa2a65b0978c36df3fc02e7e8d4a961603cf9fc441`.

Later Broker evidence and the tested Broker runtime source are recorded in the same private repository. They are separate from the bundled Guard package. The recorded shared-host, non-production run used distinct OS users, a Broker-only dummy credential, authenticated local IPC and real local file mutations. Credential-file access from Admission was denied; normal DENIED/UNRESOLVED paths sent no Broker requests. Restart/replay checks and a bounded application canary scan passed in that record. This summary is based on a review of those retained records; physical qualification was not rerun for it.

This evidence does not demonstrate a real GitHub App credential-gated write, dedicated host qualification, whole-OS leak absence, immediate revocation of every unused unexpired artifact, or protection from administrator/root compromise. Formal qualification remains partial. Private host records are intentionally not included in this distribution.

Validation records are kept per release: `validation-preview.1.json` (0.1.0-preview.1: reproducible build, offline and network-denied consumers, exposure scan) and `validation-preview.2.json` (0.1.0-preview.2: consumer quickstart on Node 22 and 24). For preview.1, reproducibility uses two clean source archives with the same installed locked build tools, not independently provisioned machines. The SBOM is the project's custom inventory format, not an SPDX/CycloneDX claim or vulnerability assessment. Secret screening is pattern-based with positive canaries and an allowlisted export; it cannot prove the absence of every secret.

A forthcoming 0.1.0-preview.3 package, if published, should add its own validation record. This file will then name that record. The original TypeScript sources used to produce `dist/` are not in this repository.
