public with sharing class AccountTriggerHandler {
   public static void handleBeforeInsert(List<Account> accList, Map<Id, Account> oldMap) {
        AccountTriggerHelper.checkDuplicateNameAndRating(accList, oldMap);
   }

   public static void handleBeforeUpdate(List<Account> accList, Map<Id, Account> oldMap) {
        AccountTriggerHelper.checkDuplicateNameAndRating(accList, oldMap);
   }
}
