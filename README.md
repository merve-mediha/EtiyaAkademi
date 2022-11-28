# EtiyaCamp

```sh
Select * from users
```
![](image/users.png)

## Insert Into
```sh
INSERT INTO users ( email, phone, name) VALUES ( 'ismail@gmail.com', '151617', 'ismail');
INSERT INTO users ( email, phone, name) VALUES ( 'veysel@icloud.com', '5678', 'veysel');
```
![](image/insertusers.png)

## Join yapıları
---
##
### Inner Join
```sh
Select * from products p
inner join products_categories pc
on p.product_id=pc.product_id
inner join categories c
on pc.category_id=c.category_id
```
![](image/innerjoin.png)
---
##
### Right Join
```sh
Select * from products p
right join products_categories pc
on p.product_id=pc.product_id
right join categories c
on pc.category_id=c.category_id
```
![](image/rightjoin.png)
---
##
### Left Join
```sh
Select * from products p
left join products_categories pc
on p.product_id=pc.product_id
left join categories c
on pc.category_id=c.category_id
```
![](image/leftjoin.png)
---
##
### Full Join
```sh
Select * from products p
full join products_categories pc
on p.product_id=pc.product_id
full join categories c
on pc.category_id=c.category_id
```
![](image/fulljoin.png)

