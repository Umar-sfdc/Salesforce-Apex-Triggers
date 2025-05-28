trigger UpdateContactFax on Contact (after update) {

/* 

Q) Develop an Apex Trigger that will update the Contact Phone Value to Contact Fax every time a Contact is updated.

*/
    List<Contact> contactsToUpdate = new List<Contact>();

    for (Contact con : Trigger.new) {
        // Check if Phone is updated and is not null
        if (con.Phone != null && con.Phone != Trigger.oldMap.get(con.Id).Phone) {
            con.Fax = con.Phone;  // Copy Phone to Fax
            contactsToUpdate.add(con);
        }
    }

    if (!contactsToUpdate.isEmpty()) {
        update contactsToUpdate;
    }
}
