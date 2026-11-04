# Security reporting policy — Technical Preview candidate

Supported candidate: 0.1.0-preview.1 only, subject to release approval. No public support SLA is established yet. Other internal versions are not public support commitments.

**Private reporting contact: security@orimusu.com.** This monitored address has been verified for inbound delivery. Do not file sensitive vulnerability details publicly.

Report credential-boundary bypass, admission/dispatch substitution, replay, fail-open behavior, unintended data retention or a reproducible dependency issue. Include candidate version and digest, OS/runtime, expected/actual behavior, minimal sanitized operation metadata and steps with a harmless local reproduction. Do not send keys, tokens, passwords, private source content or raw environment dumps. Prefer hashes and redacted logs; provide sensitive details only through the approved private channel.

Proposed handling process: acknowledge receipt, assign a tracking reference, reproduce and assess impact, coordinate a fix and disclosure date with the reporter, then communicate resolution. No response-time SLA is promised for this Technical Preview. Coordinated disclosure is preferred. Do not test against third-party systems without their authorization.
