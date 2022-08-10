trigger AccountTrigger on Account (before insert, before update, after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        AccountTriggerHandler.onAfterInsert(Trigger.newMap);
    }
    if((Trigger.isBefore && trigger.isInsert) || (Trigger.isBefore && trigger.isUpdate)) {
        AccountTriggerHandler.onBeforeInsertOrUpdate(Trigger.new);
    }
}