# DATABASE CONCEPTS

# [](#header-2) Assignment

You Need to do the following things in your database assignment: (Total 100 marks)
1. Create Entity - Relation Diagram for the restaurants management system. (20 marks)
2. Pick Customers module of the ER Diagram and created the Tables with Proper relationships. (30 marks)
Module details: Restaurant's Customers including order, menu(including price). Billing.
3. Insert some data.
For the below things you can assume your own business requirement and do the followings things.
5. Create following Views: (10 marks)
vw_customerSnapshot : To show customer with most visits, and customer Details.
vw_OrderSnapshot: To show Most Ordered Item, and item details.
6. Create a function to fetch the time since order was placed by a customer. (10 marks)
fn_GetOrderTimeElapsed(CustomerID)
7. Create a Procedure to get Order for a customer (15 marks)
sp_GetOrder(IN CustomerID) (Returns Order Details as a Table)
8. Create a Procedure to Generate bill for an order. (15 marks)
sp_GenerateBill(IN OrderID, OUT Bill_AMT)

# [](#header-2) Schema

### Rough sketch

![](https://github.com/yogeshwarreddy/database_concepts/blob/master/assignments/ER%20diagram%20drawn%20in%20class.png)


### Final Schema

![](https://raw.githubusercontent.com/yogeshwarreddy/database_concepts/master/assignments/ER%20diagram%20drawn%20in%20class.png)


[SQL Dump file](https://github.com/yogeshwarreddy/database_concepts/blob/master/assignments/restaurant_db_dump.sql)
