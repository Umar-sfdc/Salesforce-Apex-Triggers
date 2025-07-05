/*

🟩 Q20: Auto-Close Tasks Older Than 30 Days
🧠 Story: Tasks that remain open for more than 30 days are considered stale and should be marked as Status = Completed.
🎯 Problem Statement:
 Write a before update trigger that automatically updates Tasks older than 30 days and still open, to mark them as completed.

OBJECT : Task
EVENT : before update

*/

trigger TaskTrigger on Task (before update)  {
  TaskTriggerDispatcher.dispatch(Trigger.OperationType);
}
