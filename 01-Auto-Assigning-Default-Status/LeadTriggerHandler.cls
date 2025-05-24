public class LeadTriggerHandler {
	
    public static void handlerBeforeInsert(List<Lead> leadList) {
        for(Lead ld : leadList) {
            if(ld.LeadSource == null) {
                ld.LeadSource = 'Web';
            }
        }
    }
    
    public static void handlerBeforeUpdate(List<Lead> leadList, Map<Id, Lead> oldLeadMap) {
        
        for (Lead newLead : leadList) {
            String oldSource = oldLeadMap.get(newLead.Id).LeadSource;
            
            if (String.isBlank(newLead.LeadSource) && String.isBlank(oldSource)) {
                newLead.LeadSource = 'Web';
            }
        }
        
    }
    
}