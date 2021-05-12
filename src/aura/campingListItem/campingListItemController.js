/**
 * Created by 1 on 09.05.2021.
 */

({
    packItem: function (component,event,helper) {
            component.set("v.item.Packed__c",true);
            let buttonPack = event.getSource();
            buttonPack.set("disabled",true);
    }
});