public with sharing class OpportunityTriggerDispatcher {
    
    public static void dispatch(System.TriggerOperation triggerType) {

        switch on triggerType {
            when BEFORE_INSERT {
                OpportunityTriggerHandler.handleBeforeInsert((List<Opportunity>) Trigger.new);
            }

            when BEFORE_UPDATE {
                OpportunityTriggerHandler.handleBeforeUpdate((List<Opportunity>) Trigger.new);
            }
            when else {
                System.debug('Someting went wrong!');
            }
        }

    }
}