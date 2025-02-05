--Hometask

Declare @todate datetime, @fromdate datetime
set @fromdate = '2025-01-01'
set @todate = '2025-12-31'
 
;With DateSequence( [Date] ) as
(
    Select @fromdate as [Date]
        union all
    Select dateadd(day, 1, [Date])
        from DateSequence
        where Date < @todate
)
    SELECT format(d1.Date, 'yyyyMMdd') as ID,
	d1.Date,
	day(d1.Date) as Day,
	concat(day(d1.Date), case when day(d1.Date) in (11, 12, 13) then 'th'
	when day(d1.Date) like '%1' then 'st'
	when day(d1.Date) like '%2' then 'nd'
	when day(d1.Date) like '%3' then 'rd'
	else 'th' end) as DaySuffix,
	datepart(weekday, d1.Date) as NoDayOfWeek,
	datename(weekday, d1.Date) as DayOfWeek,
	count(*) as DayOfYear,	
	datepart(week, d1.Date) as WeekOfYear,

    (DAY(d1.Date) + DATEPART(dw, d1.Date) - 2) / 7 + 1 AS WeekOfMonth

,
	month(d1.Date) as Month,
	format(d1.Date, 'MMMM') as MonthName,
	case when month(d1.date) in (1,2,3) then 1
		when month(d1.Date) in (4,5,6) then 2
		when month(d1.date) in (7,8,9) then 3
		else 4 end as Quarter,
		case when month(d1.date) in (1,2,3) then 'First'
		when month(d1.Date) in (4,5,6) then 'Second'
		when month(d1.date) in (7,8,9) then 'Third'
			else 'Forth'	end as QuarterName,
			year(d1.date) as Year
			


    FROM DateSequence d1
join DateSequence d2 on d1.Date>=d2.Date
group by d1.Date

    OPTION (MAXRECURSION 0);