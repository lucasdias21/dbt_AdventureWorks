WITH source_stateprovince as (
    select 
        stateprovinceid		
        , stateprovincecode			
        , countryregioncode			
        , isonlystateprovinceflag	
        , name as stateprovince_name		
        , territoryid		
        , rowguid			
        , modifieddate		
		
    from {{ source ('AdventureWorks_EL', 'person_stateprovince') }}
)

select * 
from source_stateprovince
