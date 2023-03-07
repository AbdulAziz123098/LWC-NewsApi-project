public with sharing class AccountTriggerHelper {
    public virtual class BaseException extends Exception {}

    public AccountTriggerHelper(){
        system.debug('Im inside the account trigger helper method');
    }
    public void method1(List<Account> accList){
        List<Account> newAccList = new List<Account>();
        for(Account acc : accList){
            acc.Description = 'This account was modified by a trigger  class';
        }

}

    public void method2(List<Account> newList, Map<Id,Account> oldMap){
        for(Account acc : newList){
           if(acc.Rating != oldMap.get(acc.id).Rating && acc.Rating =='Hot' && oldMap.get(acc.id).Rating != 'Warm' ) {
               
               acc.Rating.addError('You can only move from Warm to Hot and not Cold to Hot');
               acc.Description = 'This account was modified by Method 2';
           }

        }

    }
}