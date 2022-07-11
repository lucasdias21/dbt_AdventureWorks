WITH source_salesreason as (
    select 
        salesreasonid			
        , name as salesreason_name			
        , reasontype			
        , modifieddate		

    from {{ source ('AdventureWorks_EL', 'sales_salesreason') }}
)

select * 
from source_salesreason