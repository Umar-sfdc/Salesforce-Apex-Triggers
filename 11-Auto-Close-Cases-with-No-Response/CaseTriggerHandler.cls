public with sharing class CaseTriggerHandler {
   
    public static void handlerBeforeInsert(List<Case> newCaseList, Map<Id, Case> updateCaseList) {
        CaseTriggerHelper.assignDefaultOwnerToCase(newCaseList, updateCaseList);
    }

    public static void handlerBeforeUpdate(List<Case> newCaseList, Map<Id, Case> updateCaseList) {
        // Assign Default Owner to Cases
        CaseTriggerHelper.assignDefaultOwnerToCase(newCaseList, updateCaseList);

        // Auto Close Cases with No Response
        CaseTriggerHelper.assignDefaultOwnerToCase(newCaseList, updateCaseList);
    }

}