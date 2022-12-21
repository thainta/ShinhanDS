Create SEQUENCE Prices_FoodItemTypeID_SEQ;
Create SEQUENCE Campus_CampusID_SEQ;
Create SEQUENCE Position_PositionID_SEQ;
Create SEQUENCE Members_MemberID_SEQ;
Create SEQUENCE FoodItems_FoodItemID_SEQ;
Create SEQUENCE Orders_OrderID_SEQ;

Create table CAMPUS(
    CampusID NUMBER(5) DEFAULT Campus_CampusID_SEQ.nextval NOT NULL,
    CampusName varchar2(100),
    Street varchar2(100),
    City varchar2(100),
    State varchar2(100),
    Zip varchar2(100),
    Phone varchar2(100),
    CampusDiscount DECIMAL(2,2),
    
    CONSTRAINT campus_pk PRIMARY KEY(CampusID)
);

Create table POSITION(
    PositionID NUMBER(5) DEFAULT Position_PositionID_SEQ.nextval NOT NULL,
    Position varchar2(100),
    YearlyMembershipFee DECIMAL(7,2),
    
    CONSTRAINT position_pk PRIMARY KEY(PositionID)
);

create table MEMBERS(
    MemberID NUMBER(5)DEFAULT Members_MemberID_SEQ.nextval NOT NULL,
    LastName varchar2(100),
    FirstName varchar2(100),
    CampusAddress varchar2(100),
    CampusPhone varchar2(100),
    CampusID NUMBER(5) NOT NULL,
    PositionID NUMBER(5) NOT NULL,
    ContractDuration NUMBER,
    
    CONSTRAINT members_pk PRIMARY KEY(MemberID),
    CONSTRAINT campus_fk FOREIGN KEY(CampusID) REFERENCES CAMPUS(CampusID),
    CONSTRAINT position_fk FOREIGN KEY(PositionID) REFERENCES POSITION(PositionID)
);


Create table  PRICES(
    FoodItemTypeID NUMBER(5) DEFAULT Prices_FoodItemTypeID_SEQ.nextval NOT NULL,
    MealType varchar2(100),
    MealPrice DECIMAL(7,2),
    
    CONSTRAINT prices_pk PRIMARY KEY(FoodItemTypeID)
);

Create table FOODITEMS(
    FoodItemID NUMBER(5)DEFAULT FOODITEMS_FOODITEMID_SEQ.nextval NOT NULL,
    FoodItemName varchar2(100),
    FoodItemTypeID NUMBER(5) NOT NULL,
    
    CONSTRAINT foodItems_pk PRIMARY KEY(FoodItemID),
    CONSTRAINT prices_fk FOREIGN KEY(FoodItemTypeID) REFERENCES PRICES(FoodItemTypeID)
);

Create table ORDERS(
    OrderID NUMBER(5) DEFAULT ORDERS_ORDERID_SEQ.nextval NOT NULL,
    MemberID NUMBER(5) NOT NULL,
    OrderDate varchar2(25),
    
    CONSTRAINT orders_pk PRIMARY KEY(OrderID),
    CONSTRAINT members_fk FOREIGN KEY(MemberID) REFERENCES MEMBERS(MemberID)
);

Create table ORDERLINE(
    OrderID NUMBER(5) NOT NULL,
    FoodItemID NUMBER(5) NOT NULL,
    Quantity NUMBER,
    
    CONSTRAINT orderLine_pk PRIMARY KEY(OrderID, FoodItemID),
    CONSTRAINT orders_fk FOREIGN KEY(OrderID) REFERENCES ORDERS(OrderID),
    CONSTRAINT foodItems_fk FOREIGN KEY(FoodItemID) REFERENCES FOODITEMS(FoodItemID)
);

--CAMPUS
INSERT INTO CAMPUS(CampusName, Street, City, State, Zip, Phone, CampusDiscount) 
    VALUES('IUPUI','425 University Blvd.', 'Indianapolis', 'IN', '46202', '317-274-4591',.08 );
INSERT INTO CAMPUS(CampusName, Street, City, State, Zip, Phone, CampusDiscount) 
    VALUES('Indiana University', '107 S. Indiana Ave.', 'Bloomington', 'IN','47405', '812-855- 4848',.07);
INSERT INTO CAMPUS(CampusName, Street, City, State, Zip, Phone, CampusDiscount) 
    VALUES('Purdue University', '475 Stadium Mall Drive', 'West Lafayette', 'IN', '47907', '765- 494-1776',.06);
    
-- POSITION
INSERT INTO POSITION(Position, YearlyMembershipFee) 
    VALUES('Lecturer', 1050.50);
INSERT INTO POSITION(Position, YearlyMembershipFee) 
    VALUES('Associate Professor', 900.50 );
INSERT INTO POSITION(Position, YearlyMembershipFee) 
    VALUES('Assistant Professor', 875.50);
