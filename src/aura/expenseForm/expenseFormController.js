/**
 * Created by 1 on 10.05.2021.
 */

({
    clickCreate: function (component,event,helper) {
        let validExpense = component.find('expenseform').reduce(function(validSoFar, inputCmp){
           // inputCmp.showHelpMesageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        },true);
        if(validExpense) {
            let newExpense = component.get("v.newExpense");
            console.log("Create expense: "+ JSON.stringify(newExpense));
            helper.createExpense(component,newExpense);
        }
    }
});