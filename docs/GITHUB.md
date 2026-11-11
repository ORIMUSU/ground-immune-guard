# GitHub: Shadow first

The shipped `/github` entry maps validated metadata to a protected operation. It does not fetch GitHub data, authenticate a caller or send a write. `examples/github-shadow.mjs` is a local mapping example with synthetic numeric identity and revisions, explicitly not a real observation. Run it in the same fresh consumer as the first example.

## Shadow integration

On the trusted integration side, resolve repository numeric ID, branch, base and proposed revision, complete changed-path list, before/after blob IDs and mutation fingerprint from the real operation. Do not trust the display name as identity. Derive the actor from an authenticated session, not an Agent assertion. Define one repository, branch and path prefix. Independently verify provenance and pass the mapped request to Guard in SHADOW, recording the original outcome separately. Do not interrupt or rewrite the customer's write. Never put file bodies or credentials in evidence. Hashes do not authenticate their source by themselves.

The historical controlled pilot observed accepted Git pushes after the fact. It did not inspect rejected writes or establish credential isolation. The reusable observer/transport service is not bundled in this package.

## Broker enforcement — separate qualification

A dedicated credential-holding host and independently configured Admission/Broker identities are required by the pilot architecture. Agent can reach Admission only; Broker remains internal. Admission must not read the Broker credential. The Broker validates the full immutable authorization binding and exact retained mutation before using a narrowly scoped credential. This SDK's process-local permit is not a network authorization token; a cross-process deployment needs a separately verified immutable artifact verifier and durable execution ledger.

Protect primary branches remotely, restrict the pilot write actor, disable destructive bypass and install only on the selected repository with only necessary permissions. GitHub App Contents write is repository-granular; an unprotected other branch remains a residual risk. Remote rules and their actual applicability must be verified before credential introduction. Do not give an Agent a PAT, App key or installation token.

First qualify with dummy credentials on the dedicated host: distinct service identities, credential read denial, no Agent-to-Broker route, DENIED/UNRESOLVED zero calls, ADMITTED once, restart duplicate prevention, service outage fail-closed and leak scan. Real key generation and real execution each remain human gates. Physical qualification is currently NOT YET VERIFIED. Do not infer readiness from the local example or historical guarded push. Begin with one noncritical scope; no automatic expansion or promotion.
