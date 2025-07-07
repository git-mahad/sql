Select Round(Sum(if(order_date = customer_pref_delivery_date, 1,0))*100/Count(distinct customer_id),2) As immediate_percentage
From delivery
Where (customer_id, order_date) In (
    Select customer_id, Min(order_date) As first_order_date
    From Delivery
    Group By customer_id)