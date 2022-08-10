@isTest
private class DailyAccountProcessorTest {
	public static String CRON_EXP = '0 0 0 15 3 ? 2023';
    
    @testSetup
    static void setup() {
        List<Account> accs = new List<Account>();
        
        for(Integer index = 0; index < 10; index++) {
            Account acc = new Account(
                Name='AccountTest'+index,
                Type='CPF',
                AccountNumber='114.315.646-30'
            );
            accs.add(acc);
        }
        
        if(accs.size() > 0) {
            insert accs;
        }
    }
    static testmethod void testScheduledJob() {
        Test.startTest();
        
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP,
            new DailyAccountProcessor());
        
        List<Account> accs = [SELECT Id FROM Account WHERE Name LIKE '%AccountTest%' AND Inativa__c = true];
        System.assertEquals(0, accs.size());

        Test.stopTest();
        
        accs = [SELECT Id FROM Account WHERE Name LIKE '%AccountTest%' AND Inativa__c = true];
        
        System.assertEquals(10,accs.size());
    }
}