with salesorderheadersalesreason as (
    select *		
    from {{ ref('stg_salesorderheadersalesreason') }}
)

, salesreason as (
    select *
    from {{ ref('stg_salesreason') }}
)

/*Join SalesOrderHeaderSalesReason and SalesReason to get the dim_reason */
, joining_salesreason as (
    select
        row_number() over (order by salesreason.salesreasonid) as reason_sk -- auto-incremental surrogate key
        , salesreason.salesreasonid as reason_id
        , salesorderheadersalesreason.salesorderid as salesorderid
        , salesreason.salesreason_name
        , salesreason.reasontype


    from salesorderheadersalesreason
    left join salesreason on salesorderheadersalesreason.salesreasonid = salesreason.salesreasonid
)

select *
from joining_salesreason

