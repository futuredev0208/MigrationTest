public class ContactAndLeadSearch {

    public static List<List<sObject>> searchContactsAndLeads(String Palabra){
        
        List<List<sObject>> ListaBusqueda = [FIND :Palabra IN ALL FIELDS RETURNING Contact(FirstName,LastName), Lead(FirstName,LastName)];
        
        return ListaBusqueda;
        
    }
}