INSERT INTO POSITION(Position, YearlyMembershipFee) 
    VALUES('Professor', 700.75);
INSERT INTO POSITION(Position, YearlyMembershipFee) 
    VALUES('Full Professor', 500.50);
    
-- Member
INSERT INTO MEMBERS(LastName, FirstName, CampusAddress, CampusPhone, CampusID, PositionID, ContractDuration) 
    VALUES('Ellen', 'Monk', '009 Purnell', '812-123-1234', 2, 5, 12 );
INSERT INTO MEMBERS(LastName, FirstName, CampusAddress, CampusPhone, CampusID, PositionID, ContractDuration) 
    VALUES('Joe', 'Brady', '008 Statford Hall', '765-234-2345', 3, 2, 10  );
INSERT INTO MEMBERS(LastName, FirstName, CampusAddress, CampusPhone, CampusID, PositionID, ContractDuration) 
    VALUES('Dave', 'Davidson', '007 Purnell', '812-345-3456', 2, 3, 10 );
INSERT INTO MEMBERS(LastName, FirstName, CampusAddress, CampusPhone, CampusID, PositionID, ContractDuration) 
    VALUES('Sebastian', 'Cole', '210 Rutherford Hall', '765-234-2345', 3, 5, 10  );
INSERT INTO MEMBERS(LastName, FirstName, CampusAddress, CampusPhone, CampusID, PositionID, ContractDuration) 
    VALUES('Michael', 'Doo', '66C Peobody', '812-548-8956', 2, 1, 10  );
INSERT INTO MEMBERS(LastName, FirstName, CampusAddress, CampusPhone, CampusID, PositionID, ContractDuration) 
    VALUES('Jerome', 'Clark', 'SL 220', '317-274-9766', 1, 1, 12  );
INSERT INTO MEMBERS(LastName, FirstName, CampusAddress, CampusPhone, CampusID, PositionID, ContractDuration) 
    VALUES('Bob', 'House', 'ET 329', '317-278-9098', 1, 4, 10  );
INSERT INTO MEMBERS(LastName, FirstName, CampusAddress, CampusPhone, CampusID, PositionID, ContractDuration) 
    VALUES('Bridget', 'Stanley', 'SI 234', '317-274-5678', 1, 1, 12 );
INSERT INTO MEMBERS(LastName, FirstName, CampusAddress, CampusPhone, CampusID, PositionID, ContractDuration) 
    VALUES('Bradley', 'Wilson', '334 Statford Hall', '765-258-2567', 3, 2, 10);

--Prices
INSERT INTO PRICES(MealType, MealPrice) 
    VALUES('Beer/Wine', 5.50 );
INSERT INTO PRICES(MealType, MealPrice) 
    VALUES('Dessert', 2.75);
INSERT INTO PRICES(MealType, MealPrice) 
    VALUES('Dinner', 15.50 );
INSERT INTO PRICES(MealType, MealPrice) 
    VALUES('Soft Drink', 2.50);
INSERT INTO PRICES(MealType, MealPrice) 
    VALUES('Lunch', 7.25 );
--
INSERT INTO FoodItems(FoodItemID, FoodItemName, FoodItemTypeID) 
    VALUES(10001, 'Lager', 1);
INSERT INTO FoodItems(FoodItemID, FoodItemName, FoodItemTypeID) 
    VALUES(10002, 'Red Wine', 1);
INSERT INTO FoodItems(FoodItemID, FoodItemName, FoodItemTypeID) 
    VALUES(10003, 'White Wine', 1);
INSERT INTO FoodItems(FoodItemID, FoodItemName, FoodItemTypeID) 
    VALUES(10004, 'Coke', 4);
INSERT INTO FoodItems(FoodItemID, FoodItemName, FoodItemTypeID) 
    VALUES(10005,'Coffee', 4);
INSERT INTO FoodItems(FoodItemID, FoodItemName, FoodItemTypeID) 
    VALUES(10006, 'Chicken a la King', 3);
INSERT INTO FoodItems(FoodItemID, FoodItemName, FoodItemTypeID) 
    VALUES(10007,'Rib Steak', 3);
INSERT INTO FoodItems(FoodItemID, FoodItemName, FoodItemTypeID) 
    VALUES(10008, 'Fish and Chips', 3);
INSERT INTO FoodItems(FoodItemID, FoodItemName, FoodItemTypeID) 
    VALUES(10009, 'Veggie Delight', 3);
INSERT INTO FoodItems(FoodItemID, FoodItemName, FoodItemTypeID) 
    VALUES(10010,'Chocolate Mousse', 2);
INSERT INTO FoodItems(FoodItemID, FoodItemName, FoodItemTypeID) 
    VALUES(10011,'Carrot Cake', 2);
INSERT INTO FoodItems(FoodItemID, FoodItemName, FoodItemTypeID) 
    VALUES(10012,'Fruit Cup', 2);
