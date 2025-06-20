/* 

🟩 Q11: Auto Close Cases with No Response
🧠 Story: Support reps log Cases but forget to follow up or close them. If a Case remains in “Waiting on Customer” status for more than 7 days, it should auto-close.

🎯 Problem Statement:
 Write a trigger that runs before update and automatically sets the Status = Closed if the case has been in "Waiting on Customer" status for more than 7 days (based on LastModifiedDate).

OBJECT : Case
EVENET : before Insert


*/

trigger CaseTrigger on Case (before insert, before update) {
    CaseTriggerDispatcher.dispatch(Trigger.OperationType);
}
