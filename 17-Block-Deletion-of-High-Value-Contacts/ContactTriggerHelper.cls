public with sharing class ContactTriggerHelper {
   public static void blockDeletingHighValueContactsVIP(List<Contact> conList) {
        for(Contact con : conList) {
            if(is_VIP__c == true) {
                con.is_VIP__c.addError('VIP Contact Can\'t be deleted!');
                con.addError('This record is a VIP Contact con\'t perform deletion operation!');
            }
        }
   }
}