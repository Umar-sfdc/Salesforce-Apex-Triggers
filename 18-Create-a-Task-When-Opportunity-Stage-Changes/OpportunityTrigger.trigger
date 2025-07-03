/*

🟩 Q18: Create a Task When Opportunity Stage Changes
🧠 Story: Whenever an Opportunity moves from "Qualification" to "Proposal", a follow-up task must be created automatically.
🎯 Problem Statement:
 Write an after update trigger to detect stage transition and create a follow-up Task.

OBJECT : Opportunity
EVENT : After Update

*/

trigger OpportunityTrigger on Opportunity (after insert, after update) {
    OpportunityTriggerDispatcher.dispatch(Trigger.OperationType);
}
