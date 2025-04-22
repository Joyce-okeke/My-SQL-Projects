select *
from product_order;
select *
from product_category;
select *
from sales_order;

-- delete column
alter table product_order
drop column CURRENCY;

-- rename columns
alter table product_order
change ï»¿PRODUCTID ProductId varchar(255);

alter table product_order
change TYPECODE TypeCode text,
change PRODCATEGORYID ProductCategoryId text,
change CREATEDBY CreatedBy Int,
change CREATEDAT DateCreated date,
change CHANGEDBY ChangedBy Int,
change CHANGEDAT ChangedAt date,
change SUPPLIER_PARTNERID SupplierPartnerId Int,
change TAXTARIFFCODE TaxTariffCode Int,
change WEIGHTMEASURE WeightMeasure double,
change WEIGHTUNIT WeightUnit text,
change PRICE Price Int;

alter table productcategorytext
rename Product_category;

alter table product_category
change ï»¿PRODCATEGORYID ProductCategoryId text,
change LANGUAGE Language text,
change Product_category_name ProductCategoryName varchar(255);

alter table sales_order
drop column QUANTITYUNIT,
drop column delivery_date;

alter table sales_order
change ï»¿SALESORDERID SalesOrderId Int,
change SALESORDERITEM SalesOrderItem Int,
change PRODUCTID ProductId varchar(255),
change CURRENCY Currency text,
change GROSSAMOUNT GrossAmount Int,
change NETAMOUNT NetAmount double,
change TAXAMOUNT TaxAmount double,
change QUANTITY Quantity Int,
change DELIVERYDATE DeliveryDate date; 

-- joining tables
select ProductCategoryName CATEGORY, count(Quantity) Quantity
from product_order Po
join product_category Pc
on Po.ProductCategoryId = Pc.ProductCategoryId
join sales_order So
on Po.ProductId = So.ProductId
GROUP BY ProductCategoryName
ORDER BY Quantity desc
limit 5;

select ProductCategoryName CATEGORY, count(Quantity) Quantity
from product_order Po
join product_category Pc
on Po.ProductCategoryId = Pc.ProductCategoryId
join sales_order So
on Po.ProductId = So.ProductId
GROUP BY ProductCategoryName
ORDER BY Quantity desc
limit 5;

