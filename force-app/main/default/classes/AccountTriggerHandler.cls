public with sharing class AccountTriggerHandler implements ITriggerHandler{
    private boolean triggerIsExecuting;
    private integer triggerSize;
    public AccountTriggerHelper helper;
    public AccountTriggerHandler(boolean triggerIsExecuting, integer triggerSize) {
        this.triggerIsExecuting = triggerIsExecuting;
        this.triggerSize = triggerSize;
        this.helper = new AccountTriggerHelper();

    }
    public void beforeInsert(List<SObject> newList){
        helper.method1(newList);
        
    }
    public void beforeUpdate(List<Account> newList, List<SObject> oldList, Map<Id,SObject> newMap, Map<Id,Account> oldMap){
        helper.method1(newList);
        helper.method2(newList,oldMap);
    }
}