/* 

🟩 Q6: Auto Populate Opportunity Stage
🧠 Story: Sales reps forget to choose a stage when creating new Opportunities. Management wants to default the StageName to "Prospecting".
🎯 Problem Statement:
 Write a before insert trigger to assign "Prospecting" to the StageName field if it’s empty.

OBJECT : Opportunity
EVENT : Before Insert

*/

trigger OpportunityTrigger on Opportunity (before insert) {
    OpportunityTriggerDispatcher.dispatch(Trigger.OperationType);
}
