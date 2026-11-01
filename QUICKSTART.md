# First operation: JavaScript and TypeScript

Use a fresh directory with Node.js >=22 and npm. Receive the candidate tarball and this bundle locally. There is no registry download or real credential setup in this guide.

```sh
npm init -y
npm install --offline --ignore-scripts /path/to/bundle/ground-immune-guard-0.1.0-preview.1.tgz
./node_modules/.bin/guard init ./shadow
./node_modules/.bin/guard doctor ./shadow
./node_modules/.bin/guard protect ./shadow allowed
./node_modules/.bin/guard protect ./shadow denied
./node_modules/.bin/guard protect ./shadow unresolved
./node_modules/.bin/guard explain ./shadow
./node_modules/.bin/guard verify ./shadow
```

`init` defines one sample scope and defaults to SHADOW. All three decisions have no Broker execution in this mode. The CLI is intentionally a local test harness, not a generic GitHub credential setup tool. `doctor` reports `realCredentialReady: false`.

To see local simulated execution, use a separate evidence directory:

```sh
./node_modules/.bin/guard init ./blocking --limited
./node_modules/.bin/guard protect ./blocking allowed
./node_modules/.bin/guard protect ./blocking denied
./node_modules/.bin/guard protect ./blocking unresolved
./node_modules/.bin/guard verify ./blocking
```

The first operation succeeds once; the other two do not execute. Repeating the same allowed operation ID does not execute again. Keep evidence between restarts; deleting evidence is not a retry strategy.

## Programmatic example

Copy `examples/first-operation.mjs` from the bundle to the fresh project and run `node first-operation.mjs`. This defines an explicit scope, connects a local simulated Broker, exercises all three decisions, asserts exactly one execution, and prints a slim explanation. The same source is valid TypeScript: copy it as `first-operation.mts` and compile using your separately installed TypeScript compiler with `--strict --module NodeNext --target ES2022`. Run the emitted `.mjs`. The compiler is a development prerequisite, not a Guard runtime dependency.

`createDevelopment` is a trusted-host **NON_PRODUCTION** fixture. Never let an Agent set `approvedOperations`, replace the authority provider, or choose the executor. A deployed integration must authenticate the caller, derive its actor identity server-side, resolve policy/evidence independently and retain exact reviewed mutation data at the trusted Broker. See SECURITY-MODEL.md before connecting a real system.

A fresh installation test validates these commands offline for JS and emitted TS. Human completion time has not been measured.
