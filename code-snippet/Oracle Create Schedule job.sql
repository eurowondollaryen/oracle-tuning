--SCHEDULE JOB 생성하기
BEGIN
  SYS.DBMS_SCHEDULER.DROP_SCHEDULE
    (schedule_name  => '[스키마].[스케줄명]');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_SCHEDULE
    (
      schedule_name    => '[스키마].[스케줄명]'
     ,start_date       => NULL
     ,repeat_interval  => 'FREQ=DAILY;BYHOUR=0,6,12,18;BYMINUTE=0;BYSECOND=0;'
     ,end_date         => NULL
     ,comments         => '[스케줄설명]'
    );
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.DROP_JOB
    (job_name  => '[스키마].[Job명]');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB
    (
       job_name        => '[스키마].[Job명]'
      ,schedule_name   => '[스키마].[스케줄명]'
      ,job_class       => 'DEFAULT_JOB_CLASS'
      ,job_type        => 'STORED_PROCEDURE'
      ,job_action      => '[스키마].[SP명]'
      ,comments        => NULL
    );
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => '[스키마].[Job명]'
     ,attribute => 'RESTARTABLE'
     ,value     => TRUE);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => '[스키마].[Job명]'
     ,attribute => 'LOGGING_LEVEL'
     ,value     => SYS.DBMS_SCHEDULER.LOGGING_RUNS);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => '[스키마].[Job명]'
     ,attribute => 'MAX_FAILURES');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => '[스키마].[Job명]'
     ,attribute => 'MAX_RUNS');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => '[스키마].[Job명]'
     ,attribute => 'STOP_ON_WINDOW_CLOSE'
     ,value     => FALSE);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => '[스키마].[Job명]'
     ,attribute => 'JOB_PRIORITY'
     ,value     => 3);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => '[스키마].[Job명]'
     ,attribute => 'SCHEDULE_LIMIT');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => '[스키마].[Job명]'
     ,attribute => 'AUTO_DROP'
     ,value     => FALSE);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => '[스키마].[Job명]'
     ,attribute => 'number_of_arguments'
     ,value     => 1);

  SYS.DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE
    ( job_name             => '[스키마].[Job명]'
     ,argument_position    => 1
     ,argument_value       => 'TO_CHAR(SYSDATE,'YYYYMMDD')');

  SYS.DBMS_SCHEDULER.ENABLE
    (name                  => '[스키마].[Job명]');
END;
/
