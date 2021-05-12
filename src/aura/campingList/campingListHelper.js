/**
 * Created by 1 on 10.05.2021.
 */

({
    createItem: function (component,newitem) {
        let action = component.get("c.saveItem");
        action.setParams({
            "newitem": newitem
        });
        action.setCallback(this, function (response) {
            let state = response.getState();
            if(state==="SUCCESS") {
                let items = component.get("v.items");
                items.push(response.getReturnValue());
                component.set("v.items",items);
                component.set("v.newItem",{'sobjectType': 'Camping_Item__c','Name': '','Quantity__c': 0,
                    'Price__c': 0,'Packed__c': false});
            }
        });
        $A.enqueueAction(action);
    }
});