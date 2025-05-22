public with sharing class ContactTriggerHelper {
    
    public static void capitalizeName(List<Contact> conList) {

        for(Contact con : conList)
        {
            con.FirstName = formatName(con.FirstName);
            con.LastName = formatName(con.LastName);
        }


    }

    public static String formatName(String name) {
        name = name.trim();
        if(name.length() === 0) return name;
        return name.substring(0,1).toUpperCase() + name.substring(1).toLowerCase();
    }

}