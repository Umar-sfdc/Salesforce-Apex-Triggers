/* 

🟩 Q2: Capitalize Contact Names
🧠 Story: A CRM admin noticed that contact names are saved in mixed or lowercase formats like john doe. They want to clean this up and ensure that every Contact’s first and last name starts with a capital letter.
🎯 Problem Statement:
 Write a before insert and before update trigger to convert FirstName and LastName fields to proper case (e.g., John, Doe).

*/

trigger ContactTrigger on SOBJECT (before insert, before update) {
    ContactTriggerDispatcher.dispatch(Trigger.OperationType);
}
