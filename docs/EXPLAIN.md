# A compact explanation

All examples below are real output from `0.1.0-preview.1` on Node 22 and Node 24 (re-checked for preview.2). Hashes and timestamps differ per run.

## `examples/first-operation.mjs`

Prints exactly one JSON line:

```json
{"operation":"first","actor":"example-agent","scope":"example-write","decision":"ADMITTED","reason":"AUTHORIZED","execution":"SUCCEEDED","denied":"DENIED","unresolved":"UNRESOLVED","simulatedExecutions":1,"credential":"NONE"}
```

The allowed request is ADMITTED and executes once through the local simulated Broker; the out-of-scope request is DENIED / OUT_OF_SCOPE / NOT_EXECUTED; the request without required independent review is UNRESOLVED and does not execute.

## `guard protect`

One JSON line per call, for example after `guard init ./blocking --limited`:

```json
{"environment":"NON_PRODUCTION","result":{"decision":"ADMITTED","reason":"AUTHORIZED","execution":{"outcome":"SUCCEEDED"},"decisionIdentity":"b197…eda5","mode":"LIMITED_BLOCKING"},"simulatedExecutions":1}
{"environment":"NON_PRODUCTION","result":{"decision":"UNRESOLVED","reason":"DECISION_REUSED","execution":{"outcome":"NOT_EXECUTED"},"decisionIdentity":"bcbe…f7bb","mode":"LIMITED_BLOCKING"},"simulatedExecutions":0}
{"environment":"NON_PRODUCTION","result":{"decision":"DENIED","reason":"OUT_OF_SCOPE","execution":{"outcome":"NOT_EXECUTED"},"decisionIdentity":"bb8e…81c5","mode":"LIMITED_BLOCKING"},"simulatedExecutions":0}
{"environment":"NON_PRODUCTION","result":{"decision":"UNRESOLVED","reason":"EVIDENCE_MISSING","execution":{"outcome":"NOT_EXECUTED"},"decisionIdentity":"d0e2…6064","mode":"LIMITED_BLOCKING"},"simulatedExecutions":0}
```

(allowed, the same allowed operation again, denied, unresolved). `simulatedExecutions` counts executions within that single CLI process. In SHADOW mode (`guard init ./shadow`) the same decisions are reported with `"execution":{"outcome":"OBSERVED"}` and `simulatedExecutions: 0`.

## `guard explain`

Prints a JSON array with one slim record per stored evidence event. The replay capsule is omitted and a human-readable `explanation` is added. One record:

```json
{"format":"guard-v0.1","operationId":"denied","actor":"example-agent","action":"file.update","resource":"example:document","scope":"outside","inputFingerprint":"44fb…a63","decisionTimestamp":"2026-11-09T15:27:40.263Z","decisionIdentity":"bb8e…81c5","stage":"ADMISSION","decision":"DENIED","reason":"OUT_OF_SCOPE","explanation":"This operation is outside the granted scope."}
```

An admitted and executed operation produces three records (`ADMISSION`, `DISPATCH`, `RESULT` with `outcome` and `reference`); a DENIED or UNRESOLVED decision produces one `ADMISSION` record. A rejected replay (`DECISION_REUSED`) is returned to the caller but is not appended as a new record.

## `guard status`

Prints `{"status": "HEALTHY" | "BLOCKED" | "UNRESOLVED"}`. It describes the local evidence store, mainly its **most recent recorded decision**, not the health of the installation:

| Status | When |
|---|---|
| `HEALTHY` | No records yet, or the most recent recorded decision is ADMITTED and every dispatch has a SUCCEEDED result |
| `BLOCKED` | The most recent recorded decision is DENIED (or the Guard instance was disabled) |
| `UNRESOLVED` | The most recent recorded decision is UNRESOLVED, a dispatch has no SUCCEEDED result yet, or the evidence cannot be read/verified |

So after the Quickstart sequence (allowed, allowed again, denied, unresolved) `status` ends as `UNRESOLVED`; this is expected and does not mean the install is broken. A rejected replay (`DECISION_REUSED`) is not recorded, so it does not change `status`. `guard doctor` includes the same value as `status`.

## `guard verify`

Re-checks the full local hash chain and replays every recorded admission. It prints `{"head": "<last record hash>", "count": <number of records>, "prior": [...]}`; `prior` lists the admitted requests used for replay and is intentionally verbose. A good result is: exit code 0, `count` equal to the number of `explain` records, and no error. An error prints `UNRESOLVED: local configuration or evidence unavailable; no fallback execution.` and exits 2.

A successful verification is consistency with the recorded trusted inputs, not proof those inputs were independent of a compromised host.

## CLI exit codes (from 0.1.0-preview.2)

`guard protect` prints one JSON line. In LIMITED_BLOCKING it sets the exit code from `result.decision`:

| Exit code | Meaning |
|---|---|
| 0 | `ADMITTED` |
| 3 | `DENIED` (outside the configured scope/policy) |
| 4 | `UNRESOLVED` (for example `EVIDENCE_MISSING`, `DECISION_REUSED`, `GUARD_UNAVAILABLE`) |
| 2 | Usage error, or local configuration/evidence unavailable (no fallback execution) |

**SHADOW is observe-only, so by default it exits 0 for every verdict** (ADMITTED, DENIED and UNRESOLVED); the verdict is still printed and recorded in the evidence exactly as before. This lets you add Guard to CI in SHADOW to watch decisions without failing the job. Add `--fail-on-verdict` (e.g. `guard protect ./shadow denied --fail-on-verdict`) to get the 0/3/4 codes in SHADOW too; in LIMITED_BLOCKING the flag changes nothing. Errors exit 2 in every mode, with or without the flag. Nothing is blocked or executed by Guard in SHADOW, whatever the exit code. Other commands (`init`, `doctor`, `status`, `explain`, `verify`) exit 0 when they ran and 2 on usage/configuration/evidence errors. `guard --version` prints the package version. In 0.1.0-preview.1 every evaluated `protect` exited 0.
