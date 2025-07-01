/*

🟩 Q16: Auto Calculate Total Amount on Order
🧠 Story: Orders in your org have line items. Each Order__c record should automatically calculate Total_Amount__c = Quantity__c * Price__c.
🎯 Problem Statement:
 Write a before insert and before update trigger on Order__c to calculate and populate Total_Amount__c.

OBJECT : Order__c
EVENT : before insert, before update

*/

trigger OrderTrigger on Order__c (before insert, before update) {
  OrderTriggerDispatcher.dispatch(Trigger.OperationType);
}
