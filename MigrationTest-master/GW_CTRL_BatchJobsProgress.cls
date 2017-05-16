global class GW_CTRL_BatchJobsProgress {
 
    private List<BatchJob> batchJobs;
    
	/*Numero de trabajos apex que se mostraran en la tabla de progreso*/
    global Integer numberOfJobs {get; set;}

	/* Titulo Trabajos Apex*/ 	
    global String batchComponentLabel {get; set;}
 
	/*
    Consulta para los trabajos apex en proceso
	*/ 	
    global List<BatchJob> getBatchJobs() {
        batchJobs = new List<BatchJob>();
 
        //Si no  se define un numemero de trabajos apex el default sera de 20
        if(numberOfJobs== null || numberofJobs <= 0) {
            numberofJobs = 20;
        }
        
        if(batchComponentLabel== null) {
            batchComponentLabel = 'Trabajos Apex.';
        }
 
        //Consulta de trabajos apex.
        for(AsyncApexJob a : [select TotalJobItems, Status, NumberOfErrors, MethodName, JobType, JobItemsProcessed, Id, 
        							CreatedDate, CreatedById, CompletedDate, ApexClassId, ApexClass.Name 
        							From AsyncApexJob WHERE ApexClass.Name = 'Batch_Campania_CEC_Asignacion' order by CreatedDate desc limit :numberOfJobs]) {
            Double itemsProcessed = a.JobItemsProcessed;
            Double totalItems = a.TotalJobItems;
 
            BatchJob j = new BatchJob();
            j.job = a;
 
            //Determina el porcentaje el batch dependiendo de los lotes que a completado.
            if(a.status == 'Completed') {
            	j.percentComplete = 100;
            //Determina el porcentaje el batch dependiendo de los lotes que a completado.
            } else if (totalItems == 0) {
                //Comprobacion de division entre 0
                j.percentComplete = 0;
            } else {
                j.percentComplete = ((itemsProcessed  / totalItems) * 100.0).intValue();
            }
 
            batchJobs.add(j);
        }
        return batchJobs;
    }
 
    
	 	
    global Class BatchJob{
        global AsyncApexJob job {get; set;}
        global Integer percentComplete {get; set;}
    }
    
}