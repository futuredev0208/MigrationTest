public without sharing class Handler_User_Trigger {
    public static Boolean Bandera = true;
    public static void isAfterUpdate(List<User> TriggerNew,Map<id,User> TriggerOldMap){
        Service_User_Trigger.ActualizamosApuntadorRoundRobin(TriggerNew, TriggerOldMap);
    }

}