public class ContactSearch {
    
    public static List<Contact> searchForContacts(String LastName, String MailingPostal){
        
      List<Contact> Contactos = [Select ID, FirstName,LastName FROM Contact
                                WHERE LastName =: LastName
                                AND MailingPostalCode =: MailingPostal];
        
        return Contactos;
        
    }

}