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

-------------------create Plan--------------------
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

----------create DeliveryMen In Plan-----------------error
CREATE TABLE DeliveryMenInPlan
(
	DeliveryMenInPlanId int NOT NULL,
	DeliveryMenId int ,
	PlanId int,
	AssignedDate date,
	EstimateDistance decimal (19,2),
	EstimateTime decimal (19,2),
	PRIMARY KEY (DeliveryMenInPlanId),
	FOREIGN KEY (DeliveryMenId) REFERENCES DeliveryMen (DeliveryMenId),	
	FOREIGN KEY (PlanId) REFERENCES Planp (PlanId)
)
