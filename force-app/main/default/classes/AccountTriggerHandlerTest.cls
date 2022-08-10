@isTest
private class AccountTriggerHandlerTest {
    static testmethod void onBeforeInsertOrUpdateTestNull() {
        List<Account> accs = new List<Account>();
        Account acc = new Account(
                Name='Teste Type null',
                RecordTypeId='0128V000001NjIRQA0',
                Type='',
                AccountNumber='86.473.570/0001-14'
            );
        accs.add(acc);
        
        Test.startTest();
		
        try {
            if(accs.size() > 0){
                insert(accs);
            }
        } catch(Exception error) {
            system.assert(error.getMessage().contains('Selecione um tipo de Conta!'));
        }
        
        Test.stopTest();
    }
    static testmethod void onBeforeInsertOrUpdateTestInvalidCPF() {
        List<Account> accs = new List<Account>();
        Account acc = new Account(
                Name='Teste Type null',
                RecordTypeId='0128V000001NjIRQA0',
                Type='CPF',
                AccountNumber='86.473.570/0001-14'
            );
        accs.add(acc);
        
        Test.startTest();
		
        try {
            if(accs.size() > 0){
                insert(accs);
            }
        } catch(Exception error) {
            system.assert(error.getMessage().contains('Número do cliente é inválido'));
        }
        
        Test.stopTest();
    }
    static testmethod void onBeforeInsertOrUpdateTestInvalidCNPJ() {
        List<Account> accs = new List<Account>();
        Account acc = new Account(
                Name='Teste Type null',
                RecordTypeId='0128V000001NjIRQA0',
                Type='CNPJ',
                AccountNumber='591.347.321-36'
            );
        accs.add(acc);
        
        Test.startTest();
		
        try {
            if(accs.size() > 0){
                insert(accs);
            }
        } catch(Exception error) {
            system.assert(error.getMessage().contains('Número do cliente é inválido'));
        }
        
        Test.stopTest();
    }
}