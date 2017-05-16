global class Batch_Campania_CEC_Asignacion implements Database.batchable<sObject>{ 
    
    private Integer total = 0;
    public String Query {get;set;} 
    
    
    
    //Parametro para el envio de el id de la campaña desde el boton controlador.
    global Batch_Campania_CEC_Asignacion(){
        
        
        Query='SELECT id,BarraBatch__c FROM Opportunity LIMIT 6000';
        
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        //Query almacenado en el campo Query__c del la campaña CEC
        
        
        return Database.getQueryLocator(Query);
    }
    
    global void execute(Database.BatchableContext BC, List<Opportunity> scope){
        System.debug('2:::CreacionRegistros:::Entro execute::Num Registros::'+scope.size());
        total+=scope.size();
        Integer scopeSize = scope.size(); 
        delete scope;
        
    }
    
    global void finish(Database.BatchableContext BC){
        
        AsyncApexJob a = [SELECT Id, Status, MethodName,NumberOfErrors, JobItemsProcessed,
                          TotalJobItems,ExtendedStatus, CreatedBy.Email
                          FROM AsyncApexJob WHERE Id =
                          :BC.getJobId()];
        // Send an email to the Apex job's submitter notifying of job completion.
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'jhovanny.dela.cruzc@gmail.com'};
            mail.setToAddresses(toAddresses);
        mail.setSubject('Apex Batch Completed ' + a.Status);
        mail.setPlainTextBody
            ('The batch Apex job processed ' + a.TotalJobItems +
             ' batches with '+ a.NumberOfErrors + ' failures.MethodName: '+a.MethodName+' .Extended Status: '+a.ExtendedStatus+'. Number Records:'+total);
        try{
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }catch(Exception e){}
    }
}