# Pilot intake specification — inactive draft

Collect only: company/team; contact name and reachable business contact; system; Agent framework if any; proposed protected operation; current credential model as a description only; whether Shadow is desired; environment/OS and deployment constraints; criticality and rollback/stop method.

Do not request passwords, tokens, keys, PINs, credential files, full source code, environment dumps or sensitive operation payloads. Provide a visible warning beside the credential-model description. No file uploads in the initial form. Reject secret-like content and ask for a redacted description without echoing the detected value into logs.

Before activation a human must approve the recipient/operator, destination, access control, retention period, deletion channel and privacy notice. No analytics, third-party form service or telemetry is enabled by this specification. Do not promise a response SLA that has not been staffed. The sole submit action is **Request a Shadow Pilot**.
