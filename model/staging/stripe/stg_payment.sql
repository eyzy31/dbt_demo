select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,

    -- amount is stored in cents, convert it to dollars
    --in this example we are passing a string called amount
    --if we want we can also pass amount as a variable but needs to be defined
       round(1.0 * amount/100,2)
    created as created_at

from {{ source('stripe', 'payment') }}