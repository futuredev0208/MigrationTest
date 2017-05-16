public class NewCaseListController {
    
    private String status {get;set;}
    
    public List<Case> getNewCases(){
        List<Case> Casos = new List<Case>();
        Casos=[Select id,CaseNumber FROM Case WHERE Status = 'New'];
        return Casos;
    }

}