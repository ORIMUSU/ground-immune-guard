# Five-minute concept demo

Install the package as in [Quickstart](../QUICKSTART.md); run `node demo.mjs` from the bundle with that dependency installed. No account, credential, GitHub connection or write is required.

1. Inspect the example: Agent input contains intent and a fingerprint, no credential.
2. The trusted local fixture defines one reviewed operation and one exact scope.
3. ADMITTED invokes the simulated Broker once.
4. The out-of-scope request is DENIED. The missing-review request is UNRESOLVED.
5. The Broker counter remains one; read the compact reason and result.
6. Run the GitHub mapping example: Shadow admits a synthetic reviewed intent with zero Broker calls.
7. Optional, LIMITED_BLOCKING only: run `examples/tamper-after-approval.mjs`. After admission, a substituted operation is rejected (`UNRESOLVED` / `TARGET_CHANGED`) and the trusted Broker function runs 0 times. This demonstrates preview Broker binding, not a Full IMMUNE guarantee. Default SHADOW does not exercise this path.

This is a short explanatory demo, not a measured human completion-time claim or real credential-isolation demonstration. Advanced Adaptive demos belong to separate tooling and are not needed here.
