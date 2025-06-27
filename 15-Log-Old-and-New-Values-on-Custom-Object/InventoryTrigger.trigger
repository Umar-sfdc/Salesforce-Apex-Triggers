/*

🟩 Q15: Log Old and New Values on Custom Object
🧠 Story: Your org has a custom object Inventory__c. The admin wants to log every update by saving both the old and new quantity values into a Change_Log__c object.
🎯 Problem Statement:
 Write an after update trigger on Inventory__c to create a new Change_Log__c record containing the old and new values of Quantity__c.

OBJECT : Inventory 
EVENT : after update

*/

trigger InventoryTrigger on Inventory__c() {
  InventoryTriggerDispatcher.dispatch(Trigger.OperationType);
}
