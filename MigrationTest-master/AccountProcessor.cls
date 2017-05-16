public class AccountProcessor {
    @Future
    public static void countContacts(Set<id> AccountIDs){
        List<Account> CuentasContactos=[SELECT id,Number_of_Contacts__c , (SELECT id FROM Contacts) FROM Account WHERE id IN: AccountIDs];
        for(Account acc: CuentasContactos){
            List<Contact> Contactos = acc.Contacts;
            acc.Number_of_Contacts__c = Contactos.size();
        }
        upsert CuentasContactos;
    }
}