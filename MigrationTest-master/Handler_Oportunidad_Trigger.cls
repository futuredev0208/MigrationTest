public without sharing class Handler_Oportunidad_Trigger {
    
    public static void isAfterInsert(List<Opportunity> TriggerNew,Map<id,Opportunity> TriggerOldMap){
        Service_Oportunidad_Trigger.AsignacionOportunidadesUsuarios(TriggerNew, TriggerOldMap);
    }
}