global class LeadProcessor implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start (Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT id,LeadSource FROM Lead]);
    }
    
    global void execute(Database.BatchableContext BC, List<Lead> scope){
        for(Lead ld: scope){
            ld.LeadSource = 'Dreamforce';
        }
        upsert scope;
    }
    
    global void finish(Database.BatchableContext bc){
       
    }   
    
}