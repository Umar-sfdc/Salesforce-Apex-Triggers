public with sharing class OpportunityTriggerHandler {
    
    public static void handleBeforeInsert(List<Opportunity> newOppList) {
        OpportunityTriggerHelper.preventOpportunityStageAmountNotNull(newOppList);
    }


    public static void handleBeforeUpdate(List<Opportunity> newOppList) {
        OpportunityTriggerHelper.preventOpportunityStageAmountNotNull(newOppList);
    }

    public static void handleAfterInsert(List<Opportunity> newOppList, Map<Id, Opportunity> oldOppMap) {
        OpportunityTriggerHelper.trackHighValuesOpportunity(newOppList, oldOppMap);
    }   

    public static void handleAfterUpdate(List<Opportunity> newOppList, Map<Id, Opportunity> oldOppMap) {
        OpportunityTriggerHelper.trackHighValuesOpportunity(newOppList, oldOppMap);
    }   

}