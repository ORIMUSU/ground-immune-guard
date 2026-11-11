# Frequently asked questions

## Is this open source?

The materials in this repository are licensed under the Apache License 2.0. The installable package ships a readable ESM build in `dist/`. The original TypeScript sources used to produce that build are not in this repository. Third-party components remain under their own terms; see `THIRD-PARTY-NOTICES.txt` and `LICENSE`.

## Is this an antivirus?

No. Guard evaluates operation authority and evidence at a configured execution boundary. It is not a malware scanner.

## Does it stop prompt injection?

It can keep an out-of-scope request from executing through the enforcement path even when an Agent asks for it. It does not detect every prompt injection, and an admitted in-scope operation can still be undesirable.

## Does the Agent ever see the credential?

In the intended qualified Broker deployment it must not. The shipped local demo has no credential at all. Real-host isolation is not yet verified for this preview; same-process testing does not prove isolation.

## What happens when Guard is unavailable?

Enforcement callers must stop rather than fall back to direct writes. Tested local failures return unresolved/no execution. Separate deployment controls must prevent alternate credential paths. Shadow remains observational and does not own the customer's write path.

## Why UNRESOLVED?

Missing, stale or inconsistent evidence is different from an explicit policy denial. Stop execution, inspect the reason and reconcile with a trusted operator instead of guessing permission.

## What if the operation changes after it was admitted?

In LIMITED_BLOCKING, preview Broker binding rejects the changed operation (`TARGET_CHANGED`) and does not run the trusted Broker function. Default SHADOW does not exercise this path. This is a property of the preview Broker bind, not a claim about unpublished systems. See `examples/tamper-after-approval.mjs`.

## Do I need the Adaptive, Recovery or Governance layers?

No. Default Guard covers admission, binding and local evidence. Those advanced layers belong to Full IMMUNE, are not in this repository, and are not loaded by this package.

## What if Broker is compromised?

A compromised credential-holding host may misuse its credential. Restrict remote permissions and branch rules, and plan revocation. Full root compromise is outside the claimed protection. This preview's Broker is simulated and holds no real credential.

## Can I start in Shadow?

Yes; it is the default. Guard observes without blocking or invoking its Broker. Start with a single noncritical operation and compare decisions with outcomes.

## Does it send telemetry?

The package includes no telemetry or automatic evidence upload. Evidence is local; separately integrated protected systems have their own data handling.

## Is this production-ready?

No. It is a Technical Preview for local evaluation with a simulated Broker. Physical and real-credential qualification have not been completed. See [LICENSE](../LICENSE) (Apache-2.0) and [Limitations](LIMITATIONS.md). Local tests and small controlled pilots are not production certification.
