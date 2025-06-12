public with sharing class CaseTriggerDispatcher {
    public static void dispatch(System.TriggerOperation triggerType) {
        switch on triggerType {
            when BEFORE_INSERT {
                CaseTriggerHandler.setFollowUpDate((List<Case>)Trigger.new);
            }
            when BEFORE_UPDATE {

            }
            when else {
                System.debug('Error : Someting Went Wrong!');   
            }
        }
    }
}