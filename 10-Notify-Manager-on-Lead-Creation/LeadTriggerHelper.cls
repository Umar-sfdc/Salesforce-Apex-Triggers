public with sharing class LeadTriggerHelper {
    public static void sendEmailToUser(List<Lead> newLeadList) {

        List<Messaging.SingleEmailMessage> messagesTOSend = new List<Messaging.SingleEmailMessage>();

        String nextEmailBody = '';
        nextEmailBody += '\n\nA warm welcome to Learners Academy! We are absolutely thrilled to have you join us for the Salesforce Development!';
        nextEmailBody += '\nAt Learners Academy, we are dedicated to providing you with an enriching and empowering learning experience. Our goal is to help you [briefly state the main benefit or outcome of the course, e.g., master new Salesforce Admin & Development Course].';
         nextEmailBody += '\n\nWe\'re excited to see you thrive in Saleforce Development!';
         nextEmailBody += '\n\n\nThank You,';

        // NOTE : i am writing all the email code in this file, but don't do it in the same file
        // create a new class  Email Utility & call the method send the email.
        for(Lead ld : newLeadList) {
            if(ld.Id != null && ld.Address.country == 'India') {
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                email.targetobjectid(ld.Id);
                email.setSubject('Welcome to LERNERS ACCADEMY! Your Next Step Towards education!');
                
                String emailBody = 'Hi  ' + ld.FirstName + ld.LastName + ',';
                emailBody += nextEmailBody;
                email.plaintextbody(emailBody);
                email.setSenderDisplayName('LEARNERS ACCADEMY');
                email.setSaveAsActivity(false);
                messagesTOSend.add(email);
            }
        }

        try {
            Messaging.sendEmail(messagesTOSend);
        } catch(EmailException e) {
            System.debug('Problem while sending Emails : ' + e.getMessage());
            System.debug('Resovle the problem at : ' + e.getStackTraceString());
        }


    }


}