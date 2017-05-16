trigger ExampleTrigger on Contact (After insert, After delete) {
    if(Trigger.isInsert){
        Integer recordCount = Trigger.New.size();
        EmailManager.sendMail('jhovanny0208@gmail.com', 'Trailhead Trigger Tutorial', recordCount+ ' contact(s) were inserted');
    }else if(Trigger.isDelete){
        //Process after delete
    }

}