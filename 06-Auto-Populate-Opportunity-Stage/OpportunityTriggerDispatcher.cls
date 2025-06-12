public with sharing class OpportunityTriggerDispatcher {
    public static void dispatch(System.TriggerOperation triggerType) {
        switch on triggerType {
            when BEFORE_INSERT {
                OpportunityTriggerHandler.setStageName((List<Opportunity>) Trigger.new);
            }
            when BEFORE_UPDATE {

            }
            when else {
                
            }
        }
    }
}