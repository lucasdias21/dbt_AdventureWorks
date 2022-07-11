with product as (
    select *		
    from {{ ref('stg_product') }}
)

/*Product table to get the dim_product */
, transformed as (
    select
        row_number() over (order by product.productid) as product_sk -- auto-incremental surrogate key
        , product.productid as product_id
        , product.product_name
        , product.color		
        , product.standardcost
        , product.listprice
        , product.product_size		
        , product.product_weight				
        , product.daystomanufacture										
        , product.sellstartdate		
        , product.sellenddate		
        , product.discontinueddate

    from product
)

select *
from transformed