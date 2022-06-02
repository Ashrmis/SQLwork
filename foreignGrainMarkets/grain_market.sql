use foreign_crops;
-- Problem 3: How many records are in the farm prices dataset?
select count(*) from monthly_farm_prices;

-- Problem 4: Which provinces are included in the farm prices dataset?
select distinct geo from monthly_farm_prices;

-- Problem 5: How many hectares of Rye were harvested in Canada in 1968?
select * from annual_crop_data
where year(YEAR)=1968 
		and crop_type = "Rye" 
		and geo="Canada";

-- Problem 6: Query and display the first 6 rows of the farm prices table for Rye.
select * from monthly_farm_prices
where crop_type="Rye"
limit 6;


-- Problem 7: Which provinces grew Barley?
select distinct geo from monthly_farm_prices
where crop_type="Barley";

-- Problem 8: Find the first and last dates for the farm prices data.
select date from monthly_farm_prices
order by date
limit 1;

select date from monthly_farm_prices
order by date desc
limit 1;

-- Problem 9: Which crops have ever reached a farm price greater than 
-- 			  or equal to $350 per metric tonne?
select distinct CROP_TYPE from monthly_farm_prices
where PRICE_PRERMT>=350;

-- Problem 10: Rank the crop types harvested in Saskatchewan in the year
-- 			   2000 by their average yield. Which crop performed best?
select crop_type,geo,avg_yield from annual_crop_data
where geo = "Saskatchewan" and year(year)=2000
order by AVG_YIELD desc;

-- Problem 11: Rank the crops and geographies by their average yield 
-- 	   		   (KG per hectare) since the year 2000. Which crop 
-- 			   and province had the highest average yield since the year 2000?
select year,crop_type,geo,avg_yield from annual_crop_data
where year(year)>=2000
order by AVG_YIELD desc;

-- Problem 12: determine how much wheat was harvested in Canada
-- 			   in the most recent year of the data.
select crop_type,HARVESTED_AREA,YEAR(year) as "Year",geo from annual_crop_data
where year(year) = (select max(year(year)) from annual_crop_data) 
	and geo="Canada" and crop_type="wheat";

-- Problem 13: calculate the monthly price per metric tonne of Canola grown in Saskatchewan in both Canadian and US dollars. 
-- Display the most recent 6 months of the data. order by the month desc limit 6
select fx.DATE,farm.geo,farm.CROP_TYPE,
		cast((fx.FXUSDCAD*farm.PRICE_PRERMT) as decimal(10,2)) as price_CAN,
		farm.PRICE_PRERMT as price_USD 
		from monthly_fx as fx,monthly_farm_prices as farm
where fx.DATE = farm.DATE 
	and farm.geo = "Saskatchewan" 
	and farm.crop_type="Canola"
order by fx.date desc
limit 6;

