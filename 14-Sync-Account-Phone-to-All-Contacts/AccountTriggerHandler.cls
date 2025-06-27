public with sharing class AccountTriggerHandler {

    public static void handleAfterInsert(List<Account> accNewList, Map<Id, Account> accOldMap) {
        AccountTriggerHelper.syncAllAccountPhoneToContact(accNewList, accOldMap);
    }

    public static void handleAfterUpdate(List<Account> accNewList, Map<Id, Account> accOldMap) {
        AccountTriggerHelper.syncAllAccountPhoneToContact(accNewList, accOldMap);
    }
}