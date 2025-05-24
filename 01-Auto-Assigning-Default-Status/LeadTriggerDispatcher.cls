public class LeadTriggerDispatcher {
    
    public static void dispatch(System.TriggerOperation triggerType) {
		
        switch on triggerType {
            when BEFORE_INSERT {
               LeadTriggerHandler.handlerBeforeInsert((List<Lead>)Trigger.new);
            }
            
            when BEFORE_UPDATE {
                LeadTriggerHandler.handlerBeforeUpdate((List<Lead>)Trigger.new, (Map<Id, Lead>)Trigger.oldMap);
            }
            
            when AFTER_INSERT {
                
            }
            
            when AFTER_UPDATE {
                
            }
            
            when else {
                
            }
        }
        
    }
}