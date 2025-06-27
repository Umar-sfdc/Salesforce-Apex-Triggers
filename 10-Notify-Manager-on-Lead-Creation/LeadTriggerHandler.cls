public with sharing class LeadTriggerHandler {
    
    public static void handleAfterInsert(List<Lead> newLeadList) {
        LeadTriggerHelper.sendEmailToUser(newLeadList);
    }

}