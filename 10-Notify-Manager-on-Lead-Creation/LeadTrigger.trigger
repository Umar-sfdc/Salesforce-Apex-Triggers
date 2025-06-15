/* 

🟩 Q10: Notify Manager on Lead Creation
🧠 Story: A regional manager wants to receive an email every time a Lead is created in their region (e.g., Region__c = "East"). This helps them track lead generation performance.
🎯 Problem Statement:
 Write an after insert trigger to send an email to a hardcoded manager email if the lead is created for Region__c = 'East'.

*/

trigger CaseTrigger on LeadTrigger (before insert, before update, after insert, after udpate, before delete, after undelete) {
    CaseTriggerDispatcher.dispatch(Trigger.OperationType);
}
