/*

🟩 Q13: Prevent Changing Opportunity Stage to Closed-Won Without Amount
🧠 Story: Sales reps accidentally mark Opportunities as Closed-Won without setting the Amount, which causes reporting issues.
🎯 Problem Statement:
 Write a trigger that prevents setting StageName = "Closed Won" if the Amount field is null or 0.

OBJECT : Opportunity
EVENT : Before Insert, Before Update

*/

trigger OpportunityTrigger on Opportunity (before insert, before update) {
  OpportunityTriggerDispatcher.dispatch(Trigger.OperationType);
}
