# Security reporting policy — Technical Preview

Supported Technical Preview: the current published preview tag listed in [CHANGELOG](CHANGELOG.md) and `release-manifest.json`. Older preview tarballs may be discussed if a report still applies to the same runtime, but there is no commitment to fix every historical package. Other versions are not covered. No public support SLA is established.

**Private reporting contact: security@orimusu.com.** Do not file sensitive vulnerability details publicly, and do not send keys, tokens, passwords, private source content or raw environment dumps.


## What to report

Report credential-boundary bypass, admission or dispatch substitution, replay, fail-open behavior, unintended data retention, or a reproducible dependency issue in this preview.

Include:

- package version and SHA-256 digest
- OS and Node.js version
- expected and actual behavior
- minimal sanitized operation metadata
- steps for a harmless local reproduction

Prefer hashes and redacted logs. Provide sensitive details only through the private contact.

## What we will try to do

This is a Technical Preview maintained by one person, so the following are goals, not promises:

- acknowledge a clearly written report when it is seen
- give the report a short tracking reference
- try to reproduce it and judge impact
- if a fix is warranted, coordinate a disclosure date with the reporter
- prefer coordinated disclosure

We do not promise a response time, a fix timeline, or a bounty. If a report cannot be reproduced from the information sent, we may ask for a clearer local reproduction or close the report as unresolved.

Do not test against third-party systems without their authorization. Do not attempt to access accounts, credentials, or hosts that you do not own.

The preview ships a simulated Broker and is not production-qualified. Reports that assume a dedicated Broker host or real credential isolation should say so; those deployments are outside this package.
