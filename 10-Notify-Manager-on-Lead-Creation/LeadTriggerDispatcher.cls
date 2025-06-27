public with sharing class LeadTriggerDispatcher {
    public static void dispatch(System.TriggerOperation triggerType) {

        switch on triggerType {
            when AFTER_INSERT {
               LeadTriggerHandler.handleAfterInsert((List<Lead>) Trigger.new);
            }
            when else {
                System.debug('Someting went wrong!');
            }
        }
    }
}