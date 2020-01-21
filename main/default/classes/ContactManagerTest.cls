@isTest
public with sharing class ContactManagerTest {
    @TestSetup
    static void makeData(){
        Account a = new Account(Name='Felipe');
        insert a;
        Contact c = new Contact(LastName='Gouvea', AccountId=a.Id);
        insert c;
    }

    @isTest
    private static void callTest(){
        ContactManager manager = new ContactManager();
        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        List<Contact> result = (List<Contact>) manager.call(accountId, null);
        System.assertEquals(1, result.size());
    }
}