trigger AssetCodeGenerator on Asset__c (before insert) {
    Asset_Code_Setting__c setting = Asset_Code_Setting__c.getInstance('Default');
    
    if (setting == null) {
        setting = new Asset_Code_Setting__c(Name = 'Default', Last_Number__c = 0);
        insert setting;
    }

    Integer counter = setting.Last_Number__c;

    for (Asset__c asset : Trigger.new) {
        counter++;
        asset.Asset_Code__c = 'ASSET-' + String.valueOf(counter).padLeft(3, '0');
    }

    setting.Last_Number__c = counter;
    update setting;
}
