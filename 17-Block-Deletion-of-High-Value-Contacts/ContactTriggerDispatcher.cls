public with sharing class ContactTriggerDispatcher {
    public static void dispatch(System.TriggerOperation triggerType ){
        switch on triggerType {
            when BEFORE_DELETE {
                ContactTriggerHandler.handleBeforeDelete((List<Contact>)Trigger.old);
            }
            when else {
                System.debug('Someting went wrong!');
            }
        }
    }
}