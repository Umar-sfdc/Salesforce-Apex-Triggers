public with sharing class CaseTriggerDispatcher {
    
    public static void dispatch(System.TriggerOperation triggerType) {

        switch on triggerType {
            when BEFORE_INSERT {
                CaseTriggerHandler.handlerBeforeInsert((List<Case>) Trigger.new, (Map<Id, Case>) Trigger.oldMap);
            }

            when BEFORE_UPDATE {
                CaseTriggerHandler.handlerBeforeUpdate((List<Case>) Trigger.new, (Map<Id, Case>) Trigger.oldMap);
            }
            when else {
                System.debug('Someting went wrong!');
            }
        }

    }
}