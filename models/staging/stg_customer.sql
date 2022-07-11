WITH source_customer as (
    select 
        customerid			
        , personid			
        , storeid			
        , territoryid			
        , rowguid		
        , modifieddate	
    from {{ source ('AdventureWorks_EL', 'sales_customer') }}
)

select * 
from source_customer