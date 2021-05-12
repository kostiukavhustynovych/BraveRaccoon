/**
 * Created by 1 on 10.05.2021.
 */

public with sharing class ExpensesController {
// STERN LECTURE ABOUT WHAT'S MISSING HERE COMING SOON
    @AuraEnabled
    public static List<Expense__c> getExpenses() {
        // Check to make sure all fields are accessible to this user
        String[] fieldsToCheck = new String[] {
                'Id', 'Name', 'Amount__c', 'Client__c', 'Date__c',
                'Reimbursed__c', 'CreatedDate'
        };
        Map<String,Schema.SObjectField> fieldDescribeTokens =
                Schema.SObjectType.Expense__c.fields.getMap();
        for(String field : fieldsToCheck) {
            if( ! fieldDescribeTokens.get(field).getDescribe().isAccessible()) {
                throw new System.NoAccessException();
            }
        }
        return [SELECT Id, Name, Amount__c, Client__c, Date__c,
                Reimbursed__c, CreatedDate
        FROM Expense__c];
    }
    @AuraEnabled
    public static Expense__c saveExpense (Expense__c expense) {
        // Perform isUpdateable() checking first, then
        upsert expense;
        return expense;
    }
}