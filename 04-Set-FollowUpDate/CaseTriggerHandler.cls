public with sharing class CaseTriggerHandler {
   public static void setFollowUpDate(List<Case> casesToUpdate) {
        for(Case cs : casesToUpdate) {
            if(cs.Follow_Up_Date == null) {
                    // HACK : Due to before insert CreateDate is empty we use System.now().
                    // cs.Follow_Up_Date = cs.CreatedDate.addDays(3);
                    cs.Follow_Up_Date = System.now().addDays(3);
                }
        }
    }
}