trigger Oportunidad on Opportunity (before insert, after update) {
    
    /*Ejercicio Trailhead 
     * List<Task>  tareas = new List<Task>();
    
    
    for(Opportunity Opp:[Select id, Name, StageName FROM Opportunity Where id IN: Trigger.New AND StageName = 'Closed Won' ]){
        
        tareas.add(New Task(Subject = 'Follow Up Test Task', WhatId = Opp.id ));
    }
    Insert Tareas;*/
    if(Trigger.isInsert && Trigger.isBefore){
        Handler_Oportunidad_Trigger.isAfterInsert(Trigger.New,Trigger.oldMap);
    }else if(Trigger.isUpdate && Trigger.isAfter){
        //Handler_Oportunidad_Trigger.isAfterInsert(Trigger.New);
    }
    

}