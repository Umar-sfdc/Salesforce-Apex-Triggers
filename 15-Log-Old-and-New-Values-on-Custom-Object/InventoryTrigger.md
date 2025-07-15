# Inventory Trigger

### ✅ Problem Recap:

* **Trigger Object**: `Inventory__c`
* **Event**: `after update`
* **Action**: Create `Change_Log__c` records
* **Fields to log**:

  * `Old_Quantity__c`
  * `New_Quantity__c`
  * `Inventory__c` (Lookup to original record)

---

### 🧩 Assumptions:

Your custom object **Change\_Log\_\_c** has the following fields:

| Field API Name    | Type     | Description                       |
| ----------------- | -------- | --------------------------------- |
| `Inventory__c`    | Lookup   | Lookup to Inventory\_\_c          |
| `Old_Quantity__c` | Number   | Stores old value of Quantity\_\_c |
| `New_Quantity__c` | Number   | Stores new value of Quantity\_\_c |
| `Change_Date__c`  | DateTime | (Optional) Date/Time of change    |

---

### ✅ Trigger: `InventoryTrigger.trigger`

```apex
trigger InventoryTrigger on Inventory__c (after update) {
    List<Change_Log__c> logsToInsert = new List<Change_Log__c>();

    for (Inventory__c inv : Trigger.new) {
        Inventory__c oldInv = Trigger.oldMap.get(inv.Id);

        // Only log if Quantity__c was actually changed
        if (inv.Quantity__c != oldInv.Quantity__c) {
            Change_Log__c log = new Change_Log__c(
                Inventory__c = inv.Id,
                Old_Quantity__c = oldInv.Quantity__c,
                New_Quantity__c = inv.Quantity__c,
                Change_Date__c = System.now()
            );
            logsToInsert.add(log);
        }
    }

    if (!logsToInsert.isEmpty()) {
        insert logsToInsert;
    }
}
```

---

### 🧪 Optional: Test Class Snippet

```apex
@isTest
private class InventoryTriggerTest {
    @isTest static void testInventoryQuantityChangeLogging() {
        Inventory__c inv = new Inventory__c(Name = 'Test Inv', Quantity__c = 10);
        insert inv;

        inv.Quantity__c = 25;
        update inv;

        List<Change_Log__c> logs = [SELECT Id, Old_Quantity__c, New_Quantity__c FROM Change_Log__c WHERE Inventory__c = :inv.Id];
        System.assertEquals(1, logs.size());
        System.assertEquals(10, logs[0].Old_Quantity__c);
        System.assertEquals(25, logs[0].New_Quantity__c);
    }
}
```

---

### ✅ Summary:

* Logs only when `Quantity__c` changes.
* Stores values in `Change_Log__c`.
* Use `after update` because you're creating related records.
