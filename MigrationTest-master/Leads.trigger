trigger Leads on Lead (before insert) {
    if(Trigger.isInsert && Trigger.isBefore){
        Handler_Leads_Trigger.isBeforeInsert(Trigger.New);
    }
}