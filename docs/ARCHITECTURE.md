# Minimal architecture — Technical Preview

```mermaid
flowchart TD
    A[AI Agent: operation intent, no write credential] --> G[Guard: independent authority and evidence]
    G -->|DENIED or UNRESOLVED| S[Stop enforcement path]
    G -->|ADMITTED: exact operation binding| B[Separately deployed Broker: write credential]
    B --> P[Protected system]
```

This is the intended qualified enforcement deployment. The package demo uses a simulated in-process Broker. A process boundary and credential isolation require separately deployed infrastructure; a diagram or an ADMITTED result does not establish either property. Shadow observes existing operations, never invokes the Guard Broker and does not prevent writes through other paths.

The trusted operator controls identity, policy, providers, exact mutation, evidence and Broker deployment. The Agent must not control those inputs or hold a bypass credential.
