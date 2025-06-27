public with sharing class LeadTriggerHelper {

    public static void assignLeadSourceToCampaign(List<Lead> newLeadList) {
     // This trigger will execute BEFORE a new Lead record is inserted.
    // It's designed to automatically set the LeadSource based on a linked Campaign.

    // Loop through each Lead record that is being inserted in this transaction.
    for (Lead newLead : Trigger.new) {
        // Check if the custom lookup field 'Source_Campaign__c' (or whatever you named it)
        // is populated on the new Lead record.
        // This field establishes a direct link from the Lead to a Campaign.
        if (newLead.Source_Campaign__c != null) {
            // If a Source Campaign is linked, set the LeadSource field to 'Marketing Campaign'.
            // This change occurs in memory before the record is saved to the database.
            newLead.LeadSource = 'Marketing Campaign';
        }
    }
    }
}