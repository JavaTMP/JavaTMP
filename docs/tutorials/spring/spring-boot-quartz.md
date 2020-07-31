---
title: Spring Boot Quartz Tutorial
---
# {{ page.title }}

Quartz consists of several basic components that can be combined as required
to run a job like : Job instance, JobDetail, Trigger and Scheduler.

## Job
- a Job interface having just one method – execute.
- It must be implemented by the class that contains the actual work to be done.
- When a job's trigger fires, the scheduler invokes the execute method, 
passing it a JobExecutionContext object.
- The JobExecutionContext provides the job instance with information 
about its runtime environment, including a handle to the scheduler, 
a handle to the trigger, and the job's JobDetail object.

## JobDetail
- Quartz does not store an actual instance of the job class.
- we can define an instance of the Job using the JobDetail class. 
The job's class must be provided to the JobDetail so that it knows 
the type of the job to be executed.

## Quartz JobBuilder
- The Quartz JobBuilder provides a builder-style API for constructing JobDetail entities

```java
JobDetail jobDetail = JobBuilder.newJob()
                        .ofType(SampleJob.class)
                        .storeDurably()
                        .withIdentity("Qrtz_Job_Detail")  
                        .withDescription("Invoke Sample Job service...")
                        .build();
```

## Spring JobDetailFactoryBean
- Spring's JobDetailFactoryBean configures JobDetail instances:

```java
@Bean
public JobDetailFactoryBean jobDetail() {
    JobDetailFactoryBean jobDetailFactory = new JobDetailFactoryBean();
    jobDetailFactory.setJobClass(JobImpl.class);
    jobDetailFactory.setDescription("Invoke Sample Job service...");
    jobDetailFactory.setDurability(true);
    return jobDetailFactory;
}
```

- A new instance of JobDetail is created for every execution of the job. 
- The JobDetail object conveys the detailed properties of the job. 
- Once the execution is completed, references to the instance are dropped.

## Trigger
- A Trigger is the mechanism to schedule a Job, it fires the execution of a job.
- the trigger also needs a type that can be chosen based on the scheduling requirements.
- we can use Quartz's TriggerBuilder or Spring's SimpleTriggerFactoryBean to trigger an execution of the job.

```java
@Bean
public Trigger trigger(JobDetail job) {
    return TriggerBuilder.newTrigger().forJob(job)
      .withIdentity("Qrtz_Trigger")
      .withDescription("Sample trigger")
      .withSchedule(simpleSchedule().repeatForever().withIntervalInHours(1))
      .build();
}
```

```java
@Bean
public SimpleTriggerFactoryBean trigger(JobDetail job) {
    SimpleTriggerFactoryBean trigger = new SimpleTriggerFactoryBean();
    trigger.setJobDetail(job);
    trigger.setRepeatInterval(3600000);
    trigger.setRepeatCount(SimpleTrigger.REPEAT_INDEFINITELY);
    return trigger;
}
```

## JobStore
- JobStore provides the storage mechanism for the Job and Trigger. 
and is responsible for maintaining all the data relevant to the job scheduler. 
The API supports both in-memory and persistent stores.
- the in-memory `org.quartz.simpl.RAMJobStore` offers fast performance and simple configuration.
- If job definitions and schedules must be kept between shutdowns, 
the persistent JDBCJobStore must be used.
- There are two types of JDBCJobStore: JobStoreTX and JobStoreCMT. 
- The JobStoreCMT type requires an application transaction to store data.
- the JobStoreTX type starts and manages its own transactions.
- The @QuartzDataSource annotation configure and initialize the Quartz database.

## Scheduler
- The Scheduler interface is the main API for interfacing with the job scheduler.
- A Scheduler can be instantiated with a SchedulerFactory. 
- the getScheduler method on the StdSchedulerFactory instantiates the Scheduler, 
initialize it (with the configured JobStore and ThreadPool).
- Spring's SchedulerFactoryBean provides bean-style usage for configuring a Scheduler, 
manages its life-cycle within the application context, and exposes the Scheduler 
as a bean for dependency injection.

## References
- [https://www.baeldung.com/spring-quartz-schedule](https://www.baeldung.com/spring-quartz-schedule)
- [http://www.btmatthews.com/blog/2011/inject-application-context+dependencies-in-quartz-job-beans.html](http://www.btmatthews.com/blog/2011/inject-application-context+dependencies-in-quartz-job-beans.html)
- [https://docs.spring.io/spring-boot/docs/2.3.1.RELEASE/reference/html/spring-boot-features.html#boot-features-quartz](https://docs.spring.io/spring-boot/docs/2.3.1.RELEASE/reference/html/spring-boot-features.html#boot-features-quartz)
