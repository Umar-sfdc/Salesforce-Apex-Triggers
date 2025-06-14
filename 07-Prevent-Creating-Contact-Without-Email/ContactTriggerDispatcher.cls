public with sharing class ContactTriggerDispatcher {
    public static void dispatch(System.TriggerOperation triggerType) {
        switch on triggerType {
            when BEFORE_INSERT {
                ContactTriggerHandler.handleBeforeInsert((List<Contact>) Trigger.new);
            }
            when BEFORE_UPDATE {
                ContactTriggerHandler.handleBeforeUpdate((List<Contact>) Trigger.new);
            }
            when else {
                
            }
        }
    }
}