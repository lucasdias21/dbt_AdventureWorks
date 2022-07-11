WITH source_creditcard as (
    select 
        creditcardid			
        , cardtype				
        , cardnumber				
        , expmonth			
        , expyear			
        , modifieddate		

    from {{ source ('AdventureWorks_EL', 'sales_creditcard') }}
)

select * 
from source_creditcard