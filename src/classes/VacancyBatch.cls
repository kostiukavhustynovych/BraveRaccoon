/**
 * Created by OlexandrKrykun on 04.04.2021.
 */

public with sharing class VacancyBatch implements Database.Batchable<SObject> {
  private String batchQuery;
  private String standardQuery = 'Select id from Vacancy__c where status__c = \'closed\' ';

  public VacancyBatch(String query) {
    this.batchQuery = query; 
  }
  public VacancyBatch() {
    this.batchQuery = standardQuery;
  }

  public Database.QueryLocator start(Database.BatchableContext context) {
    return Database.getQueryLocator(this.batchQuery);
  }
  public void execute(
    Database.BatchableContext context,
    List<Vacancy__c> vacancies
  ) {
    //custom
    try {
      List<CronTrigger> CronTrigger = [
              SELECT
                      CreatedById,
                      CreatedDate,
                      CronExpression,
                      CronJobDetail.Name,
                      CronJobDetail.JobType,
                      EndTime,
                      Id,
                      LastModifiedById,
                      NextFireTime,
                      OwnerId,
                      PreviousFireTime,
                      StartTime,
                      State,
                      TimesTriggered,
                      TimeZoneSidKey
              FROM CronTrigger
      ];
      List<AsyncApexJob> apexJobs = [
              SELECT
                      ApexClassId,
                      CompletedDate,
                      CreatedById,
                      CreatedDate,
                      ExtendedStatus,
                      Id,
                      JobItemsProcessed,
                      JobType,
                      LastProcessed,
                      LastProcessedOffset,
                      MethodName,
                      NumberOfErrors,
                      ParentJobId,
                      Status,
                      TotalJobItems
              FROM AsyncApexJob];
    
      for(CronTrigger cron:CronTrigger){
        System.debug('Cron-'+ cron.CronJobDetail.Name);
        System.debug('CronTriggerJobType->'+ cron.CronJobDetail.JobType);
      }
        try {
         //   for test
        //vacancies[0].Name ='aaaaa';
        update vacancies;
        }
        catch (Exception ex) {
            Logger.log(context,ex,System.LoggingLevel.ERROR);
        
        }
       
        
     // delete vacancies;
       for(AsyncApexJob j:apexJobs){
        System.debug('AsyncApexJob->'+j);
        System.debug(j.status);
      }
      Logger.log('batch finished successfully”' + 'batch: <<'+VacancyBatchScheduler.VACANCY_BATCH_SCHEDULE_JOB+'>>.', System.LoggingLevel.INFO);
    }
    catch(Exception ex) {
        Logger.log(context,ex,System.LoggingLevel.ERROR);
        throw  ex;
    }
    
    }
  
  public void finish(Database.BatchableContext context) {
      
  }



  public class customException extends Exception{
      
  }
}