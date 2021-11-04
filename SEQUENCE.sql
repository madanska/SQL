CREATE SCHEMA Test ;  
GO  

CREATE SEQUENCE Test.CountBy1  
    START WITH 1  
    INCREMENT BY 1 ;  
GO  

CREATE SEQUENCE Test.DecSeq  
    AS decimal(3,0)   
    START WITH 125  
    INCREMENT BY 25  
    MINVALUE 100  
    MAXVALUE 200  
    CYCLE  
    CACHE 3  
;  

SELECT NEXT VALUE FOR Test.DecSeq; 

SELECT * FROM sys.sequences
WHERE name = 'TestSequence' ;  

DROP SEQUENCE Test.CountBy1 ;  
DROP SEQUENCE Test.DecSeq ;  

--https://docs.microsoft.com/en-us/sql/t-sql/statements/drop-sequence-transact-sql?view=sql-server-ver15
--https://docs.microsoft.com/en-us/sql/t-sql/statements/create-sequence-transact-sql?view=sql-server-ver15
--https://www.tutorialspoint.com/sql/sql-using-sequences.htm
GO  
