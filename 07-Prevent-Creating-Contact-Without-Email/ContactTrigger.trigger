/*

🟩 Q7: Prevent Creating Contact Without Email
🧠 Story: Your company has a rule to never create a Contact without an email address. This is to ensure future communication.
🎯 Problem Statement:
 Write a before insert trigger on Contact to prevent creation if the Email field is blank. Throw a meaningful error.

*/

trigger ContactTrigger on Contact (before insert, before update) {
  ContactTriggerDispatcher.dispatch(Trigger.OperationType);
}
