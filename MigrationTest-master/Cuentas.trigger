trigger Cuentas on Account (before delete, after insert) {
   
    /*Ejemplo de Trailhear
     * // Prevent the deletion of accounts if they have related opportunities.
    for (Account a : [SELECT Id FROM Account
                     WHERE Id IN (SELECT AccountId FROM Opportunity) AND
                     Id IN :Trigger.old]) {
        Trigger.oldMap.get(a.Id).addError(
            'Cannot delete account with related opportunities.');
    }*/
    
    //Trigger para generar Oportunidades desde la cuenta 
    if(Trigger.isInsert && Trigger.isAfter){
        Handler_Cuenta_Trigger.isAfterInsert(Trigger.New, Trigger.OldMap);
    }
    
}