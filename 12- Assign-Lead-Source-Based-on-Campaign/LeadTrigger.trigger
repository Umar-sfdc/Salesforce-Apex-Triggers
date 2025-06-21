/*

🟩 Q12: Assign Lead Source Based on Campaign
🧠 Story: Marketing wants to ensure Leads created from Campaigns automatically get a LeadSource = "Marketing Campaign".
🎯 Problem Statement:
 Write a before insert trigger to check if CampaignId is populated. If yes, set LeadSource = "Marketing Campaign".

OBJECT : Lead
EVENTS : BEFORE INSERT

*/

trigger LeadTrigger on Lead(before insert, before update) {
  LeadTriggerDispatcher.dispatch(Trigger.OperationType);
}
