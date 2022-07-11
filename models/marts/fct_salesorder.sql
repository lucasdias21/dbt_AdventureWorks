with customer as (
    select 
        customer_sk
        , customer_id
    from {{ ref('dim_customer') }}
)

, reason as (
    select 
        reason_sk
        , reason_id
        , salesorderid
    from {{ ref('dim_reason') }}
)

, location as (
    select 
        location_sk
        , location_id
    from {{ ref('dim_location') }}
)

, product as (
    select 
        product_sk
        , product_id
    from {{ ref('dim_product') }}
)

, creditcard as (
    select 
        creditcard_sk
        , creditcard_id
    from {{ ref('dim_creditcard') }}
)


/*Join Sales Order Header and dim_customer and dim_location and dim_reason and dim_creditcard*/
, joining_salesorder as (
    select
        salesorderheader.salesorderid
        , reason.reason_sk as reason_sk
        , location.location_sk as location_sk
        , customer.customer_sk as customer_sk
        , creditcard.creditcard_sk as creditcard_sk
        , salesorderheader.status_salesheader
        , salesorderheader.orderdate
        , salesorderheader.duedate
        , salesorderheader.shipdate
        , salesorderheader.subtotal
        , salesorderheader.taxamt
        , salesorderheader.freight
        , salesorderheader.totaldue

    from {{ ref('stg_salesorderheader') }} salesorderheader
    left join customer on salesorderheader.customerid = customer.customer_id
    left join reason on salesorderheader.salesorderid = reason.salesorderid
    left join location on salesorderheader.billtoaddressid = location.location_id and salesorderheader.shiptoaddressid = location.location_id
    left join creditcard on salesorderheader.creditcardid = creditcard.creditcard_id
)

/*Join Sales Order Detail and dim_product */
, joining_salesorderdetail as (
    select
        salesorderdetail.salesorderid
        , product.product_sk as product_sk
        , salesorderdetail.orderqty as orderqty
        , salesorderdetail.unitprice as unitprice
        , salesorderdetail.unitpricediscount

    from {{ ref('stg_salesorderdetail') }} salesorderdetail
    left join product on salesorderdetail.productid = product.product_id
)

/* We then join Sales Order Detail and Sales Order Header to get the final fact table*/
, final as (
    select 
        salesorderheader.salesorderid
        , salesorderheader.reason_sk
        , salesorderheader.location_sk
        , salesorderheader.customer_sk
        , salesorderheader.creditcard_sk
        , salesorderdetail.product_sk
        , salesorderheader.orderdate			
        , salesorderheader.duedate			
        , salesorderheader.shipdate
        , salesorderheader.status_salesheader	
        , salesorderheader.subtotal
        , salesorderheader.taxamt
        , salesorderheader.freight
        , salesorderheader.totaldue
        , salesorderdetail.orderqty
        , salesorderdetail.unitprice
        , salesorderdetail.unitpricediscount
        , salesorderdetail.orderqty * salesorderdetail.unitprice as gross_total

    from joining_salesorder as salesorderheader
    left join joining_salesorderdetail as salesorderdetail on salesorderheader.salesorderid = salesorderdetail.salesorderid

)

select *
from final