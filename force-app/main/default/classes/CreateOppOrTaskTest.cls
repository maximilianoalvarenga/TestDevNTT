@isTest
private class CreateOppOrTaskTest {
	@testSetup
    static void setup() {
        List<Account> accs = new List<Account>();
        List<RecordType> parceiro = [select Name, Id from RecordType where sObjectType='Account'and Name='Parceiro'];
        List<RecordType> consumidorFinal = [select Name, Id from RecordType where sObjectType='Account'and Name='Consumidor Final'];
        
        for(Integer index = 0; index < 2; index++) {
            Account acc = new Account(
                Name='TesteCreateOpp'+index,
                RecordTypeId=parceiro[0].Id,
                Type='CPF',
                AccountNumber='114.315.646-30'
            );
            accs.add(acc);
        }
        
        for(Integer index = 0; index < 2; index++) {
            Account acc = new Account(
                Name='TesteCreateTask'+index,
                RecordTypeId=consumidorFinal[0].Id,
                Type='CPF',
                AccountNumber='114.315.646-30'
            );
            accs.add(acc);
        }
        
        for(Integer index = 0; index < 2; index++) {
            Account acc = new Account(
                Name='TesteCreateOpp'+index,
                RecordTypeId=parceiro[0].Id,
                Type='CNPJ',
                AccountNumber='86.473.570/0001-14'
            );
            accs.add(acc);
        }
        
        for(Integer index = 0; index < 2; index++) {
            Account acc = new Account(
                Name='TesteCreateTask'+index,
                RecordTypeId=consumidorFinal[0].Id,
                Type='CNPJ',
                AccountNumber='86.473.570/0001-14'
            );
            accs.add(acc);
        }
        
        if (accs.size() > 0) {
        	insert accs;
    	}
    }
    
    static testmethod void createOpportunityTest() {
        List<Opportunity> opp = [SELECT Name from Opportunity WHERE Name LIKE '%TesteCreateOpp%'];
        system.assertEquals(4, opp.size());
    }
    
    static testmethod void createTaskTest() {
        Set<Id> accountsWithTask = new Map<Id, AggregateResult>([
            SELECT WhatId Id FROM Task
            WHERE CreatedDate = LAST_N_DAYS:120
            GROUP BY WhatId
        ]).keySet();
        
        List<Account> accCreated = [select Id, Name, RecordTypeId, Type,AccountNumber  from Account where Name LIKE 'TesteCreateTask%' AND Id In :accountsWithTask];
        system.assertEquals(4, accCreated.size());
    }
}