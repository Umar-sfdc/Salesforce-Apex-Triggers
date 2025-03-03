trigger AccountTrigger on Account(before insert) { 
    
    /* 
        
        Q)  Develop an Apex Trigger so that every time any account is inserted then set the value of the Industry field to Education if the Industry field is blank. Also, check if the Description is blank then set the value for the description field to “Account Description is blank”
    
        Solution : 
    
        Which Object ?
            - Account
        
        Which Event ?
            - Before insert
        
        which functionality ?
            - set the value of the Industry field to Education
            - check if the Description is blank then set the value for the description field to “Account Description is blank”
        
    */
        
        for(Account acc : trigger.new) 
        {
            acc.Industry = 'Education';
            if(acc.Description == null){
                acc.Description = 'Description was blank!';
            }
        }
                
        
    }
