public with sharing class AccountTriggerHandler {
    public static void copyBillingToShipping(List<Account> accounts) {
        for (Account acc : accounts) {
            Boolean isShippingEmpty = 
                acc.ShippingStreet == null &&
                acc.ShippingCity == null &&
                acc.ShippingState == null &&
                acc.ShippingPostalCode == null &&
                acc.ShippingCountry == null;

            if (isShippingEmpty) {
                acc.ShippingStreet     = acc.BillingStreet;
                acc.ShippingCity       = acc.BillingCity;
                acc.ShippingState      = acc.BillingState;
                acc.ShippingPostalCode = acc.BillingPostalCode;
                acc.ShippingCountry    = acc.BillingCountry;
            }
        }
    }
}
