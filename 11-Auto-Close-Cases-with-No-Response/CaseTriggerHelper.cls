public with sharing class CaseTriggerHelper {
    
    public static void assignDefaultOwnerToCase(List<Case> newCaseList, Map<Id, Case> updateCaseList) {
        
        // logic.
        
        Id queueId = getSupportQueueId('Case', 'Support Queue');
        
        for(Case cs : newCaseList) {
            
            // skip update case when ownerId not change.
            if(cs.Id != null) {
                Case oldCaseRecord = updateCaseList.get(cs.Id);
                if(cs.OwnerId == oldCaseRecord.OwnerId) continue;
            }
            
            if(cs.Id == null) {
                cs.OwnerId = queueId != null ? queueId : cs.CreatedById;
            }
            
            
        }
        
    }
    private static Id getSupportQueueId(String ApiName, String queueName) {
        
        try {
            QueueSObject qs = [SELECT QueueId 
                               FROM QueueSObject
                               WHERE SObjectType =:ApiName AND Queue.Name =: queueName
                               LIMIT 1];
            
            return qs.QueueId;
            
        } catch(Exception e) {
            System.debug('Error fetching Supported Queue Id  : ' + e.getMessage());
            return null;
        }
    }
    
    public static void closedCaseNoResponse(List<Case> newCaseList, Map<Id, Case> updateCaseList) {
    
    String statusToCheck = 'Waiting on Customer';
    
    for (Case cs : newCaseList) {
        Case oldCase = updateCaseList.get(cs.Id);
        
        // Check if the old status was "Waiting on Customer"
        if (
            oldCase.Status == statusToCheck &&                         // Was previously Waiting on Customer
            cs.Status == statusToCheck                                 // Still is
        ) {
            // Check if it's been more than 7 days
            Date lastModifiedDate = oldCase.LastModifiedDate.date();  // From Trigger.old
            if (lastModifiedDate.addDays(7) <= System.today()) {
                cs.Status = 'Closed';
            }
        }
    }
 }

}