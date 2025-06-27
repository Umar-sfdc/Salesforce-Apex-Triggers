@isTest
private class LeadTriggerTest {

    @isTest
    static void testLeadSourceUpdateFromCampaign() {
        // STEP 1: Prepare Test Data

        // Create a Campaign record to link with the Lead
        Campaign testCampaign = new Campaign(Name = 'Test Product Launch Campaign', IsActive = true);
        insert testCampaign;

        // Create a new Lead record and link it to the test Campaign
        // using the custom lookup field (e.g., Source_Campaign__c).
        // Do NOT set LeadSource here, as the trigger should set it.
        Lead newLeadFromCampaign = new Lead(
            FirstName = 'Test',
            LastName = 'Lead Custom Campaign',
            Company = 'Custom Campaign Co.',
            // Use the API Name of your custom Lookup(Campaign) field here
            Source_Campaign__c = testCampaign.Id
        );

        // Create another Lead record WITHOUT a linked Campaign
        Lead newLeadWithoutCampaign = new Lead(
            FirstName = 'Another',
            LastName = 'Lead',
            Company = 'Another Org',
            LeadSource = 'Web' // This LeadSource should remain unchanged by the trigger
        );

        // STEP 2: Perform DML Operation (Trigger Execution)
        Test.startTest(); // Begin test context
        insert new List<Lead>{newLeadFromCampaign, newLeadWithoutCampaign}; // Insert both Leads
        Test.stopTest();  // End test context; all triggers and async ops complete

        // STEP 3: Assert the Results

        // Query the Leads from the database to verify changes made by the trigger
        Lead queriedLeadFromCampaign = [SELECT Id, LeadSource, Source_Campaign__c FROM Lead WHERE Id = :newLeadFromCampaign.Id];
        Lead queriedLeadWithoutCampaign = [SELECT Id, LeadSource, Source_Campaign__c FROM Lead WHERE Id = :newLeadWithoutCampaign.Id];

        // Verify that the Lead linked to a Campaign has the correct LeadSource
        System.assertEquals('Marketing Campaign', queriedLeadFromCampaign.LeadSource,
                            'LeadSource should be "Marketing Campaign" when Source_Campaign__c is populated.');
        System.assertEquals(testCampaign.Id, queriedLeadFromCampaign.Source_Campaign__c,
                            'Source_Campaign__c should remain populated with the Campaign Id.');


        // Verify that the Lead without a linked Campaign retains its original LeadSource
        System.assertEquals('Web', queriedLeadWithoutCampaign.LeadSource,
                            'LeadSource should remain "Web" when Source_Campaign__c is null.');
        System.assertEquals(null, queriedLeadWithoutCampaign.Source_Campaign__c,
                            'Source_Campaign__c should remain null.');
    }
}