public class CreateOppOrTask {
    public static void createOpportunity(Map<Id, Account> newMap) {
        List<Opportunity> opps = new List<Opportunity>();
        for(Account acc : newMap.values()) {
            List<RecordType> parceiro = [select Name, Id from RecordType where sObjectType='Account'and Name='Parceiro'];
            
            if(acc.recordTypeId == parceiro[0].Id) {
                Opportunity opp = new Opportunity(
                AccountId=acc.id,
                Name = acc.Name + '-opp Parceiro',
                StageName = 'Qualification',
        		CloseDate = Date.today().addDays(30));
                
                opps.add(opp);
            }
        }
        
        if (opps.size() > 0) {
        	insert opps;
    	}
    }
    
    public static void createTask(Map<Id, Account> newMap) {
        List<Task> tasks = new List<Task>();
        for(Account acc : newMap.values()) {
            List<RecordType> consumidorFinal = [select Name, Id from RecordType where sObjectType='Account'and Name='Consumidor Final'];

            if(acc.recordTypeId == consumidorFinal[0].Id) {
                Task tas = new Task(
                	Subject = 'Consumidor Final',
                    WhatId = acc.id,
                    Status = 'Not Started',
                    Priority = 'Normal');
                
                tasks.add(tas);
            }
        }
        
        if (tasks.size() > 0) {
        	insert tasks;
    	}
        
    }
}