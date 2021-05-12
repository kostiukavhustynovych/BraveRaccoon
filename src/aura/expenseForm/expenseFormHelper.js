/**
 * Created by 1 on 10.05.2021.
 */

({
    createExpense: function (component, newExpense) {
        let createEvent = component.getEvent("createExpense");
        createEvent.setParams({"expense":newExpense});
        createEvent.fire();
    },
});