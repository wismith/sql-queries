-- Below are a bunch of "plain English" sentences.  Your job is to take a stab
-- at translating each one into a single SELECT query.  You can write your
-- query below each "plain English" sentence.
--
-- We've written some example queries as a way to both show you how and where
-- to type your work and also as a way to show you new SQL commands, clauses,
-- or syntax where necessary.

-- **Please** don't delete the "plain English" versions. Just write your query
-- on the line below it. :)

-- The lines in this file that begin with "--" are comments.  You're encouraged
-- to leave your own comments, reflecting on things you're confused about,
-- questons you have, or anything else.  The more we know about how you're
-- thinking the better feedback we'll be able to give!

-- "albums" table

-- Every album
SELECT * FROM albums;

-- Every album title (and only the title)
SELECT title FROM albums;

-- Every album ordered by album title in ascending order (A-Z)
-- Note: ORDER BY orders by lowest-to-highest by default
SELECT * FROM albums ORDER BY title;

-- Every album ordered by album title in descending order (Z-A)
SELECT * FROM albums ORDER BY title DESC;

-- Every album whose title starts with A in alphabetical order
SELECT * FROM albums WHERE title LIKE 'A%' ORDER BY title;

-- "invoices" table
-- Remember: run ".schema invoices" to see the structure of the "invoices" table

-- Every invoice
SELECT * FROM invoices;
-- Every invoice ordered by total invoice amount ("total")
SELECT * FROM invoices ORDER BY total;
-- Every invoice with a total greater than 10
SELECT * FROM invoices WHERE total > 10;
-- The 10 least expensive invoices
SELECT * FROM invoices ORDER BY total LIMIT 10;
-- Remember: ORDER BY orders from lowest-to-highest by default
SELECT * FROM invoices ORDER BY total LIMIT 10;

-- The 10 most expensive invoices
SELECT * FROM invoices ORDER BY total DESC LIMIT 10;
-- The 15 most recent invoices
select * FROM invoices ORDER BY invoice_date DESC LIMIT 15;
-- The 15 oldest invoices
select * FROM invoices ORDER BY invoice_data LIMIT 15;
-- The 10 most expensive invoices from the US
select * FROM invoices WHERE billing_country = "USA" ORDER BY total DESC LIMIT 10;
-- The 10 least expensive invoices from the US
select * from invoices where billing_country = "USA" order by total LIMIT 10;
-- The 10 most expensive invoices from outside the US
select * from invoices where billing_country != "USA" ORDER BY total DESC LIMIT 10;
-- Hint: If "=" means equal, use "!=" to mean "not equal"

-- Every invoice from Chicago, IL
SELECT * FROM invoices WHERE billing_city = "Chicago" AND billing_state = "IL" AND billing_country="USA";

-- A list of all the invoices worth more than $5.00 from Chicago, IL
SELECT * FROM invoices WHERE billing_city = "Chicago" AND billing_state = "IL" AND billing_country = "USA" AND total > 5;

-- The billing addresses of the 5 most valuable invoices from Mountain View CA
-- Gotta reward those big spenders!
SELECT billing_address FROM invoices WHERE billing_city = "Mountain View" AND billing_state = "CA" AND billing_country = "USA" ORDER BY total DESC LIMIT 5;
-- A list of the 10 most valuable invoices made before January 1st, 2010
SELECT * FROM invoices WHERE invoice_date < Datetime('2010-01-01') ORDER BY total DESC LIMIT 10;
-- Hint: Dates are formatted like 'YYYY-MM-DD' and you can compare them using '<', '>', '<=' and '>='


-- The number of invoices from Chicago, IL
SELECT COUNT(*) FROM invoices WHERE billing_city = "Chicago" AND billing_state = "IL" AND billing_country = "USA";

-- The number of invoices from the US, grouped by state
SELECT billing_state, COUNT(*) FROM invoices WHERE billing_country = "USA" GROUP BY billing_state;

-- The state in the US with the most invoices
SELECT billing_state, COUNT(*) FROM invoices WHERE billing_country = "USA" GROUP BY billing_state ORDER BY COUNT(*) DESC LIMIT 1;

-- The total invoice value from California
SELECT billing_state, SUM(total) FROM invoices WHERE billing_country = "USA" and billing_state = "CA";

-- The number of invoices and the invoice total from California
SELECT billing_state, COUNT(*), SUM(total) FROM invoices WHERE billing_country = "USA" and billing_state = "CA";

-- The count, total, and average of invoice totals from California
SELECT billing_state, COUNT(*), SUM(total), AVG(total) FROM invoices WHERE billing_country = "USA" and billing_state = "CA";

-- The count, total, and average of invoice totals, grouped by state, ordered by average invoice total from highest-to-lowest
SELECT billing_state, COUNT(*), SUM(total), AVG(total) FROM invoices GROUP BY billing_state ORDER BY AVG(total) DESC;
-- A list of the top 5 countries by number of invoices
SELECT billing_country, COUNT(*) FROM invoices GROUP BY billing_country ORDER BY COUNT(*) DESC LIMIT 5;
-- A list of the top 5 countries by gross/total invoice size
SELECT billing_country, SUM(total) FROM invoices GROUP BY billing_country ORDER BY SUM(total) DESC LIMIT 5;
-- A list of the top 5 countries by average invoice size
SELECT billing_country, AVG(total) FROM invoices GROUP BY billing_country ORDER BY AVG(total) DESC LIMIT 5;
