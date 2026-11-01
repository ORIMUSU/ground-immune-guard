# A compact explanation

The executable first-operation example prints only:

```text
operation: first
actor: example-agent
scope: example-write
decision: ADMITTED
reason: AUTHORIZED
execution: SUCCEEDED (local simulated Broker)
```

The out-of-scope example returns DENIED / OUT_OF_SCOPE / NOT_EXECUTED. A request without required independent review returns UNRESOLVED and does not execute. `guard explain` exposes slim metadata without dumping the underlying replay capsule; `guard verify` checks the full local chain. A successful verification is consistency with the recorded trusted inputs, not proof those inputs were independent of a compromised host.
