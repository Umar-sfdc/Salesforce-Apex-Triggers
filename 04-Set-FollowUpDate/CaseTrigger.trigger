/* 

🟩 Q4: Set Follow-up Date on Case Creation
🧠 Story: Support agents forget to set a follow-up date when a Case is created. The manager wants every new Case to have the Follow_Up_Date__c field automatically set to 3 days after the CreatedDate.
🎯 Problem Statement:
 Write a trigger that automatically sets Follow_Up_Date__c = CreatedDate + 3 days during Case creation.

*/

trigger CaseTrigger on Case (before insert) {
    CaseTriggerDispatcher.dispatch(Trigger.OperationType);
}
