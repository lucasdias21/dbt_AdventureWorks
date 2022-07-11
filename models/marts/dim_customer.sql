with person as (
    select *		
    from {{ ref('stg_person') }}
)

, customer as (
    select *
    from {{ ref('stg_customer') }}
)

/*Join Customer and Person to get the dim_customer */
, joining_customer as (
    select
        row_number() over (order by customer.customerid) as customer_sk -- auto-incremental surrogate key
        , customer.customerid as customer_id
        , person.firstname
        , person.middlename
        , person.lastname

    from customer
    left join person on customer.personid = person.businessentityid

)

select *
from joining_customer