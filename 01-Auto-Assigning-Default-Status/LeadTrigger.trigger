/* 

🟩 Q1: Auto Assigning a Default Lead source
🧠 Story: A company called LeadSprint has a Lead intake process. Their users often forget to set the Lead source field while creating a Lead. Management wants to make sure that every new Lead is automatically assigned a Lead source = New.

🎯 Problem Statement:
 Write a before insert trigger on Lead that auto-assigns "New" to the Lead source field if it's left blank by the user.

OBJECT : Lead
EVENT : BEFORE INSERT

*/
trigger LeadTrigger on Lead (before insert) {
	LeadTriggerDispatcher.dispatch(Trigger.operationType);
}
