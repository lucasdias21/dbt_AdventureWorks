WITH source_countryregion as (
    select 
        countryregioncode				
        , name as countryregion_name				
        , modifieddate			

    from {{ source ('AdventureWorks_EL', 'person_countryregion') }}
)

select * 
from source_countryregion