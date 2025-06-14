public with sharing class ContactTriggerHelper {
    public static void checkEmail(List<Contact> conList) {
        for (Contact con : conList) {
            if (String.isBlank(con.Email)) {
                con.Email.addError('Email is required. Please provide an email address to create or update a contact.');
            }
        }
    }
}
