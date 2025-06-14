public with sharing class AccountTriggerDispatcher {
    public static void dispatch(System.TriggerOperation triggerType) {

        switch on triggerType {
            when BEFORE_INSERT {
                AccountTriggerHandler.handleBeforeInsert((List<Account>) Trigger.new, (Map<Id, Account>)Trigger.oldMap);
            }

            when BEFORE_UPDATE {
                AccountTriggerHandler.handleBeforeUpdate((List<Account>) Trigger.new, (Map<Id, Account>)Trigger.oldMap);
            }
            when else {
                System.debug('Someting went wrong!');
            }
        }

    }
}