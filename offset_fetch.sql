--Using ORDER BY in a ranking function

--The following example declares the variables @RowsToSkip and @FetchRows and specifies these variables in the OFFSET and FETCH clauses.

 DECLARE @Skip INT = 2,
         @Fetch INT = 8  
  SELECT Department_ID, 
         Name  
    FROM Departments 
ORDER BY Department_ID ASC   
  OFFSET @Skip ROWS   
   FETCH NEXT @Fetch ROWS ONLY


	select DEPARTMENT_ID, NAME
	from DEPARTMENTS
