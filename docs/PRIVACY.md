# Data handling — Technical Preview

The package has no telemetry client, analytics endpoint, hosted evidence service or automatic external upload. Running the local demo needs no account or network. A separately deployed GitHub Broker necessarily communicates with GitHub; that transport is outside this package.

Evidence records IDs, actor, action, resource/scope, fingerprints, decision timestamps/identities/reasons, dispatch/result and verification capsules containing authority/provenance references. File contents are not required by the public operation shape. Credentials must never appear in any field. Metadata and fingerprints can still be sensitive or identifying; hashing is not anonymization. The integrator must minimize and validate metadata before submission.

Memory storage lasts for the process lifetime. File storage remains locally until the operator deliberately removes it: **there is no automatic retention expiration**. Choose a retention period before live use, restrict access and encrypt storage/backups as appropriate. Preserve replay/duplicate-prevention history for the operational lifetime; purge only after stopping the integration and planning a new reviewed lifecycle. Deleting a file to bypass duplicate protection is unsafe.

No automatic support diagnostic upload is included. Export only reviewed/redacted metadata with explicit user consent. Remove secrets, host/user identifiers and private paths before sharing. Operator-controlled deletion includes local evidence, exported diagnostics and all backup copies; the package cannot erase third-party copies or guarantee physical media sanitization.

Pilot inquiries are accepted at **immune@orimusu.com**, or through GitHub Discussions once enabled. Please send only contact details and a brief description of your environment. Do not send secrets, credentials or customer data. This technical description is not a completed customer privacy contract.
