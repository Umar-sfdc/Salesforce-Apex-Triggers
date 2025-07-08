/*

🟩 Q21: Prevent Changing Account Type from 'Customer' to 'Prospect'
🧠 Story: Once an Account becomes a Customer, it should never be changed back to a Prospect.
🎯 Problem Statement:
 Write a before update trigger to block the update if the old value of Type = Customer and the new value is Prospect.

OBJECT : Account 
EVENT : before udpate

*/

trigger AccountTrigger on Account (before update) {
  AccountTriggerDispatcher.dispatch(Trigger.OperationType);
}
