/* 

🟩 Q9: Assign Default Owner to Cases
🧠 Story: Sometimes users create Cases without assigning an owner. The Support Head wants all unassigned Cases to default to a specific queue (Support Queue).
🎯 Problem Statement:
 Write a trigger to assign the default queue as the Case owner if the owner is not assigned during creation.

OBJECT : Case 
EVENT : After Insert

*/

trigger CaseTrigger on Case (before insert, before update) {
    CaseTriggerDispatcher.dispatch(Trigger.OperationType);
}
