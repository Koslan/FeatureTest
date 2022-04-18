public  class Util {
    @future    
    public static void insertUserWithRole(String uname, String al, String em, String lname) {

            Profile p = [SELECT Id FROM Profile WHERE Name ='Standard User'];
            UserRole r = [SELECT Id From UserRole WHERE Name = 'COO'];

            User u = new User(alias = al, email= em, emailencodingkey='UTF-8',
                lastname=lname,
                languagelocalekey='en_US',
                profileid = p.id,
                userroleid = r.Id,
                timezonesidkey='America/Los_Angeles',
                username=uname);
            insert u;                
    }
}
