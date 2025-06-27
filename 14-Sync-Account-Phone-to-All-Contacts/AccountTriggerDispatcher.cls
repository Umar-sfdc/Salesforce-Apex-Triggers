public with sharing class AccountTriggerDispatcher {
    public static void dispatch(System.TriggerOperation triggerType) {

        switch on triggerType {
            when AFTER_INSERT {
                AccountTriggerHandler.handleAfterInsert((List<Account>) Trigger.new, (Map<Id, Account>) Trigger.oldMap);
            }
            when AFTER_UPDATE {
                AccountTriggerHandler.handleAfterUpdate((List<Account>) Trigger.new, (Map<Id, Account>) Trigger.oldMap);
            }
            when else {
                System.debug('Someting went wrong!');
            }
        }
    }
}