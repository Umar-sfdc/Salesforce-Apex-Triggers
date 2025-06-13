public with sharing class AccountTriggerHandler {
   public static void handleBeforeInsert(List<Account> accList) {
        AccountTriggerHelper.manageDuplicateRecord(accList);
   }

   public static void handleBeforeUpdate(List<Account> accList) {
        AccountTriggerHelper.manageDuplicateRecord(accList);
   }
}