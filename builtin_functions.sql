use petsdb;

-- Query A1: Enter a function that calculates the total cost of 
-- all animal rescues in the PETRESCUE table.

select sum(COST) as 'Total Cost' from petrescue;

-- Query A5: Enter a function that displays the average cost of rescuing a dog. 
select avg(cost/quantity) from petrescue
where ANIMAL ="Dog";

select ANIMAL,QUANTITY from petrescue
where quantity = (select max(quantity) from petrescue);

select * from petrescue
order by quantity desc;





