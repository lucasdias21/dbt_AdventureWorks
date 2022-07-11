WITH source_product as (
    select 
        productid				
        , name as product_name				
        , productnumber				
        , makeflag			
        , finishedgoodsflag			
        , color				
        , safetystocklevel				
        , reorderpoint				
        , standardcost				
        , listprice				
        , size as product_size				
        , sizeunitmeasurecode				
        , weightunitmeasurecode				
        , weight as product_weight				
        , daystomanufacture				
        , productline				
        , class				
        , style				
        , productsubcategoryid				
        , productmodelid				
        , sellstartdate			
        , sellenddate			
        , discontinueddate			
        , rowguid				
        , modifieddate				
		
    from {{ source ('AdventureWorks_EL', 'production_product') }}
)

select * 
from source_product