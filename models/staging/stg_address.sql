WITH source_address as (
    select 
        addressid			
        , addressline1				
        , addressline2				
        , city				
        , stateprovinceid as stateprovinceid_address		
        , postalcode			
        , spatiallocation				
        , rowguid				
        , modifieddate				
    from {{ source ('AdventureWorks_EL', 'person_address') }}
)

select * 
from source_address