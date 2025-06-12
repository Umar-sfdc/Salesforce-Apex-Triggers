public with sharing class AccountTriggerDispatcher {
    public static void dispatch(System.TriggerOperation triggerType) {
        switch on triggerType {
            when BEFORE_INSERT {
                AccountTriggerHandler.copyBillingToShipping((List<Account>) Trigger.new);
            }
            when BEFORE_UPDATE {

            }
            when else {
                
            }
        }
    }
}
