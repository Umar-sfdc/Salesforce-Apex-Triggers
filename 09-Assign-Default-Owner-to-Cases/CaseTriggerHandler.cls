public with sharing class CaseTriggerHandler {
   
    public static void handlerBeforeInsert(List<Case> newCaseList, Map<Id, Case> updateCaseList) {
        CaseTriggerHelper.assignDefaultOwnerToCase(newCaseList, updateCaseList);
    }

    public static void handlerBeforeUpdate(List<Case> newCaseList, Map<Id, Case> updateCaseList) {
        CaseTriggerHelper.assignDefaultOwnerToCase(newCaseList, updateCaseList);
    }

}