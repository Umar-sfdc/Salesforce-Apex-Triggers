public with sharing class LeadTriggerHandler {
    public static void handleBeforeInsert(List<Lead> newLeadList) {
        LeadTriggerHelper.assignLeadSourceToCampaign(newLeadList);
    }

}