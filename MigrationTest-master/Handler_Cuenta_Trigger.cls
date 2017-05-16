public without sharing class Handler_Cuenta_Trigger {
    
    public static void isAfterInsert(List<Account> TriggerNew, Map<id,Account> TriggerOldMap){
        Service_Cuenta_Trigger.CreacionOportunidades(TriggerNew, TriggerOldMap);
    }
}