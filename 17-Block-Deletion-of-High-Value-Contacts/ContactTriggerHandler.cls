public with sharing class ContactTriggerHandler {
   public static handleBeforeDelete(List<Contact> conList) {
    ContactTriggerHelper.blockDeletingHighValueContactsVIP(conList);
   }
}