# Frequently asked questions

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

## Do I need Adaptive IMMUNE?

No. Default Guard covers admission, binding and local evidence. Advanced Recovery/Governance/Adaptive are separate and not loaded by default.

## What if Broker is compromised?

A compromised credential-holding host may misuse its credential. Restrict remote permissions and branch rules, and plan revocation. Full root compromise is outside the claimed protection.

## Can I start in Shadow?

Yes; it is the default. Guard observes without blocking or invoking its Broker. Start with a single noncritical operation and compare decisions with outcomes.

## Does it send telemetry?

The package includes no telemetry or automatic evidence upload. Evidence is local; separately integrated protected systems have their own data handling.

## Is this production-ready?

It is a Technical Preview with physical, real-credential, license, contact and publication gates still unresolved. Local tests and small controlled pilots are not production certification.
