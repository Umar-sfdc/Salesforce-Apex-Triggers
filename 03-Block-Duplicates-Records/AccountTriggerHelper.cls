public with sharing class AccountTriggerHelper {
    public static void manageDuplicateRecord(List<Account> accList) {

        List<String> accountNameList = new List<String>();
        List<String> accountRatingList = new List<String>();

        for(Account acc : accList) {
            accountNameList.add(acc.Name);
            accountRatingList.add(acc.Rating);
        }

        List<Account> existingAccountList = [SELECT Id, Name
                                                FROM Account 
                                                WHERE Name IN: accountNameList AND Rating IN: accountRatingList
                                                AND Id NOT IN :existingAccountList
                                                LIMIT 1
                                            ];

        for(Account acc : accList) {
            
            if(existingAccountList.size() > 0 && existingAccountList != null) {
                acc.Name.addError('Account already exist with same name & rating!');
                acc.Rating.addError('Account already exist with same name & rating!');
            }
        }
        
    }
}