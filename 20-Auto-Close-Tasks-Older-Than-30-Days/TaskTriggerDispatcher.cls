public with sharing class TaskTriggerDispatcher {
    public static void dispatch(System.TriggerOperation triggerType) {
        switch on triggerType {
            when BEFORE_INSERT {
                System.debug('Future Code!');
            }
            when BEFORE_UPDATE {
                TaskTriggerHandler.handleBeforeUpdate((List<Task>) Trigger.new);
            }
            when else {
                System.debug('Error : Trigger Event Not recognized!');
            }
        }
    }
}
