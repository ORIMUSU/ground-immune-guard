# Public API (preview, not a stability promise)

All entries are ESM and include declarations. Preview compatibility may change before a stable release; pin the exact version and retain evidence fixtures.

PUBLIC STABLE CANDIDATE: root entry `createGuard`, `createBoundBroker`, `fingerprint`, `verifyEvidence`, `reasons`, `explainReason`; types `ProtectedOperation`, `Scope`, `GuardOptions`, `EvidenceStore`. Guard methods: `protect`, `disable`, `status`, `explain`, `verify`, and readonly `mode`. Broker accepts only the bound one-use permit through Guard; its callback is trusted-host code.

PUBLIC EXPERIMENTAL: `AuthorityProvider` and `EvidenceProvider` (legacy-context adapter types, not an Agent API); `/store` memory/file stores; `/github` `githubScope`, `mapGitHubIntent`, `GitHubScope`; `/development` `createDevelopment`, `sampleOperation` (NON_PRODUCTION only); `/compatibility` `toLegacyOperation`. CLI `init`, `doctor`, `status`, `protect`, `explain`, `verify` is a local fixture interface, not a production daemon.

UNSUPPORTED: WeakMap permits, canonical capsule layout beyond documented protocol compatibility, generated chunk names, implementation internals, internal authority records, advanced schema machinery, repository source layout and build metadata. They are not supported import paths. Do not parse chunks or forge permits/capsules.

The in-process Broker API and experimental authority types do not supply a network transport or safe remote identity system. Those integrations require independent deployment qualification. The tested legacy conversion preserves operation identity; it does not migrate or merge journals automatically.
