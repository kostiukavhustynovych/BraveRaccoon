public with sharing class Logger {
    public static void log(Database.BatchableContext context, Exception ex,System.LoggingLevel logLevel) {
         Id JobId = context.getJobId();
        Test__e test = new Test__e (
             Message__c=ex.getMessage(),
       User_Name__c=UserInfo.getName(),
       Stack_trace_String__c=ex.getStackTraceString(),
       Logging_lavel__c=logLevel.name(),
       Context_Id__c=context.getJobId(),
       Context_Name__c=VacancyBatchScheduler.VACANCY_BATCH_SCHEDULE_JOB
        );
        EventBus.publish(test);

        //Log__c log = new Log__c ();
       //  log.Message__c=ex.getMessage();
       //  log.User_Name__c=UserInfo.getName();
       //  log.Stack_trace_String__c=ex.getStackTraceString();
       //  log.Logging_lavel__c=logLevel.name();
       //  log.Context_Id__c=context.getJobId();
       //  log.Context_Name__c=ex.getCause().getMessage();
       throw ex;

    }
    public static void log(String message,System.LoggingLevel logLevel) {
        Log__c log = new Log__c ();
       // log.Message_c='batch finished successfully' Context_Name__c  ‘batch: <<name of the batch>>.’;
       Test__e test = new Test__e (
       Logging_lavel__c=logLevel.name(),
       Message__c=message);
       EventBus.publish(test);
    }
}