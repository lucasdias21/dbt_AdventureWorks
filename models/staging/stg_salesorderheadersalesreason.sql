WITH source_salesorderheadersalesreason as (
    select 
        salesorderid		
        , salesreasonid		
        , modifieddate			
		
    from {{ source ('AdventureWorks_EL', 'sales_salesorderheadersalesreason') }}
)

select * 
from source_salesorderheadersalesreason