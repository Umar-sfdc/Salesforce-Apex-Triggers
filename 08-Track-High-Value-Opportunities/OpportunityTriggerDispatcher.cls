public with sharing class OpportunityTriggerDispatcher {
    
    public static void dispatch(System.TriggerOperation triggerType) {

        switch on triggerType {
            when BEFORE_INSERT {
                OpportunityTriggerHandler.handleBeforeInsert((List<Opportunity>) Trigger.new);
            }

            when BEFORE_UPDATE {
                OpportunityTriggerHandler.handleBeforeUpdate((List<Opportunity>) Trigger.new);
            }

            when AFTER_INSERT { 
                OpportunityTriggerHandler.handleAfterInsert((List<Opportunity>) Trigger.new, (Map<Id, Opportunity>) Trigger.oldMap);
            }

            when AFTER_UPDATE {
                OpportunityTriggerHandler.handleAfterUpdate((List<Opportunity>) Trigger.new, (Map<Id, Opportunity>) Trigger.oldMap);
            }
            when else {
                System.debug('Someting went wrong!');
            }
        }

    }
}