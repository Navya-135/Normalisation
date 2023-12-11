create table data.propertytype(
id int primary key auto_increment,
type varchar(20) not null,
description varchar(40) not null
);

drop table data.property;

create table data.property(
id int primary key  auto_increment,
propertyid int,
name varchar(20),
dimensions varchar(20),
constraint foreign key property_propertytype_propertyid(propertyid)references data.property(id)
);

alter table data.propertytype
drop foreign key propertytype_ifk_1;

create table data.address(
id int primary key auto_increment,
street varchar(20),
landmark varchar(20),
state varchar(20),
country varchar(20),
pincode int
);

create table data.addressmapping(
id int primary key auto_increment,
propertyid int,
addressid int,
constraint foreign key addressmapping_address_propertyid(propertyid)references data.property(id),
constraint foreign key addressmapping_address_addressid(addressid)references data.address(id)
);

drop table data.addressmapping;

insert into data.propertytype(type,description)values('apartment','info');
insert into data.propertytype(type,description)values('hostel','information');

select * from data.propertytype;

insert into data.property(propertyid,name,dimensions)values(1,'balaji vihar','200 inches');
insert into data.property(propertyid,name,dimensions)values(2,'MSR','200 inches');

select * from data.property;

insert into data.address(street,landmark,state,country,pincode)values('sr nagar','ratnadeep','Telangana','India',500000);
insert into data.address(street,landmark,state,country,pincode)values('vengalrao nagar','ratnadeep','Telangana','India',500000);

select * from data.address;

insert into data.addressmapping(propertyid,addressid)values(1,2);


alter table data.addressmapping
drop foreign key addressmapping_ifk_1;



select pt.type,p.name,am.propertyid,am.addressid from data.propertytype as pt
join data.property as p on pt.id=p.propertyid
join data.addressmapping as am on pt.id=am.addressid;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_propertydetails`()
BEGIN
select pt.type,p.name,am.propertyid,am.addressid from data.propertytype as pt
join data.property as p on pt.id=p.propertyid
join data.addressmapping as am on pt.id=am.addressid;
END$$
DELIMITER ;

DROP procedure IF EXISTS `save_propertytype`;
DROP procedure IF EXISTS `get_propertydetails`;

call get_propertydetails;

select * from propertytype;

call save_propertytype(3,'villas','nice');

DELIMITER $$
USE `data`$$
CREATE PROCEDURE `update_propertytype` (propertytypeid int,propertytype varchar(20),propertytypedescription varchar(40))
BEGIN
update propertytype set type=propertytype,description=propertytypedescription where id=propertytypeid;
END$$

DELIMITER ;

update propertytype set type='villa' where id=3;

delete from propertytype where type='villa';


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_property`()
BEGIN
select pt.type,p.name,am.propertyid,am.addressid from data.propertytype as pt
join data.property as p on pt.id=p.propertyid
join data.addressmapping as am on pt.id=am.addressid;
END$$
DELIMITER ;

call get_property;

select * from property;

call save_property(4,1,'MSR','400 inches');

DELIMITER $$
USE `data`$$
CREATE PROCEDURE `update_property` (propertyid int,propertyname varchar(20),propertyedimensions varchar(40))
BEGIN
update property set  name=propertyname,dimensions=propertydimensions where id=propertytypeid;
END$$

DELIMITER ;

update property set name='MSR' where id=4;

delete from property where name='MSR';


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_address`()
BEGIN
select pt.type,p.name,am.propertyid,am.addressid from data.propertytype as pt
join data.property as p on pt.id=p.propertyid
join data.addressmapping as am on pt.id=am.addressid;
END$$
DELIMITER ;

call get_address;

select * from address;

call save_address(3,'kalyan nagar','panipuri shop','ap',567890);

DELIMITER $$
USE `data`$$
CREATE PROCEDURE `update_address` (addressid int,addressstreet varchar(20),addresslandmark varchar(20),addressstate varchar(20),addresspincode int)
BEGIN
update address set id=addressid, street=addressstreet,landmark=addresslandmark,state=addressstate,pincode=addresspincode where id=addressid;
END$$

DELIMITER ;

update address set street='sr nagar' where id=1;

delete from address where street='sr nagar';


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_addressmapping`()
BEGIN
select pt.type,p.name,am.propertyid,am.addressid from data.propertytype as pt
join data.property as p on pt.id=p.propertyid
join data.addressmapping as am on pt.id=am.addressid;
END$$
DELIMITER ;

call get_addressmapping;

select * from addressmapping;

call save_addressmapping(2,2,3);

DELIMITER $$
USE `data`$$
CREATE PROCEDURE `update_addressmapping` (addressmappingid int,addressmappingpropertyid int,addressmappingaddressid int)
BEGIN
update addressmapping set id=addressmappingid, id=addressmappingpropertyid,id=addressmappingaddressid;
END$$

DELIMITER ;

update addressmapping set propertyid=2 where id=1;

delete from addressmapping where id=2;




