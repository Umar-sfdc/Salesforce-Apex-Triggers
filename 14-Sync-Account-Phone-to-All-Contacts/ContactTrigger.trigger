/*

🟩 Q14: Sync Account Phone to All Contacts
🧠 Story: When a customer updates their main business number on the Account, all related Contacts should reflect the same number.
🎯 Problem Statement:
 Write an after update trigger on Account that updates the Phone field of all related Contacts if the Account’s Phone field has changed.

EVENT  : After Insert, After Update
OBJECT : Account

*/

trigger ContactTrigger on Contact(after insert, after update) {  
  ContactTriggerDispatcher.dispatch(Trigger.OperationType);
}

