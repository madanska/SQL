----------------------------------------------------------------------
--1. Функции за преобразуване на типове
----------------------------------------------------------------------
--Пояснение към примерите:
    -- expression – валиден израз, резултатът от който да бъде преобразуван;
    -- string_value - nvarchar(4000) стойност, представяща форматираната стойност, която
    --да бъде преобразувана;
    -- data_type – тип, към който се прави преобразуване;
    -- length – опционен параметър за символните типове данни (низове);
    -- style – стил, използван при преобразуване на дати в низове;
    -- culture – опционен низ, който идентифицира как стойността на string_value да бъде форматирана.
 
----------CAST (expression AS data_type [ ( length ) ]) ;
-- преобразува стойност (от който и да е тип) в специфициран тип 
SELECT CAST(10.3496847 AS money)
 
----------CONVERT (data_type [ ( length ) ] , expression [ , style])
-- преобразува стойност (от който и да е тип) в специфициран тип 
SELECT CONVERT(varchar, GETDATE(), 103)
SELECT CONVERT(datetime, '2019-08-25', 105) -- out-of-range value.
SELECT CONVERT(datetime, '2019-25-08', 105)
 
----------PARSE (string_value AS data_type [ USING culture ])
-- връща резултата от израз, преведен в искания тип данни           
SELECT PARSE('08/17/2019' AS datetime2) AS Result;
SELECT PARSE('Saturday, 17 August 2019' AS date USING 'en-US') AS Result;
SELECT PARSE('Sat, 17 August 2019' AS date USING 'en-US') AS Result;
 
------------TRY_CAST (expression AS data_type [ ( length ) ])
--връща стойност, подадена към посочения тип данни, ако промяната успее; в противен случай връща null
SELECT TRY_CAST('08/17/2019' AS date);
SELECT TRY_CAST('08/17/2019 09:54:45' AS date) AS Result;
SELECT TRY_CAST('08/17/2019 09:54:45' AS datetime) AS Result;
SELECT TRY_CAST('08/17/2019 09:54:45' AS datetime2) AS Result;
 
------------TRY_CONVERT (data_type [ ( length ) ], expression [, style ])
--връща стойност, подадена към посочения тип данни, ако промяната успеe; в противен случай връща null.
SELECT TRY_CONVERT(VARCHAR(15),'08/17/2019',101);
SELECT TRY_CONVERT(date, '08/17/2019') AS Result;
SELECT TRY_CONVERT(date, '08/17/2019 10:05:20') AS Result;
SELECT TRY_CONVERT(datetime, '08/17/2019 10:05:20') AS Result;
SELECT TRY_CONVERT(datetime2, '08/17/2019 10:05:20') AS Result;
 
------------TRY_PARSE (string_value AS data_type [ USING culture ]) 
--преобразува израз от string към date/time и number types
SELECT TRY_PARSE('08/17/2019' AS date USING 'en-us');
SELECT TRY_PARSE('08/17/2019 10:18:10 AM' AS date USING 'en-us');
 
SELECT TRY_PARSE('08/17/2019 10:18:10 AM' AS datetime USING 'en-us');
SELECT TRY_PARSE('08/17/2019 10:18:10 AM' AS datetime2 USING 'en-us');
 
----------------------------------------------------------------------
--2. Функции за дата
----------------------------------------------------------------------
------------CURRENT_TIMESTAMP – връща системната дата на сървъра в тип DATETIME;
SELECT CURRENT_TIMESTAMP AS current_date_time;
SELECT CONVERT(char(25), CURRENT_TIMESTAMP) as System_date;
 
------------GETUTCDATE() – връща текущото UTC време, изчислява се от 
--операционната система, на която работи сървъра, в тип DATETIME;
select getutcdate() as System_date;
 
------------GETDATE() – връща системната дата на сървъра в тип DATETIME;
select getdate()
 
------------SYSDATETIME() – връща системната дата на сървъра в тип DATETIME2;
SELECT CONVERT (date, SYSDATETIME()) as Date,
       CONVERT (time, SYSDATETIME()) as Time,
       SYSDATETIME() as SysDateTime;
 
------------SYSUTCDATETIME() – връща текущото UTC време на сървъра в тип DATETIME2;
SELECT CONVERT (date, SYSUTCDATETIME()) as Date,
        CONVERT (time, SYSUTCDATETIME()) as Time,
        SYSDATETIME() as SysDateTime,
        SYSUTCDATETIME() as SysUtcDateTime
 
------------SYSDATETIMEOFFSET() – връща системната дата и часовия пояс на сървъра в тип DATETIMEOFFSET;
SELECT CONVERT (date, SYSDATETIMEOFFSET()) as Date,
        CONVERT (time, SYSDATETIMEOFFSET()) as Time,
        SYSDATETIMEOFFSET() as SysDateTimeOffSet;
 
------------DATEADD (datepart, number, date) – връща дата, образувана чрез добавяне към
--датата date, number на брой части datepart;
SELECT DATEADD(year, 1, '2020/08/25') AS DateAdd
 
--DATEDIFF (datepart , startdate , enddate) – връща число, разликата в части от вид
--datepart, между две дати;
SELECT DATEDIFF(MONTH, '2019/08/25', '2018/08/25') AS DateDiff
 
