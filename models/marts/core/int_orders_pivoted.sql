
{%- set payment_methods = ['bank_transfer','coupon','credit_card','gift_card']-%}


With payments as (
    Select *
    From {{ ref('stg_payments') }}
),

pivoted as (
    select
        order_id,



        {% for method in payment_methods %}

        sum(CASE WHEN payment_method = '{{method}}' THEN AMOUNT ELSE 0 end) as {{method}}_amount 
        {% if not loop.last -%}
        ,
        {% endif %}

        {%- endfor %}
        
     from payments
     where status = 'success'
     group by 1
     
)

Select *
from pivoted