# Threat model — Technical Preview

Assets: write credentials, exact target mutation, authority decision and local evidence. Untrusted actor: an Agent supplying operation intent. Trusted actors/components: authenticated Admission host, independent authority/evidence providers, Broker, storage/clock and remote enforcement.

Tested locally: out-of-scope requests are denied; missing authority/evidence is unresolved; stale or repeated decisions do not execute; operation substitution fails; Guard/store/Broker failures do not become an allow. These reduce unsafe execution through the configured path.

Deployment goal, not yet real-host proof: an Agent cannot read or obtain a reusable write credential when the dedicated Broker architecture is correctly qualified. In-process tests alone cannot establish that property.

Out of scope: full Broker-host root compromise, malicious platform administrators, compromised platform rules, kernel/hardware compromise, every supply-chain attack, and every prompt injection or model attack. In-scope metadata does not imply that file content is safe or that the business intent is wise. Local finite tests and controlled repository writes are not hostile-production attack detection measurements.
