trigger trigOnAccount on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    if(Org_Specific_Settings__mdt.getInstance('Run_All_Triggers').Value__c == true){
        ITriggerHandler handler = new AccountTriggerHandler(Trigger.isExecuting, Trigger.size);
        switch on Trigger.operationType{
            when BEFORE_INSERT{
                handler.beforeInsert(Trigger.new);
            }
            when BEFORE_UPDATE{
                handler.beforeUpdate(Trigger.new,Trigger.old, Trigger.newMap, Trigger.oldMap);
            }
        }
    }

}