trigger AccountAddressTrigger on Account (before insert, before update) {
    boolean flag=false;
    for(Account a : Trigger.New){
        if(a.Match_Billing_Address__c){
            flag = true;
        }
        if(flag){
            a.ShippingPostalCode = a.BillingPostalCode;
            
        }
    }

}