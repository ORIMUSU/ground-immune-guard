# Verified measurements and their limits

Historical local Guard RC baseline (before public documentation changes): 24 essential tests, 430 Full IMMUNE tests, 32 legacy product tests, 48 related tests and 6 intentionally injected mutations detected. Fresh JS/TS consumer tests passed. The release preflight separately requires fresh reruns; these historical counts are not a substitute for its result.

Local baseline: Node v24.15.0 on darwin; 30 fresh-store admitted operations including local simulated execution measured 0.550–1.912 ms. Seven fresh-process imports measured 2.124–2.253 ms. Caches, runtime noise and different workload stages matter; these are not long-running throughput or network performance claims. The original package including its smaller README was 45,390 unpacked bytes. Current candidate bytes are in release-manifest.json; additional public documentation is counted separately in internal validation.

Controlled real GitHub Shadow pilot, 2026-10-24: four accepted writes (two creates, one update, one delete); four ADMITTED, zero recorded divergence. Decision latency 7.547–14.776 ms. Detection delay 4.952–93.271 seconds was a separate polling/propagation measure. Four normal writes do not establish a general false-positive rate. The original observer had lifecycle limitations recorded at closeout; this is not a continuous-availability claim.

Controlled guarded-push pilot, 2026-10-26: one accepted real write; ADMITTED evaluation 9.312 ms; total wrapper including remote checks/Git transport 3477.008 ms. Negative and substitution cases were non-writing local requests/fixtures. That wrapper could be bypassed with another user credential and did not prove dedicated Broker credential isolation. No malicious remote attack was executed.

These historical pilots used the broader Engine integration, not this slim package's real GitHub transport (none is bundled). No raw repository identities, payloads or private evidence are included in this public summary. Internal provenance maps each value to its recorded report.

**Finite tests are not an attack detection rate.** Package size, sample latency, controlled writes and local mutation tests measure different things. Real-host credential isolation and hostile-production adaptive defense remain unverified.
