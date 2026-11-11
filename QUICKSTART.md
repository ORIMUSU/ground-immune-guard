# First operation: JavaScript and TypeScript

Use a **new, empty directory** with Node.js >=22 and npm. Download `ground-immune-guard-0.1.0-preview.3.tgz` from the GitHub release at `https://github.com/ORIMUSU/ground-immune-guard` (tag `v0.1.0-preview.3`, once published) and check its SHA-256 against `SHA256SUMS`. There is no registry download or real credential setup in this guide.

Until preview.3 is published, the last frozen runtime is `0.1.0-preview.2` (SHA-256 `7b8b6bb7a2409e12cf2d7396089e059f728bd4b94a9dd5186aafef4f1d8bb99d`). That tarball still embeds the earlier PolyForm Free Trial license text.

`npm init -y` is required: without a `package.json` in the current directory, npm installs into the nearest parent directory that has a `package.json` or `node_modules`, and `./node_modules/.bin/guard` is then missing. To use an existing project instead, run `npm install` from that project's root.

```sh
mkdir guard-quickstart && cd guard-quickstart
npm init -y
npm install --offline --ignore-scripts /path/to/ground-immune-guard-0.1.0-preview.3.tgz
./node_modules/.bin/guard init ./shadow
./node_modules/.bin/guard doctor ./shadow
./node_modules/.bin/guard protect ./shadow allowed
./node_modules/.bin/guard protect ./shadow denied
./node_modules/.bin/guard protect ./shadow unresolved
./node_modules/.bin/guard explain ./shadow
./node_modules/.bin/guard verify ./shadow
```

`init` defines one sample scope and defaults to SHADOW. All three decisions have no Broker execution in this mode, and `protect` exits 0 for every verdict (use `--fail-on-verdict` to get 3 for DENIED and 4 for UNRESOLVED). The CLI is intentionally a local test harness, not a generic GitHub credential setup tool. `doctor` reports `realCredentialReady: false`.

To see local simulated execution, use a separate evidence directory:

```sh
./node_modules/.bin/guard init ./blocking --limited
./node_modules/.bin/guard protect ./blocking allowed
./node_modules/.bin/guard protect ./blocking denied
./node_modules/.bin/guard protect ./blocking unresolved
./node_modules/.bin/guard verify ./blocking
```

The first operation succeeds once; the other two do not execute. Repeating the same allowed operation ID does not execute again (UNRESOLVED / DECISION_REUSED). Keep evidence between restarts; deleting evidence is not a retry strategy.

In LIMITED_BLOCKING, `guard protect` exits 0 for ADMITTED, 3 for DENIED and 4 for UNRESOLVED (2 for usage/configuration errors), so the `denied` and `unresolved` steps exit non-zero by design. `guard status` reports the most recent recorded decision and ends as `UNRESOLVED` after this sequence; see [docs/EXPLAIN.md](docs/EXPLAIN.md).

To see a post-admission change stopped by preview Broker binding, copy `examples/tamper-after-approval.mjs` from this repository into the same project and run `node tamper-after-approval.mjs`. This path requires LIMITED_BLOCKING; default SHADOW does not exercise it. The example is a preview Broker-bind demonstration, not a Full IMMUNE guarantee.

## Programmatic example

Copy `examples/first-operation.mjs` (in the repository, or `node_modules/@ground/immune-guard/examples/` after install) to the fresh project and run `node first-operation.mjs`. This defines an explicit scope, connects a local simulated Broker, exercises all three decisions, asserts exactly one execution, and prints a slim explanation. The same source is valid TypeScript: copy it as `first-operation.mts` and compile using your separately installed TypeScript compiler with `--strict --module NodeNext --target ES2022`. Run the emitted `.mjs`. The compiler is a development prerequisite, not a Guard runtime dependency.

`createDevelopment` is a trusted-host **NON_PRODUCTION** fixture. Never let an Agent set `approvedOperations`, replace the authority provider, or choose the executor. A deployed integration must authenticate the caller, derive its actor identity server-side, resolve policy/evidence independently and retain exact reviewed mutation data at the trusted Broker. See [Security Model](docs/SECURITY-MODEL.md) before connecting a real system.

A fresh installation test validates these commands offline for JS and emitted TS. Human completion time has not been measured.
