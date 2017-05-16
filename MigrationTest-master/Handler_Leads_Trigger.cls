public without sharing class Handler_Leads_Trigger {
    
    public static void isBeforeInsert(List<Lead> TriggerNew){
        Service_Leads_Trigger.CreacionCuentas(TriggerNew);
    }
}