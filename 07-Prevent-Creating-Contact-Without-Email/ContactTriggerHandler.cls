public with sharing class ContactTriggerHandler {
    public static void handleBeforeInsert(List<Contact> conList) {
       ContactTriggerHelper.checkEmail(conList);
    }

    public static void handleBeforeUpdate(List<Contact> conList) {
       ContactTriggerHelper.checkEmail(conList);
    }
}