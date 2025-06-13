public with sharing class AccountTriggerHelper {

    public static void checkDuplicateNameAndRating(List<Account> newAccounts, Map<Id, Account> oldMap) {
    
        Set<String> namesToCheck = new Set<String>();
        Set<String> ratingsToCheck = new Set<String>();
        
        Map<String, List<Account>> keyToNewAccounts = new Map<String, List<Account>>();

        // 1️⃣ Collect all Name + Rating combinations from incoming records
        for (Account acc : newAccounts) {
            String newName = acc.Name != null ? acc.Name.trim().toLowerCase()  :  '';
            String newRating = acc.Rating != null ? acc.Rating : '';

            // Skip updates if Name + Rating didn’t change
            if (oldMap != null && acc.Id != null) {
                Account oldAcc = oldMap.get(acc.Id);
                String oldName = oldAcc != null && oldAcc.Name != null ? oldAcc.Name.trim().toLowerCase() : '';
                String oldRating = oldAcc != null && oldAcc.Rating != null ? oldAcc.Rating : '';

                if (newName == oldName && newRating == oldRating) {
                    continue; // no change, skip checking
                }
            }

	    // Before  : UmarSFDC###Cold
	    // After : MadHost###Hot
            String key = newName + '###' + newRating;
            namesToCheck.add(newName);
            ratingsToCheck.add(newRating);

            if (!keyToNewAccounts.containsKey(key)) {
                keyToNewAccounts.put(key, new List<Account>());
            }
            keyToNewAccounts.get(key).add(acc);
        }

        if (keyToNewAccounts.isEmpty()) return;

        // 2️⃣ Query existing Accounts that match Name + Rating
        List<Account> existingAccounts = [
            SELECT Id, Name, Rating
            FROM Account
            WHERE LOWER(Name) IN :namesToCheck AND Rating IN :ratingsToCheck
        ];

        // 3️⃣ Compare and add errors if duplicate found
        for (Account existing : existingAccounts) {
            String existingKey = (existing.Name != null ? existing.Name.trim().toLowerCase() : '')
                               + '###'
                               + (existing.Rating != null ? existing.Rating : '');

            if (keyToNewAccounts.containsKey(existingKey)) {
                for (Account dupAcc : keyToNewAccounts.get(existingKey)) {
                    dupAcc.addError('An Account with the same Name and Rating already exists: '
                                    + existing.Name + ' (' + existing.Rating + ')');
                }
            }
        }
    }
}
