-- Product's Price for Each Store --
select
    product_id,
    max(
        case
            when store = "store_1" then price
            else null
        end
    ) as store1,
    max(
        case
            when store = "store_2" then price
            else null
        end
    ) as store2,
    max(
        case
            when store = "store_3" then price
            else null
        end
    ) as store3,
from
    products
group by
    product_id;