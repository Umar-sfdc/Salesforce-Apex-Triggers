public with sharing class OpportunityTriggerHandler {
    
    public static void handleBeforeInsert(List<Opportunity> newOppList) {
        OpportunityTriggerHelper.preventOpportunityStageAmountNotNull(newOppList);
    }


    public static void handleBeforeUpdate(List<Opportunity> newOppList) {
        OpportunityTriggerHelper.preventOpportunityStageAmountNotNull(newOppList);
    }

}