public with sharing class ContactTriggerHandler {
    
    // Before Insert
    public static void handleBeforeInsert(List<Contact> conList) {
        ContactTriggerHelper.capitalizeName(conList);
    }

    // Before Update
    public static void handleBeforeUpdate(List<Contact> conList) {
        ContactTriggerHelper.capitalizeName(conList);
    }
    // After Insert
    public static void handleAfterInsert() {
        
    }

    // After Update
    public static void handleAfterUpdate() {
        
    }

    // After Delete
    public static void handleBeforeInsert() {
        
    }
}