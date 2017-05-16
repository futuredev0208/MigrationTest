@isTest
private class LeadProcessorTest {
    public static testmethod void contructor(){
        List<Lead> leadList = new List<Lead>();
        for(integer i = 0; i<200; i++){
            Lead leads = new Lead();
            leads.FirstName = 'Ankit';
            leads.LastName = 'Avula'+i;
            leads.Company = 'ARG';
            leadList.add(leads);           
        }
        insert leadList;
        Test.startTest();
        LeadProcessor uca = new LeadProcessor();
        ID batchid	= Database.executeBatch(uca);
        //Database.executeBatch(uca);
        Test.stopTest();
    }
}