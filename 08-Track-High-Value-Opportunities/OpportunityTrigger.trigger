/*

🟩 Q8: Track High Value Opportunities
🧠 Story: Leadership wants to know how many high-value Opportunities (Amount > 100,000) are being created. These should be logged in a custom object High_Value_Log__c.
🎯 Problem Statement:
 Write an after insert trigger to create a new High_Value_Log__c record for each Opportunity with amount > 100,000.

*/

trigger OpportunityTrigger on Opportunity (before insert) {
    OpportunityTriggerDispatcher.dispatch(Trigger.OperationType);
}
