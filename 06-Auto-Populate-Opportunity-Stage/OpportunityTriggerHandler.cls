public with sharing class OpportunityTriggerHandler {
    public static void setStageName(List<Opportunity> oppList) {
        for(Opportunity opp : oppList) {
            if(String.isBlank(opp.StageName)) {
                opp.StageName = 'Prospecting';
            }
        }
    }
}