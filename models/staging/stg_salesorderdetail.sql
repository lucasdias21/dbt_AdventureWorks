WITH source_salesorderdetail as (
    select 
        salesorderid		
        , salesorderdetailid		
        , carriertrackingnumber		
        , orderqty		
        , productid		
        , specialofferid		
        , unitprice		
        , unitpricediscount		
        , rowguid		
        , modifieddate
		
    from {{ source ('AdventureWorks_EL', 'sales_salesorderdetail') }}
)

select * 
from source_salesorderdetail