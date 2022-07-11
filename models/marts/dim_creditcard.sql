WITH creditcard as (
    select *		
    from {{ ref('stg_creditcard') }}
)

/*CreditCard table to get the dim_creditcard */
, transformed as (
    select
        row_number() over (order by creditcardid) as creditcard_sk -- auto-incremental surrogate key
        , creditcard.creditcardid as creditcard_id
        , creditcard.cardtype

    from creditcard
)

select *
from transformed