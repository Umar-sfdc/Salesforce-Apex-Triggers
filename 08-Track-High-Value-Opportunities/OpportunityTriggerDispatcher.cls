public with sharing class OpportunityTriggerDispatcher {
    public static void dispatch(System.TriggerOperation triggerType) {
        switch on triggerType {
            when AFTER_INSERT {
                OpportunityTriggerHandler.setStageName((List<Opportunity>) Trigger.new);
            }
            when AFTER_UPDATE {

            }
            when else {
                System.debug('Trigger Operation is incorrect!');
            }
        }
    }
}
