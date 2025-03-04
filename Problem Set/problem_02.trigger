trigger AccountTrigger on Account(before insert, before update){

    /* 
    
    Q) Develop an Apex Trigger so that every time when any account is created or updated 
        then Set the Value of the Billing Address is to Shipping Address.
    
    Shipping Address :
    
        ShippingStreet
        ShippingCity
        ShippingState
        ShippingPostalCode
        ShippingCountry
    
    Billing Address :
    
        BillingStreet
        BillingCity
        BillingState
        BillingPostalCode
        BillingCountry
    
    Solution : 
        
            Which Object ?
                - Account
            
            Which Event ?
                - Before update
                   - Before insert
    
            which functionality ?
                - any account is created or updated then Set the Value of
                    the Billing Address is to Shipping Address.
    
            Address Field is an compound filed which standard given by salesforce.
    
    */
        
    for(Account acc : trigger.new) {
            /* 
                Ask Questions if there are any

                - Shall we need to check all the fields are blank and then only update – YES ( AND && )
                - OR if any field is blank then update all the fields – YES ( OR || )
                - OR if any field is blank then only update that field value
                    nested if else for individual fields
            */

       
        	if (acc.BillingStreet != null || acc.BillingCity != null || acc.BillingState != null || acc.BillingPostalCode != null || acc.BillingCountry != null) {
            if (acc.ShippingStreet == null) {
                acc.ShippingStreet = acc.BillingStreet;
            }
            if (acc.ShippingCity == null) {
                acc.ShippingCity = acc.BillingCity;
            }
            if (acc.ShippingState == null) {
                acc.ShippingState = acc.BillingState;
            }
            if (acc.ShippingPostalCode == null) {
                acc.ShippingPostalCode = acc.BillingPostalCode;
            }
            if (acc.ShippingCountry == null) {
                acc.ShippingCountry = acc.BillingCountry;
            }
        }
        
    }
    
}
