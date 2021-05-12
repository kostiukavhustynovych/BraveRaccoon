/**
 * Created by 1 on 10.05.2021.
 */

public with sharing class CampingListController {
    @AuraEnabled
    public static List<Camping_Item__c> getItems() {
        return [SELECT Name,Price__c,Quantity__c,Packed__c FROM Camping_Item__c];
    }
    @AuraEnabled
    public static Camping_Item__c saveItem (Camping_Item__c newitem) {
        upsert newitem;
        return newitem;
    }
}