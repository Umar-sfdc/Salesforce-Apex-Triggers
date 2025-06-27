public with sharing class AccountTriggerHelper {
    public static void syncAllAccountPhoneToContact(List<Account> accNewList, Map<Id, Account> accOldMap) {

        Set<Id> accToUpdateId = new Set<Id>();
        List<Contact> conToUpdate = new List<Contact>();
        Map<Id, String> updateAccountPhoneMap = new Map<Id, String>();

        for(Account acc : accNewList) {

            // skipe the record when phone field is null & there is no change in phone field!
            if(acc.Phone == null || (acc.Phone == accOldMap.get(acc.Id).Phone) ) continue;

            // implete the method to set contact phone same as account phone number.
            // double check (prevent from bad recored.)
                accToUpdateId.add(acc.Id);
                updateAccountPhoneMap.put(acc.Id, acc.Phone);
        }

        if(!accToUpdateId.isEmpty()) {
            List<Contact> relatedConToUpdate  = [SELECT Id, Phone, AccountId
                                            FROM Contact
                                            WHERE Id =:accToUpdateId];

            for(Contact con : relatedConToUpdate) {
                String newPhone = updateAccountPhoneMap.get(con.AccountId);
                if(con.Phone != newPhone) {
                    con.Phone = newPhone;
                    conToUpdate.add(con);
                }
            }
        }

        if(!conToUpdate.isEmpty()) {
            try{
                update conToUpdate;
                System.debug('Successfully Updated ' + conToUpdate.size() + 'contact with new phone number\'s');
            }catch(DmlException e) {
                System.debug('Error Update Conatct Phone Number : ' + e.getMessage());
                System.debug('Path This follow to resolve the Error  : ' + e.getStackTraceString());
            }
        }



    }
}