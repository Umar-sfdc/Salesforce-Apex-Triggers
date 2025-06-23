public with sharing class OpportunityTriggerHelper {

    public static void preventOpportunityStageAmountNotNull(List<Opportunity> newOppList) {

        for(Opportunity opp : newOppList) {
            if(opp.StageName == 'Closed Won' && (opp.Amount == null || opp.Amount == 0)) {
                opp.StageName.addError('You Can\'t change the stage name without Empty Amount filed!');
                opp.Amount.addError('Please Fill the Amount Field!');
                opp.addError('You cannot set an Opportunity to "Closed Won" if the Amount is blank or zero. Please enter a valid Amount.');
            }
        }

    }
}