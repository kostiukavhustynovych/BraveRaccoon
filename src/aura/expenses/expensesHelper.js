/**
 * Created by 1 on 10.05.2021.
 */

({
    createExpense: function(component, expense) {
        this.saveExpense(component, expense, function(response){
            let state = response.getState();
            if (state === "SUCCESS") {
                let expenses = component.get("v.expenses");
                expenses.push(response.getReturnValue());
                component.set("v.expenses", expenses);
            }
        });
    },
    updateExpense: function(component, expense) {
        this.saveExpense(component,expense);
    },
    saveExpense: function (component, expense, callback) {
        let action = component.get("c.saveExpense");
        action.setParams({
            "expense": expense
        });
        if (callback) {
            action.setCallback(this, callback);
        }
        $A.enqueueAction(action);
    }
})