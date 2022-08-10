global class DailyAccountProcessor implements Schedulable {
	global void execute(SchedulableContext ctx) {
        List<Account> inactiveAccounts = new List<Account>();
        
        Set<Id> accountsWithTask = new Map<Id, AggregateResult>([
            SELECT WhatId Id FROM Task
            WHERE CreatedDate = LAST_N_DAYS:120
            GROUP BY WhatId
        ]).keySet();
        
        List<Account> accs = [SELECT Name,Id from Account
                              WHERE Id NOT IN (
                                  Select AccountId FROM Opportunity WHERE CloseDate = LAST_N_DAYS:120 AND StageName = 'Closed Won')
                              AND Id NOT IN (Select AccountId FROM Opportunity WHERE  StageName = 'Negotiation/Review')
                              AND id NOT IN :accountsWithTask LIMIT 200];
        
        for(Account acc : accs) {
            acc.Inativa__c = true;
            inactiveAccounts.add(acc);
        }
        
        if(inactiveAccounts.size() > 0) {
            update inactiveAccounts;
		}
    }
}