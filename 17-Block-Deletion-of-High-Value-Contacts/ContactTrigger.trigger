/*

🟩 Q17: Block Deletion of High Value Contacts
🧠 Story: Some VIP customers have Contacts flagged with Is_VIP__c = true. These records must never be deleted.
🎯 Problem Statement:
 Write a before delete trigger on Contact that prevents deletion if Is_VIP__c = true.

OBJECT : Contact
EVENTS : Before Delete
 
*/

trigger ContactTrigger on Contact (before delete) {
  ContactTriggerDispatcher.dispatch(Trigger.OperationType);
}




