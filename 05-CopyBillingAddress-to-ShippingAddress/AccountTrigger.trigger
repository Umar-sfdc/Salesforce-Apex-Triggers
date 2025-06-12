/*

🟩 Q5: Copy Billing Address to Shipping Address
🧠 Story: Sales reps forget to fill the Shipping Address. Management decided to copy the Billing Address into Shipping Address if the Shipping Address is left blank.
🎯 Problem Statement:
 Create a before insert and before update trigger on Account that copies the billing address fields into the shipping address fields if shipping is blank.

*/

trigger AccountTrigger on Account(before insert, before update){
  AccountTriggerDispatcher.dispatch(Trigger.OperationType);
}
