trigger AssetCodeGenerator on Asset__c (before insert) {
    // Fetch custom metadata record
    Asset_Code_Setting__mdt setting = [
        SELECT Last_Number__c 
        FROM Asset_Code_Setting__mdt 
        WHERE DeveloperName = 'Default' 
        LIMIT 1
    ];

    Integer lastUsedNumber = setting.Last_Number__c;

    // Create a map to hold index-wise tracking
    Integer counter = lastUsedNumber;

    for (Asset__c asset : Trigger.new) {
        counter++;
        asset.Asset_Code__c = 'ASSET-' + String.valueOf(counter).padLeft(3, '0');
    }

    // DML not allowed on Custom Metadata in Apex directly. So use Custom Setting for write access.
    // Or use a future method / Queueable to update outside of trigger context.
}
