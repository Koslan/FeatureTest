@isTest
private class MixedDMLFutureTest {
    @isTest static void test1() {
        User thisUser = [SELECT Id From User Where Id = :UserInfo.getUserId()];

        System.runAs(thisUser) {
            Test.startTest();
            MixedDMLFuture.useFutureMethod();
            Test.stopTest();
        }

        Account[] accts = [SELECT Id from Account WHERE Name='Acme'];
        System.assertEquals(1, accts.size());
        // Verify user is inserted
        User[] users = [SELECT Id from User where username='mruiz@awcomputing.com'];
        System.assertEquals(1, users.size());
    }
}
