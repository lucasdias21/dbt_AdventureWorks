WITH source_salesorderheader as (
    select 
        salesorderid			
        , revisionnumber			
        , orderdate			
        , duedate			
        , shipdate			
        , status as status_salesheader			
        , onlineorderflag			
        , purchaseordernumber			
        , accountnumber			
        , customerid			
        , salespersonid			
        , territoryid			
        , billtoaddressid			
        , shiptoaddressid			
        , shipmethodid			
        , creditcardid			
        , creditcardapprovalcode			
        , currencyrateid			
        , subtotal			
        , taxamt			
        , freight			
        , totaldue			
        , comment			
        , rowguid			
        , modifieddate		
    from {{ source ('AdventureWorks_EL', 'sales_salesorderheader') }}
)

select * 
from source_salesorderheader