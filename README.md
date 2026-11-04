# GROUND IMMUNE Guard v0.1 — Technical Preview

**Keep write credentials away from AI agents.**

Guard evaluates an agent's operation intent before a credential-holding Broker executes it. The goal is a small authorization boundary for automation that needs to write to another system. The Agent must not own the write credential or configure its own authority.

```text
AI Agent / Automation → operation intent → Guard
                                          ├─ DENIED → STOP
                                          ├─ UNRESOLVED → STOP
                                          └─ ADMITTED → Broker → Protected System
                                                       credential holder
```

This diagram describes explicitly enabled enforcement. **SHADOW is the default**: it observes the customer's existing operation, does not block it, and never calls the Guard Broker. DENIED means outside the configured authority; UNRESOLVED means the required basis for a safe decision is missing. Neither executes through the enforcement path.

## Install and first operation

Requires externally supplied Node.js 22 or later and npm. This is an unpublished candidate; the following local tarball command works after receiving the approved bundle. It is not a registry availability claim.

```sh
npm install --offline --ignore-scripts ./ground-immune-guard-0.1.0-preview.1.tgz
./node_modules/.bin/guard init ./guard-local
./node_modules/.bin/guard doctor ./guard-local
./node_modules/.bin/guard protect ./guard-local allowed
./node_modules/.bin/guard protect ./guard-local denied
./node_modules/.bin/guard explain ./guard-local
./node_modules/.bin/guard verify ./guard-local
```

These commands use local, non-production authority and a simulated Broker; no credential or network transport is created. Follow [Quickstart](QUICKSTART.md) for JavaScript/TypeScript, a single scope and simulated execution. Follow [GitHub](GITHUB.md) for metadata mapping and the separate deployment qualification required before enforcement.

## Preview boundaries

The package includes intent evaluation, scope binding, local evidence, a local CLI and GitHub mapping. It does not include a dedicated Broker host, credential provisioning or a real GitHub write transport. The bundled package does not establish physical credential isolation. Separate later non-production cross-UID evidence is summarized in [Verification](VERIFICATION.md); it does not qualify this package for production enforcement. In-process binding is not process or OS isolation. A trusted host must own policy, providers, evidence and execution.

Read [Security Model](SECURITY-MODEL.md), [Threat Model](THREAT-MODEL.md), [Limitations](LIMITATIONS.md) and [Data Handling](PRIVACY.md). [API](API.md) is a preview freeze candidate, not a promise of permanent compatibility.

Security reports: **security@orimusu.com**; see [reporting policy](SECURITY.md). Product license/terms and public distribution approval are still pending; see [license state](LICENSE-STATE.md). Do not redistribute this unpublished candidate.

**Request a Shadow Pilot** — email **immune@orimusu.com**. Start with one narrowly scoped operation and measure setup friction, decisions and latency before considering enforcement.

## Candidate distribution

This standalone repository candidate contains reviewed documentation, examples and the frozen installable tarball. It has no upstream repository history, Core production source, private host evidence or deployment credentials. The private staging repository is `ORIMUSU/ground-immune-guard`; public visibility and distribution remain human-gated. This is a package-and-documentation distribution candidate, not a complete source distribution.

See [Verification](VERIFICATION.md), [Architecture](ARCHITECTURE.md), [Publication gate](PUBLICATION-GATE.md), `release-manifest.json`, `SHA256SUMS` and `sbom.json`. The tarball retains its frozen documentation; this repository adds the later qualification context without changing those package bytes.

[Advanced capabilities](ADVANCED.md) are separate from the default Guard preview.
