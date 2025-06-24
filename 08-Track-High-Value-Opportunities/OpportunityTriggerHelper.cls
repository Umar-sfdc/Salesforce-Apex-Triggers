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

    public static void trackHighValuesOpportunity(List<Opportunity> newOppList, Map<Id, Opportunity> oldOppMap) {

        List<Id> oppIds = new List<Id>();
        List<High_Value_Log__c> toCreateLogs = new List<High_Value_Log__c>();


         
        // This is will run for both after insert, after update.
        for(Opportunity opp : newOppList) {
            
            // skip the opportunity when amount field is not change.
          	if(opp.Amount == oldOppMap.get(opp.Id).Amount) continue;
            if(opp.Id != null && opp.Amount >= 100000) {
                oppIds.add(opp.Id);
            }
        }

        List<Opportunity> toCreateHighValueLogs = [SELECT Name, Account.Name, Amount, StageName, OwnerId, Description
                                                   FROM Opportunity
                                                   WHERE Id =: oppIds];

        for(Opportunity opp : toCreateHighValueLogs) {

            High_Value_Log__c currentLog = new High_Value_Log__c();
            currentLog.Account_Name__c = opp.Account.Name;
            currentLog.Amount__c = opp.Amount;
            currentLog.OwnerId = opp.OwnerId;
            currentLog.Note__c = opp.Description;
            currentLog.Opportunity__c = opp.Id;
            currentLog.Opportunity_Name__c = opp.Name;
            currentLog.Opporutnity_Stage__c = opp.StageName;

            toCreateLogs.add(currentLog);
        }

        try {
            INSERT  toCreateLogs;

        } catch(DmlException e) {
            System.debug('Someting went wrong!'+e.getMessage());
            System.debug('Problem Occure during insering High_Value_log in : '+ e.getStackTraceString());
        }
         
     }
}                                   
