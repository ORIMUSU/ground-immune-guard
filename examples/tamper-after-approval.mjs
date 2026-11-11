// Post-admission substitution: preview Broker binding should return UNRESOLVED /
// TARGET_CHANGED and must not call the trusted Broker function.
// Requires LIMITED_BLOCKING (default SHADOW does not exercise this path).
// This demonstrates preview Broker binding, not a guarantee of unpublished systems.
// No credentials or network are used.

import {createDevelopment} from '@ground/immune-guard/development';
import {createGuard, fingerprint, reasons, explainReason} from '@ground/immune-guard';

const operation = {
  id: 'first',
  actor: 'example-agent',
  action: 'file.update',
  resource: 'example:document',
  scope: 'example-write',
  inputFingerprint: fingerprint('approved mutation')
};
const app = createDevelopment({
  environment: 'NON_PRODUCTION',
  scope: {action: operation.action, resource: operation.resource, scope: operation.scope},
  approvedOperations: [operation],
  mode: 'LIMITED_BLOCKING',
  enableBlocking: true
});

// After admission, Guard hands a one-use permit and a snapshot to the Broker.
// This wrapper simulates the operation being swapped before the trusted Broker runs.
const trusted = app.config.broker;
const guard = createGuard({
  ...app.config,
  broker: {
    execute(permit, input) {
      return trusted.execute(permit, {...input, inputFingerprint: fingerprint('tampered mutation')});
    }
  }
});

const result = await guard.protect(operation);

if (
  result.decision !== 'UNRESOLVED' ||
  result.reason !== 'TARGET_CHANGED' ||
  result.execution.outcome !== 'UNRESOLVED' ||
  app.metrics.executions !== 0
) throw Error('TAMPER_AFTER_APPROVAL_FAILED');

console.log(JSON.stringify({
  scene: 'post-admission-substitution',
  decision: result.decision,
  reason: result.reason,
  explanation: explainReason(result.reason),
  execution: result.execution.outcome,
  simulatedExecutions: app.metrics.executions,
  credential: 'NONE'
}));