--DATEDIFF_BIG (datepart, startdate, enddate) – връща число, разликата в части от вид
--datepart, между две дати, като върнатото число е от тип BIGINT;
SELECT DATEDIFF_BIG(year,        '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF_BIG(quarter,     '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF_BIG(month,       '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF_BIG(dayofyear,   '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF_BIG(day,         '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF_BIG(week,        '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF_BIG(hour,        '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF_BIG(minute,      '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF_BIG(second,      '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF_BIG(millisecond, '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
 
/*DATENAME (datepart, date) – връща като низ съдържанието на конкретна част от
дата. Напр. February, ако месеца в date е февруари и datepart е mm;*/
SELECT DATENAME(month, '2017/08/25') AS DatePartString
 
/*DATEPART (datepart, date) – връща като число съдържанието на конкретна част от
дата. Напр. 2, ако месеца в date е февруари и datepart е mm;*/
SELECT DATEPART(year, '2017/08/25') AS DatePartInt
 
--DAY (date) – връща като число ден от определена дата;
SELECT DAY('2014-02-22') as Day_1,
        DAY('2014-02-22 08:23:49.1234567 +07:10') as Day_2,
        DAY(SYSDATETIME()) as Day_3;
 
--MONTH (date) – връща като число месец от определена дата;
SELECT MONTH('2014-03-01') as Month_1,
        MONTH('2014-03-01 08:38:49.1234567 +07:10') as Month_2,
        MONTH(SYSDATETIME()) as Month_3;
 
--YEAR (date) – връща като число година от определена дата.
SELECT YEAR('2014-03-01') as Result_1,
        YEAR('2014-03-01 17:01:25.1234567 +07:10') as Result_2,
        YEAR(SYSDATETIME()) as Result_3;
 
----------------------------------------------------------------------------------------------------
--3. Математически функции
----------------------------------------------------------------------------------------------------
--ABS (numeric_expression) – връща абсолютна стойност, променя отрицателните
--стойности в положителни стойности;
SELECT Abs(-243.5) AS AbsNum;
 
--DEGREES (numeric_expression) – връща съответния ъгъл в градуси, по зададени
--радиани;
SELECT DEGREES(1.5);
 
--RAND ([seed]) – генератор на случайни числа между 0 и 1 или цяло ако е указано
--цялото число seed;
SELECT RAND()
 
--ROUND (numeric_expression, length [, function]) – връща числова стойност,
--закръглена до определена дължина или точност;
SELECT ROUND(235.415, 2) AS RoundValue;
 
--SQRT (float_expression) – връща корен квадратен на зададеното число;
SELECT SQRT(121);
 
--PI() – връща стойността на числото Пи.
SELECT pi() as [Pi number]
 
--SQUARE (float_expression) – връща квадрат на посочената стойност;
SELECT SQUARE(11);
 
--POWER (float_expression , y) – връща стойността на посоченото число на посочената
--степен;
SELECT POWER(4, 2)
 
----------------------------------------------------------------------------------------------------
--4. Функции за работа с низове
----------------------------------------------------------------------------------------------------
 
--CONCAT (string_value1, string_value2 [, string_valueN])
-- – връща низ, който е резултат от конкатенацията
-- или сливането на два или повече низа;
SELECT CONCAT ('Ivan', ' ','Asenov') AS FullName;
--LEN (string_expression) – връща броя символи в низа;
 
--LTRIM (character_expression) – премахва интервалите в началото на низа;
SELECT LTRIM('          Four spaces are after the period in this sentence.            ') + 'Next string.'
--RTRIM (character_expression) – премахва интервалите в края на низа;
SELECT RTRIM('          Four spaces are after the period in this sentence.            ') + 'Next string.'
--TRIM(character_expression) – премахва интервалите в началото и края на низа;
SELECT TRIM('          Four spaces are after the period in this sentence.            ') + 'Next string.'
 
--REPLACE (string_expression, string_pattern , string_replacement) – заменя всички
--съвпадения на определен низ с друг низ;
SELECT REPLACE('abcD','abc','3');
 
--REVERSE (character_expression) – обръща низа;
SELECT REVERSE('SQL Tutorial')
 
--SUBSTRING (expression, start, length) – връща част от символен или бинарен израз;
SELECT SUBSTRING('SQL Tutorial', 2, 3) AS ExtractString
 
--LOWER (character_expression) – връща низа, като преобразува главните букви в малки;
SELECT LOWER('SQL Tutorial is FUN!')
--UPPER (character_expression) – връща низа, като преобразува малките букви в главни;
SELECT UPPER('SQL Tutorial is FUN!')
 
----------------------------------------------------------------------------------------------------
--5.    Системни функции
----------------------------------------------------------------------------------------------------
--ISNULL (expression, replacement) – ако параметърът expression бъде изчислен до
--NULL, той се заменя от израза replacement;
SELECT ISNULL(NULL, 'W3Schools.com');
 
--ISNUMERIC (expression) – връща 1, ако изразът се изчислява до числов тип, и 0 - в противен случай;
SELECT ISNUMERIC(4567);
 
--IIF (boolean_expression, true_value, false_value) – изчислява първия аргумент и връща
--втория аргумент, ако първият аргумент е true, в противен случай връща втория аргумент;
SELECT IIF(500<1000, 'YES', 'NO');
 
--HOST_NAME() – връща името на работната станция;
--select HOST_NAME() as Host_name;
 
--HOST_ID() – връща идентификатора на работната станция. Идентификационният
--номер на работната станция е идентификационният номер на процеса (PID) на
--приложението на клиентския компютър, който се свързва към SQL Server.
--select HOST_ID() as Host_number;
 
----любознателните могат да намерят още примери тук: tsql.info;  w3schools.com
 
 
 
