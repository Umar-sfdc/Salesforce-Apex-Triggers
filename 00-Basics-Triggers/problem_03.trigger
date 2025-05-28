trigger AccountTrigger on Account (after insert){

/* 

    Q) When the Account is Created, create a Task Record under that Account and assign the Task to the Account Owner. Use the below information

    Subject – Created from Apex Trigger
    Comments – Created from Apex Trigger
    Due Date – Todays Date + 7
    Status – Not Started
    Priority – High
    Related To (What) – Account Id
    Assigned To (OwnerId) – Account Owner Id


*/
    
    // To prevent from governace limit & DML transaction limit.
    List<Task> listOfTask = new List<Task>();
    
    for(Account acc : trigger.New) {
        Task t = new Task();
        
        t.Subject = 'Created from Apex Trigger';
        t.Description = 'Created from Apex Trigger';
        t.ActivityDate = System.today().addDays(7);
        t.Status = 'Not Started';
        t.Priority = 'High';
        t.WhatId = acc.Id;
        t.OwnerId = acc.OwnerId;
        
        listOfTask.add(t);
        
    }
    
    insert listOfTask;
     
    /* 

    List<Account> bulkAccount = new List<Account>();

    for(Integer i=0; i<=10;  i++)
    {
        Account acc = new Account();
        
        acc.Name = 'Account Trigger ' + i;
        acc.Rating = 'Hot';
        bulkAccount.add(acc);
    }

    insert bulkAccount;

    */
    
}



