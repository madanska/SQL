create table #Temp
(
    EventID int, 
    EventTitle Varchar(50), 
    EventStartDate DateTime, 
    EventEndDate DatetIme, 
    EventEnumDays int,
    EventStartTime Datetime,
    EventEndTime DateTime, 
    EventRecurring Bit, 
    EventType int
);
 
insert into #Temp 
values ( 1, 'DEV Fest', Getdate(), convert(datetime, '05-11-2019', 105), 2,  Getdate(), convert(datetime, '05-11-2019', 105), 0, 100);
 
select * from #Temp
 
create view ViewFromTemporaryTable
as
select EventID, EventTitle, EventStartTime
  from #Temp;
 
-- Views or functions are not allowed on temporary tables. Table names that begin with '#' denote temporary tables.
