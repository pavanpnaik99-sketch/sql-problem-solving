SELECT
    i.invoice_id,
    c1.customer_name,
    i.price,
    COUNT(c2.contact_name) AS contacts_count,
    COUNT(c3.customer_name) AS trusted_contacts_count
FROM
    Invoices AS i
    LEFT JOIN Customers AS c1 ON i.user_id = c1.customer_id
    LEFT JOIN Contacts AS c2 ON i.user_id = c2.user_id
    LEFT JOIN Customers AS c3 ON c2.contact_name = c3.customer_name
    AND c2.contact_email = c3.email
GROUP BY
    i.invoice_id,
    c1.customer_name,
    i.price
order by
    i.invoice_id;