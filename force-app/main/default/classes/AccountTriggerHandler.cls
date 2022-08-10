public class AccountTriggerHandler {
    public static void onAfterInsert(Map<Id, Account> newMap) {
        CreateOppOrTask.createOpportunity(newMap);
        CreateOppOrTask.createTask(newMap);
    }
    
    public static void onBeforeInsertOrUpdate(List<Account> accs) {
        for(Account acc : accs) {
                if(acc.Type == '' || acc.Type == null) {
                    acc.Type.addError('Selecione um tipo de Conta!');
                }else if(acc.Type == 'CPF') {
                    Boolean isValid = Utils.ValidaCPF(acc.AccountNumber);
                    if(!isValid) {
                        acc.AccountNumber.addError('Número do cliente é inválido');
                    }     
                }else if(acc.Type == 'CNPJ') {
                    Boolean isValid = Utils.ValidaCNPJ(acc.AccountNumber);
                    if(!isValid) {
                        acc.AccountNumber.addError('Número do cliente é inválido');
                    }
                }
            }
    }
}