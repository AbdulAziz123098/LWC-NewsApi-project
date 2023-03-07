public Interface ITriggerHandler {
    void beforeInsert(List<SObject> newList);
    void beforeUpdate(List<SObject> newList, List<SObject> oldList, Map<Id,SObject> newMap, Map<Id,Account> oldMap);

}