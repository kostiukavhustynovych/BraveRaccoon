trigger TestTrigger on Test__e (after insert) {
   
    List<Log__c> logs = new List<Log__c>();
    for (Test__e event :Trigger.New) {
        Log__c log = new Log__c ();
         log.Message__c=event.Message__c;
         log.User_Name__c=event.User_Name__c;
         log.Stack_trace_String__c=event.Stack_trace_String__c;
         log.Logging_lavel__c=event.Logging_lavel__c;
         log.Context_Id__c=event.Context_Id__c;
         log.Context_Name__c=event.Context_Name__c;
        logs.add(log);
    }
    insert logs;
    System.debug(logs);
    
}