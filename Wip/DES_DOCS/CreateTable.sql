-----------create Delivery Type-------------done
CREATE TABLE DeliveryType
(
	DeliveryTypeID int NOT NULL,
	DeliveryName varchar(100),
	PRIMARY KEY (DeliveryTypeID) 
)

DROP TABLE DeliveryType;

ALTER TABLE Order1
ADD DeliveryTypeID int,
Foreign key (DeliveryTypeID)
REFERENCES DeliveryType (DeliveryTypeID)

--------------create Delivery Category-------------------------done
CREATE TABLE DeliveryCategory
(
	DeliveryCategoryID int NOT NULL,
	DeliveryCategoryName varchar(100),
	PRIMARY KEY (DeliveryCategoryID)
)

ALTER TABLE Order1
ADD DeliveryCategoryID int,
 Foreign key (DeliveryCategoryID)
REFERENCES DeliveryCategory (DeliveryCategoryID)
-----------------FK OrderID (Order - Item)----------------done
ALTER TABLE Item
ADD OrderId int
ALTER TABLE Item
ADD Foreign key (OrderId)
REFERENCES Order1 (OrderId)

------create HubCategory---------done
CREATE TABLE HubCategory
(
	HubCategoryId int NOT NULL,
	HubCategoryName varchar(255),
	isActive bit NOT NULL
	PRIMARY KEY (HubCategoryId)
)

--- create Hub table------done
ALTER TABLE Hub

ADD HubCategoryId int,
	FOREIGN KEY (HubCategoryId) 
	REFERENCES HubCategory (HubCategoryId) 

----FK HubID (Order-Hub)---------done

ALTER TABLE OrderEnty	
ADD 
	FOREIGN KEY (HubId)
	REFERENCES Hub (HubId)

--------------create Price Category-------------done
CREATE TABLE PriceCategory
(
	PriceCategoryId int NOT NULL,
	Price decimal(19,2) NOT NULL,
	OrderId int,
	PRIMARY KEY (PriceCategoryId),
	FOREIGN KEY (OrderId)
	REFERENCES OrderEnty (OrderId)
	
)

-----create Tiktak Staff---------------done
CREATE TABLE TiktakStaff
(
	StaffId int NOT NULL,
	StaffRole varchar(50),
	PRIMARY KEY (StaffId)
)

-------------create Price Tracking------------done
CREATE TABLE PricingTracking
(
	PricingTrackingId int NOT NULL,
	PriceCategoryId int,
	EditType int ,
	StaffId int,
	EditDate date,
	PRIMARY KEY (PricingTrackingId),
	FOREIGN KEY (PriceCategoryId)
	REFERENCES PriceCategory (PriceCategoryId),
	FOREIGN KEY (StaffId)
	REFERENCES TiktakStaff (StaffId)
	
)

----create Delivery Men table ----------------done
CREATE TABLE DeliveryMen
(
	DeliveryMenId int NOT NULL,
	Status varchar(50),
	PRIMARY KEY (DeliveryMenId)
)

-------------------create Plan--------------------done
CREATE TABLE Planp
(
	PlanId int NOT NULL,
	CreatedDate date,
	CreatedByUserId int NOT NULL,
	FinishedDate date,
	Note varchar(100),
	StaffId int,
	PlanTypeId int NOT NULL,-- neu plantypeId la kieu int thi fai co 1 table cho plan type define no
	StartDate date
	PRIMARY KEY (PlanId),
	FOREIGN KEY (StaffId)REFERENCES TiktakStaff (StaffId),
)

----------create DeliveryMen In Plan-----------------done
CREATE TABLE DeliveryMenInPlan
(
	DeliveryMenInPlanId int NOT NULL,
	DeliveryMenId int,
	PlanId int,
	AssignedDate date,
	EstimateDistance decimal (19,2),
	EstimateTime decimal (19,2),
	PRIMARY KEY (DeliveryMenInPlanId),
	FOREIGN KEY (DeliveryMenId) REFERENCES DeliveryMen (DeliveryMenId),	
	FOREIGN KEY (PlanId) REFERENCES Planp (PlanId)
)

-----------------create Cargo---------------done
CREATE TABLE Cargo
(
	CargoId int NOT NULL,
	Address varchar(100),
	CargoColumn int,
	PlanId int NOT NULL,
	CargoType int,
	RequestId int,
	OrderId int,
	PRIMARY KEY (CargoId),
	FOREIGN KEY (PlanId) REFERENCES Planp (PlanId),
	FOREIGN KEY (RequestId) REFERENCES Request (RequestId),
	FOREIGN KEY (OrderId) REFERENCES OrderEnty (OrderId)
)

----------------create Product----------------done
CREATE TABLE Product
(
	ProductId int NOT NULL,
	ProductCategory int,
	Name varchar(255),
	ProductWidth decimal(19,2),
	ProductHeight decimal(19,2),
	ProductLength decimal(19,2),
	ProductWeight decimal(19,2),
	ProductPrice decimal(19,2),
	ItemId int,
	CustomerId int NOT NULL,
	PRIMARY KEY (ProductId),
	FOREIGN KEY (ItemId) REFERENCES Item (ItemId),
	FOREIGN KEY (CustomerId) REFERENCES Customer (CustomerId)
	
)

--------------
ALTER TABLE Request
ADD 
	FOREIGN KEY (CustomerId) REFERENCES Customer (CustomerId)
	
-----------------
ALTER TABLE Request
ADD Latitude decimal(19,16),
	Longtitude decimal (19,16)
	
--------------------------
DROP TABLE PricingTracking;

----------------------create PriceCategory------------done
ALTER TABLE PriceCategory
ADD StaffId int,
	EditDate date
	FOREIGN KEY (StaffId) REFERENCES TiktakStaff (StaffId)
	
---------------create Hub Category----------------------done
CREATE TABLE HubCategory
(
	HubCategoryId int NOT NULL,
	HubName varchar(255),
	isActive bit NOT NULL,
	PRIMARY KEY (HubCategoryId)
)

---------------
ALTER TABLE Hub
ADD HubCategoryId int,
	OrderId int,
	FOREIGN KEY (HubCategoryId) REFERENCES HubCategory (HubCategoryId),
	FOREIGN KEY (OrderId) REFERENCES Orderenty (OrderId)