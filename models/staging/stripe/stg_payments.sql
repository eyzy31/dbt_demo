select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,

    -- amount is stored in cents, convert it to dollars
    --in this example we are passing a string called amount
    --if we want we can also pass amount as a variable but needs to be defined
    {{ cents_to_dollars('amount',2) }} as amount,
    created as created_at

from {{ source('stripe', 'payment') }}