INSERT INTO FoodItems(FoodItemID, FoodItemName, FoodItemTypeID) 
    VALUES(10013,'Fish and Chips', 5);
INSERT INTO FoodItems(FoodItemID, FoodItemName, FoodItemTypeID) 
    VALUES(10014,'Angus Beef Burger', 5);
INSERT INTO FoodItems(FoodItemID, FoodItemName, FoodItemTypeID) 
    VALUES(10015,'Cobb Salad', 5);
    
--Order
INSERT INTO ORDERS(MemberID, OrderDate) 
    VALUES(9, 'March 5, 2005' );
INSERT INTO ORDERS(MemberID, OrderDate) 
    VALUES(8, 'March 5, 2005' );
INSERT INTO ORDERS(MemberID, OrderDate) 
    VALUES(7, 'March 5, 2005' );
INSERT INTO ORDERS(MemberID, OrderDate) 
    VALUES(6, 'March 7, 2005' );
INSERT INTO ORDERS(MemberID, OrderDate) 
    VALUES(5, 'March 7, 2005' );
INSERT INTO ORDERS(MemberID, OrderDate) 
    VALUES(4, 'March 10, 2005' );
INSERT INTO ORDERS(MemberID, OrderDate) 
    VALUES(3, 'March 11, 2005' );
INSERT INTO ORDERS(MemberID, OrderDate) 
    VALUES(2, 'March 12, 2005' );
INSERT INTO ORDERS(MemberID, OrderDate) 
    VALUES(1, 'March 13, 2005');
    
--OrderLine
INSERT INTO ORDERLINE(OrderID, FoodItemID, Quantity) 
    VALUES(1,'10001',1);
INSERT INTO ORDERLINE(OrderID, FoodItemID, Quantity) 
    VALUES(1,'10006',1);
INSERT INTO ORDERLINE(OrderID, FoodItemID, Quantity) 
    VALUES(1,'10012',1);
INSERT INTO ORDERLINE(OrderID, FoodItemID, Quantity) 
    VALUES(2,'10004',2);
INSERT INTO ORDERLINE(OrderID, FoodItemID, Quantity) 
    VALUES(2,'10013',1);
INSERT INTO ORDERLINE(OrderID, FoodItemID, Quantity) 
    VALUES(2,'10014',1);
INSERT INTO ORDERLINE(OrderID, FoodItemID, Quantity) 
    VALUES(3,'10005',1);
INSERT INTO ORDERLINE(OrderID, FoodItemID, Quantity) 
    VALUES(3,'10011',1);
INSERT INTO ORDERLINE(OrderID, FoodItemID, Quantity) 
    VALUES(4,'10005',2);
INSERT INTO ORDERLINE(OrderID, FoodItemID, Quantity) 
    VALUES(4,'10004',2);
INSERT INTO ORDERLINE(OrderID, FoodItemID, Quantity) 
    VALUES(4,'10006',1);
INSERT INTO ORDERLINE(OrderID, FoodItemID, Quantity) 
    VALUES(4,'10007',1);
INSERT INTO ORDERLINE(OrderID, FoodItemID, Quantity) 
    VALUES(4,'10010',2);
INSERT INTO ORDERLINE(OrderID, FoodItemID, Quantity) 
    VALUES(5,'10003',1);
INSERT INTO ORDERLINE(OrderID, FoodItemID, Quantity) 
    VALUES(6,'10002',2);
INSERT INTO ORDERLINE(OrderID, FoodItemID, Quantity) 
    VALUES(7,'10005',2);
INSERT INTO ORDERLINE(OrderID, FoodItemID, Quantity) 
    VALUES(8,'10005',1);
INSERT INTO ORDERLINE(OrderID, FoodItemID, Quantity) 
    VALUES(8,'10011',1);
INSERT INTO ORDERLINE(OrderID, FoodItemID, Quantity) 
    VALUES(9,'10001',1);


--bai1
SELECT CONSTRAINT_NAME
    FROM user_constraints
    Where OWNER = 'MYDB' 
    AND TABLE_NAME IN(SELECT table_name
                        FROM all_tables
                        WHERE owner='MYDB');

--bai2
SELECT TABLE_NAME
    FROM ALL_TABLES
    WHERE OWNER='MYDB'
    ORDER BY TABLE_NAME;
    
--bai3
SELECT SEQUENCE_NAME FROM USER_SEQUENCES;

-- bai4
SELECT FirstName, LastName, Position,CampusName, YearlyMemberShipFee/12 as Monthy_Dues
FROM MEMBERS 
FULL OUTER JOIN POSITION
ON MEMBERS.PositionID = POSITION.PositionID
FULL OUTER JOIN CAMPUS
ON MEMBERS.CampusID = campus.campusid
ORDER BY CampusName DESC, LastName ASC;
