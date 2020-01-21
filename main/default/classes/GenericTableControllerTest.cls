@isTest
public with sharing class GenericTableControllerTest {
    
    @TestSetup
    static void makeData(){
        Account a = new Account(Name='Felipe');
        insert a;
        Contact c = new Contact(LastName='Gouvea', AccountId=a.Id);
        insert c;
    }

    @isTest
    private static void dispatchMethodTest(){
        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        List<Contact> result = GenericTableController.dispatchMethod('ContactManager', accountId, null);
        System.assertEquals(1, result.size());
    }
}