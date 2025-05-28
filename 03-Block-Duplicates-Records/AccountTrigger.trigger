/* 

🟩 Q3: Block Duplicate Accounts by Name
🧠 Story: Your team accidentally created several Accounts with the same name. To maintain data quality, management wants to block insertion of duplicate Account Names.

🎯 Problem Statement:
Write a trigger that checks if the Account.Name already exists (case-insensitive). If yes, prevent the insert and show an error message.

OBJECT : Account
EVENTS : Before Insert, Before Update 


*/
trigger AccountTrigger on Account (before insert, before update) {
    AccountTriggerDispatcher.dispatch(Trigger.OperationType);
}
