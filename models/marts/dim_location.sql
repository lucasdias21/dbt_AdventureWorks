with Address_dim as (
    select *		
    from {{ ref('stg_address') }}
)

, stateprovince as (
    select *
    from {{ ref('stg_stateprovince') }}
)

, countryregion as (
    select *		
    from {{ ref('stg_countryregion') }}
)


/*Join State Province and CountryRegion*/
, joining as (
    select
        stateprovince.stateprovinceid
        , countryregion.countryregion_name
        , stateprovince.stateprovince_name

    from stateprovince
    left join countryregion on stateprovince.countryregioncode = countryregion.countryregioncode

)


/*Join Address and Joining to get the dim_location */
, joining_location as (
    select
        row_number() over (order by addressid) as location_sk -- auto-incremental surrogate key
        , Address_dim.addressid as location_id
        , Address_dim.addressline1
        , Address_dim.postalcode
        , joining.countryregion_name
        , joining.stateprovince_name
        , Address_dim.city

    from Address_dim
    left join joining on Address_dim.stateprovinceid_address = joining.stateprovinceid

)

select *
from joining_location

