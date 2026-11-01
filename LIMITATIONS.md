# Known limitations

- Technical Preview; not production-certified, formally verified or a comprehensive security product.
- No dedicated Broker host, remote credential setup, real GitHub executor or hosted Admission service is bundled.
- Physical credential isolation and real GitHub App credential-gated enforcement are NOT YET VERIFIED for this candidate. Existing controlled Git push evidence used a bypassable wrapper.
- Credential separation depends on trusted deployment. The same user/process controlling Agent and Broker can defeat the boundary. Root-level Broker host or remote administrator compromise is outside the claim.
- GitHub App write permissions apply at repository granularity; remote branch rules and additional branch exposure require review.
- Caller identity must be authenticated independently. Policy and evidence cannot be accepted solely because the Agent asserts them. Scope admission does not analyze full source semantics or all prompt injections.
- Process-local permits cannot be sent across a network as a production authorization protocol.
- Local evidence is not externally notarized. Trusted-storage rollback or deletion is not fully prevented. Keep durable state and reconcile unknown outcomes; fail-closed behavior can reduce availability.
- Hostile real-world attack validation is limited. Controlled small samples do not establish general false-positive rates or attack detection coverage.
- Adaptive, Recovery and Governance are not loaded by the default Guard package. Advanced formats remain separate, with separate compatibility and deployment review.
- Start in Shadow. Enforcement requires explicit configuration, qualified infrastructure and human approval. No automatic promotion, scope expansion or credential provisioning is supplied.
- Public license, reporting contact, distribution destination and signing choice remain pending. Publication is blocked until resolved alongside physical qualification.

Later, separate dummy-credential cross-UID evidence is bounded in [VERIFICATION.md](VERIFICATION.md). It does not change the bundled package or satisfy real-credential/deployment qualification.
