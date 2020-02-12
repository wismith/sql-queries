-- We can use "AS" to relabel a field inside a particular query.
-- This not only makes the report look nicer by displaying a more useful
-- header name, but it makes it easier to reference a field elsewhere
-- in the query.

-- "invoices" table

-- A list of the top 5 countries by number of invoices
SELECT billing_country, COUNT(*) AS invoice_count
FROM invoices
GROUP BY billing_country
ORDER BY invoice_count DESC
LIMIT 5;

-- A list of the top 8 countries by gross/total invoice size
SELECT billing_country, SUM(total) AS gross_sales
FROM invoices
GROUP BY billing_country
ORDER BY gross_sales DESC
LIMIT 8;

-- A list of the top 10 countries by average invoice size
SELECT billing_country, AVG(total) AS avg_invoice_size
FROM invoices
GROUP BY billing_country
ORDER BY avg_invoice_size DESC
LIMIT 10;

-- Sales volume and receipts by year
-- See: http://www.sqlite.org/lang_datefunc.html
-- "STRFTIME" means "string format time" and is used to format the output of
-- dates, times, and timestamps.
-- See: http://cl.ly/image/0C1m372r233t
SELECT STRFTIME('%Y', invoice_date) AS year,
       COUNT(*) AS invoice_count,
       SUM(total) AS invoice_total
FROM invoices
GROUP BY year
ORDER BY year ASC;

-- Sales volume and receipts by year and month
-- You can group by multiple fields
-- You can order by multiple fields (here, year first then month)
-- See: http://cl.ly/image/2e2H3w052H2o

SELECT STRFTIME('%Y', invoice_date) AS year,
       STRFTIME('%m', invoice_date) AS month,
       COUNT(*) AS invoice_count,
       SUM(total) AS invoice_total
FROM invoices
GROUP BY year, month
ORDER BY year ASC, month ASC;

-- A list of the top 5 US states by number of invoices
-- Hint: You'll need to filter the results with WHERE billing_country = 'USA'
SELECT billing_state,
       COUNT(*) AS num_invoices
FROM invoices
WHERE billing_country = "USA"
GROUP BY billing_state
ORDER BY num_invoices DESC
LIMIT 5;

-- A list of the top 5 US states by gross sales
SELECT billing_state,
       SUM(total) AS gross_sales
FROM invoices
WHERE billing_country = "USA"
GROUP BY billing_state
ORDER BY gross_sales DESC
LIMIT 5;

-- A list of the top 5 US states by average invoice size
SELECT billing_state,
       AVG(total) AS avg_invoice_size
FROM invoices
WHERE billing_country = "USA"
GROUP BY billing_state
ORDER BY avg_invoice_size DESC
LIMIT 5;

-- A list of the top 10 US cities by number of invoices
SELECT billing_city,
       COUNT(*) AS num_invoices
FROM invoices
WHERE billing_country = "USA"
GROUP BY billing_city
ORDER BY num_invoices DESC
LIMIT 10;

-- A list of the top 10 US cities by gross sales
SELECT billing_city,
       SUM(total) AS gross_sales
FROM invoices
WHERE billing_country = "USA"
GROUP BY billing_city
ORDER BY gross_sales DESC
LIMIT 10;

-- A list of the top 10 US cities by average invoice size
SELECT billing_city,
       AVG(total) AS avg_invoice_size
FROM invoices
WHERE billing_country = "USA"
GROUP BY billing_city
ORDER BY avg_invoice_size DESC
LIMIT 10;

-- A list of the top 3 cities in California by number of invoices
-- Hint: You'll need a WHERE clause filtering by both billing_country and billing_state
SELECT billing_city,
       COUNT(*) AS num_invoices
FROM invoices
WHERE billing_country = "USA" AND
      billing_state = "CA"
GROUP BY billing_city
ORDER BY num_invoices DESC
LIMIT 3;

-- A list of the top 3 cities in California by gross sales
SELECT billing_city,
       SUM(total) AS gross_sales
FROM invoices
WHERE billing_country = "USA"
      AND billing_state = "CA"
GROUP BY billing_city
ORDER BY gross_sales DESC
LIMIT 3;

-- A list of the top 3 cities in California by average invoice size
SELECT billing_city,
       AVG(total) AS avg_invoice_size
FROM invoices
WHERE billing_country = "USA"
      AND billing_state = "CA"
GROUP BY billing_city
ORDER BY avg_invoice_size DESC
LIMIT 3;

-- "customers" table
-- Remember: run ".schema customers" to see what fields (columns) the customers table contains.

-- A list of the top 3 countries by total number of customers
SELECT country,
       COUNT(*) AS num_customers
FROM customers
GROUP BY country
ORDER BY num_customers DESC
LIMIT 3;

-- A list of the top 7 cities (anywhere) by total number of customers
SELECT city, COUNT(*) AS num_customers
FROM customers
GROUP BY city
ORDER BY num_customers DESC
LIMIT 7;
