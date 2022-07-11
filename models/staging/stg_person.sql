WITH source_person as (
    select 
        businessentityid			
        , persontype				
        , namestyle			
        , title				
        , firstname				
        , middlename				
        , lastname				
        , suffix				
        , emailpromotion			
        , additionalcontactinfo				
        , demographics				
        , rowguid				
        , modifieddate		
    from {{ source ('AdventureWorks_EL', 'person_person') }}
)

select * 
from source_person