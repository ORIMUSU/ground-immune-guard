import {createDevelopment} from '@ground/immune-guard/development';
import {fingerprint} from '@ground/immune-guard';
const operation={id:'first',actor:'example-agent',action:'file.update',resource:'example:document',scope:'example-write',inputFingerprint:fingerprint('public example mutation')};
const app=createDevelopment({environment:'NON_PRODUCTION',scope:{action:operation.action,resource:operation.resource,scope:operation.scope},approvedOperations:[operation],mode:'LIMITED_BLOCKING',enableBlocking:true});
const allowed=await app.guard.protect(operation);
const denied=await app.guard.protect({...operation,id:'outside',scope:'other-scope'});
const unresolved=await app.guard.protect({...operation,id:'not-reviewed'});
if(allowed.decision!=='ADMITTED'||allowed.execution.outcome!=='SUCCEEDED'||denied.decision!=='DENIED'||unresolved.decision!=='UNRESOLVED'||app.metrics.executions!==1||app.guard.verify().count!==5)throw Error('EXAMPLE_FAILED');
console.log(JSON.stringify({operation:operation.id,actor:operation.actor,scope:operation.scope,decision:allowed.decision,reason:allowed.reason,execution:allowed.execution.outcome,denied:denied.decision,unresolved:unresolved.decision,simulatedExecutions:app.metrics.executions,credential:'NONE'}));
