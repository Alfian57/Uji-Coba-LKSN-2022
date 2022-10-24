CREATE DATABASE LKSMart
GO
USE LKSMart

CREATE TABLE PaymentType(
	id						INT				NOT NULL	IDENTITY,
	name					VARCHAR(200)	NOT NULL,
	created_at				DATETIME		NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	last_updated_at			DATETIME,
	deleted_at				DATETIME,
	PRIMARY KEY (id),
)

CREATE TABLE Customer(
	id						INT				NOT NULL	IDENTITY,
	[name]					VARCHAR(200)	NOT NULL,
	phone_number			VARCHAR(200)	NOT NULL	UNIQUE,
	email					VARCHAR(200)	NOT NULL	UNIQUE,
	[pin_number]			VARCHAR(6)		NOT NULL,
	[date_of_birth]			DATE,
	[address]				VARCHAR(200),	
	gender					VARCHAR(10),	/*'Male' or 'Female'*/
	[point]					INT				NOT NULL	DEFAULT 0,
	[profile_image_name]	VARCHAR(200),
	created_at				DATETIME		NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	last_updated_at			DATETIME,
	deleted_at				DATETIME,
	PRIMARY KEY (id),
)

CREATE TABLE Category(
	id						INT				NOT NULL	IDENTITY,
	parent_id				INT,
	[name]					VARCHAR(200)	NOT NULL,
	created_at				DATETIME		NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	last_updated_at			DATETIME,
	deleted_at				DATETIME,
	PRIMARY KEY (id),
	FOREIGN KEY (parent_id) REFERENCES Category(id),
);

CREATE TABLE Product(
	id						INT				NOT NULL IDENTITY,
	category_id				INT				NOT NULL,
	[name]					VARCHAR(200)	NOT NULL,
	price					DECIMAL(10,2)	NOT NULL,
	stock					INT				NOT NULL,
	[image_name]			VARCHAR(200),
	created_at				DATETIME		NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	last_updated_at			DATETIME,
	deleted_at				DATETIME,
	PRIMARY KEY (id),
	FOREIGN KEY (category_id) REFERENCES Category(id),
);

CREATE TABLE HeaderTransaction(
	id						INT				NOT NULL	IDENTITY,
	customer_id				INT				NOT NULL,
	payment_type_id			INT				NOT NULL,
	[datetime]				DATETIME		NOT NULL,
	[sub_total]				DECIMAL(10, 2)  NOT NULL,
	[point_used]			INT 			 NOT NULL,
	[payment_code]			VARCHAR(200)	NOT NULL,
	created_at				DATETIME		NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	last_updated_at			DATETIME,
	deleted_at				DATETIME,
	PRIMARY KEY (id),
	FOREIGN KEY (customer_id) REFERENCES Customer(id),
	FOREIGN KEY (payment_type_id) REFERENCES PaymentType(id),
)

CREATE TABLE DetailTransaction(
	id						INT				NOT NULL	IDENTITY,
	header_transaction_id	INT				NOT NULL,
	product_id				INT				NOT NULL,
	price					DECIMAL(10, 2)	NOT NULL,
	quantity				INT				NOT NULL,
	created_at				DATETIME		NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	last_updated_at			DATETIME,
	deleted_at				DATETIME,
	PRIMARY KEY (id),
	FOREIGN KEY (header_transaction_id) REFERENCES HeaderTransaction(id),
	FOREIGN KEY (product_id) REFERENCES Product(id),
)

CREATE TABLE PointHistory(
	id						INT				NOT NULL	IDENTITY,
	customer_id				INT				NOT NULL,
	header_transaction_id	INT,
	point_gained			INT,
	point_deducted			INT,
	point_before			INT				NOT NULL,
	point_after				INT				NOT NULL,
	created_at				DATETIME		NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	last_updated_at			DATETIME,
	deleted_at				DATETIME,
	PRIMARY KEY (id),
	FOREIGN KEY (customer_id) REFERENCES Customer(id),
	FOREIGN KEY (header_transaction_id) REFERENCES HeaderTransaction(id),
)


--INSERT PaymentType
INSERT INTO PaymentType(name) VALUES('GoPay')
INSERT INTO PaymentType(name) VALUES('OVO')
INSERT INTO PaymentType(name) VALUES('ShopeePay')
INSERT INTO PaymentType(name) VALUES('Dana')
INSERT INTO PaymentType(name) VALUES('Cash')


--DELETE PaymentType
UPDATE PaymentType SET deleted_at = CURRENT_TIMESTAMP WHERE id = 5





--INSERT Customer
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Phillip Weldon', '5-702-174-1306', 'Phillip_Weldon4180@fuliss.net', '680660', '06/10/1974', 'Cliff  Crossroad, 2522', null, '77792', 'avatar1')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Ryan Vallory', '8-268-172-1832', 'Ryan_Vallory1159@iatim.tech', '610327', '12/02/1992', null, 'Female', '10000', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Molly Egerton', '2-483-126-0422', 'Molly_Egerton773@eirey.tech', '140018', '02/21/1973', 'Canal  Vale, 362', null, '18857', 'avatar2')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('David Shepherd', '0-662-807-1824', 'David_Shepherd6909@sveldo.biz', '895491', null, 'Cleveland  Hill, 2376', null, '33188', 'avatar6')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Matthew Watson', '6-514-103-0871', 'Matthew_Watson2661@bungar.biz', '160052', null, 'Birkenhead   Tunnel, 8650', 'Female', '95516', 'avatar5')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Barney Sherwood', '1-848-482-4561', 'Barney_Sherwood3441@naiker.biz', '323193', '10/28/1973', null, 'Male', '26988', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Matthew Walsh', '1-546-880-0862', 'Matthew_Walsh2989@brety.org', '154387', null, 'Emily  Pass, 3869', 'Female', '10000', 'avatar3')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Bryce Dale', '4-601-163-5750', 'Bryce_Dale8241@extex.org', '784279', '06/25/1974', 'Canon Way, 8869', 'Male', '10000', 'avatar3')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Joseph Freeburn', '1-405-748-5130', 'Joseph_Freeburn281@grannar.com', '217184', '07/07/1960', null, null, '10000', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Catherine Parker', '4-837-220-4816', 'Catherine_Parker5150@guentu.biz', '307073', '08/22/1966', 'Berry  Grove, 8869', 'Female', '40162', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Chadwick Turner', '5-874-254-0570', 'Chadwick_Turner8364@twipet.com', '480141', '03/23/1976', 'Black Friars   Way, 5277', null, '10000', 'avatar3')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Carolyn Moran', '0-317-434-7864', 'Carolyn_Moran7274@iatim.tech', '251997', null, null, null, '10000', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Manuel Kennedy', '1-867-326-2417', 'Manuel_Kennedy1973@gmail.com', '449943', '02/17/1970', 'Kinglake  Lane, 1157', 'Female', '35195', 'avatar1')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Macy Dann', '1-734-035-7571', 'Macy_Dann7905@extex.org', '79757', null, null, 'Male', '62905', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Nicholas Pickard', '0-288-028-3862', 'Nicholas_Pickard40@gmail.com', '988118', '05/18/1973', 'Viscount   Crossroad, 2981', 'Male', '10000', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Bart Mackenzie', '3-583-255-8051', 'Bart_Mackenzie8038@gompie.com', '988652', '11/09/1982', 'Blue Anchor  Crossroad, 504', null, '10000', 'avatar5')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Vivian Morris', '0-170-454-7454', 'Vivian_Morris2190@brety.org', '145363', null, null, null, '10000', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Thea Bristow', '1-503-212-2211', 'Thea_Bristow3229@zorer.org', '567954', '08/11/1964', 'Camley   Boulevard, 952', 'Female', '10000', 'avatar6')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Percy Jacobs', '3-780-680-4188', 'Percy_Jacobs6101@guentu.biz', '668603', null, 'Spruce Vale, 7374', 'Male', '86677', 'avatar3')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Nicholas Patel', '4-557-762-2632', 'Nicholas_Patel2442@acrit.org', '254499', '06/16/1963', 'Clerkenwell Street, 9487', 'Male', '53502', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Hannah Yang', '5-820-836-5337', 'Hannah_Yang3179@atink.com', '240953', null, null, null, '82711', 'avatar5')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Jacqueline Patel', '3-020-168-3020', 'Jacqueline_Patel6950@corti.com', '965812', null, null, 'Female', '89373', 'avatar2')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Bob Furnell', '7-631-184-4852', 'Bob_Furnell3811@eirey.tech', '128335', null, null, 'Male', '58209', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Tiffany Gibbons', '7-823-174-8828', 'Tiffany_Gibbons8867@nanoff.biz', '107085', '03/22/1968', 'Archery  Grove, 7254', null, '21805', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Mike Lane', '7-227-114-2141', 'Mike_Lane6092@supunk.biz', '451939', '06/26/1996', 'Rail Boulevard, 8452', 'Male', '5040', 'avatar3')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Kate Myatt', '7-113-675-2015', 'Kate_Myatt213@dionrab.com', '799968', '01/25/1974', 'Bush  Route, 5757', 'Female', '10000', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Chester Dwyer', '5-404-247-4331', 'Chester_Dwyer6791@bauros.biz', '435091', null, 'Unwin  Street, 302', null, '10000', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Tyson Rycroft', '0-507-562-5112', 'Tyson_Rycroft5502@infotech44.tech', '150990', null, null, 'Male', '10000', 'avatar2')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('George Clayton', '6-805-400-7414', 'George_Clayton5572@typill.biz', '435425', null, 'Cephas  Lane, 7073', 'Male', '4887', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Benny Baker', '2-035-242-6835', 'Benny_Baker4758@mafthy.com', '212328', '04/15/1981', 'Jackson Lane, 1310', 'Male', '10000', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Valentina Yang', '6-512-850-4783', 'Valentina_Yang8270@bulaffy.com', '973479', '12/10/1972', null, 'Female', '10000', 'avatar5')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Susan Flack', '4-678-155-7754', 'Susan_Flack7422@kideod.biz', '977087', '03/26/1976', null, 'Female', '10000', 'avatar3')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Rosa Gibbons', '2-211-253-7035', 'Rosa_Gibbons9289@brety.org', '798771', '10/04/1970', 'Abourne   Pass, 6074', 'Female', '10000', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Elijah Dubois', '8-803-080-2326', 'Elijah_Dubois6532@bretoux.com', '904131', null, 'Wager   Grove, 8689', null, '60070', 'avatar5')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Bree Hooper', '3-026-788-4636', 'Bree_Hooper6488@twipet.com', '730805', '05/19/1994', 'Apothecary   Avenue, 4224', 'Female', '10000', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Adelaide Weatcroft', '6-680-305-2480', 'Adelaide_Weatcroft6933@grannar.com', '739971', '12/18/1988', 'Falconberg   Tunnel, 6984', 'Female', '59364', 'avatar1')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Alice Spencer', '5-335-628-3115', 'Alice_Spencer6374@famism.biz', '706937', null, null, 'Female', '10000', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Clint Hogg', '0-468-135-6317', 'Clint_Hogg9473@eirey.tech', '784007', '02/16/1989', null, 'Male', '10000', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('George Wallace', '1-620-570-2245', 'George_Wallace2313@extex.org', '139878', '06/07/1962', 'Westbourne Tunnel, 5942', 'Male', '2411', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('David Hale', '3-847-203-3273', 'David_Hale4173@iatim.tech', '34656', '03/04/1995', 'Bacon  Tunnel, 5476', 'Male', '53620', 'avatar2')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Emmanuelle Wilson', '4-215-608-2316', 'Emmanuelle_Wilson3392@gembat.biz', '513303', '10/21/1992', null, null, '37797', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Chuck Coll', '5-762-308-0502', 'Chuck_Coll6682@nanoff.biz', '318126', '04/15/1981', 'Bazely   Street, 9696', null, '48761', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Sebastian Denton', '5-002-845-7405', 'Sebastian_Denton1537@naiker.biz', '722858', '06/02/1974', 'Baltic  Street, 415', null, '10000', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('George Powell', '3-674-260-0380', 'George_Powell2705@nanoff.biz', '772221', '01/03/1961', null, 'Male', '86842', 'avatar1')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Shay Wise', '6-028-606-2178', 'Shay_Wise211@bauros.biz', '849110', null, 'Thrale   Boulevard, 9264', 'Female', '15979', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Norah Waterson', '1-077-702-4886', 'Norah_Waterson4232@jiman.org', '929129', '03/18/1980', 'Blackwall  Walk, 6893', null, '10000', 'avatar6')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Hadley Reading', '5-422-841-6863', 'Hadley_Reading2367@fuliss.net', '919390', '12/26/1988', null, 'Female', '14949', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Susan Stevens', '3-011-666-3372', 'Susan_Stevens7117@deons.tech', '198943', null, 'Wager   Route, 1345', null, '7689', 'avatar1')
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Regina Pitt', '1-233-353-7114', 'Regina_Pitt7482@guentu.biz', '769666', '04/20/1982', 'Callcott   Vale, 395', 'Female', '64170', null)
INSERT INTO Customer(name, phone_number, email, pin_number, date_of_birth, address, gender, point, profile_image_name) VALUES('Sebastian Middleton', '1-380-861-5430', 'Sebastian_Middleton9761@supunk.biz', '611330', '08/03/1971', 'Boleyn  Street, 9248', 'Male', '10000', 'avatar6')


--DELETE Customer
UPDATE Customer SET deleted_at = CURRENT_TIMESTAMP WHERE id = 3
UPDATE Customer SET deleted_at = CURRENT_TIMESTAMP WHERE id = 6
UPDATE Customer SET deleted_at = CURRENT_TIMESTAMP WHERE id = 45
UPDATE Customer SET deleted_at = CURRENT_TIMESTAMP WHERE id = 31
UPDATE Customer SET deleted_at = CURRENT_TIMESTAMP WHERE id = 17
UPDATE Customer SET deleted_at = CURRENT_TIMESTAMP WHERE id = 8
UPDATE Customer SET deleted_at = CURRENT_TIMESTAMP WHERE id = 22
UPDATE Customer SET deleted_at = CURRENT_TIMESTAMP WHERE id = 14
UPDATE Customer SET deleted_at = CURRENT_TIMESTAMP WHERE id = 29
UPDATE Customer SET deleted_at = CURRENT_TIMESTAMP WHERE id = 40
UPDATE Customer SET deleted_at = CURRENT_TIMESTAMP WHERE id = 33
UPDATE Customer SET deleted_at = CURRENT_TIMESTAMP WHERE id = 41

--INSERT Category
INSERT INTO Category(parent_id, name) VALUES(null, 'Makanan & Minuman')
INSERT INTO Category(parent_id, name) VALUES(1, 'Makanan Ringan')
INSERT INTO Category(parent_id, name) VALUES(2, 'Keripik')
INSERT INTO Category(parent_id, name) VALUES(2, 'Biskuit & Wafer')
INSERT INTO Category(parent_id, name) VALUES(2, 'Kacang')
INSERT INTO Category(parent_id, name) VALUES(2, 'Camilan Instant')
INSERT INTO Category(parent_id, name) VALUES(2, 'Cokelat')
INSERT INTO Category(parent_id, name) VALUES(1, 'Minuman')
INSERT INTO Category(parent_id, name) VALUES(9, 'Air Mineral')
INSERT INTO Category(parent_id, name) VALUES(9, 'Soft Drink')
INSERT INTO Category(parent_id, name) VALUES(9, 'Minuman Kemasan')
INSERT INTO Category(parent_id, name) VALUES(1, 'Makanan Beku')
INSERT INTO Category(parent_id, name) VALUES(13, 'Sosis')
INSERT INTO Category(parent_id, name) VALUES(13, 'Nugget')
INSERT INTO Category(parent_id, name) VALUES(13, 'Baso')
INSERT INTO Category(parent_id, name) VALUES(null, 'Kesehatan')
INSERT INTO Category(parent_id, name) VALUES(16, 'Obat-obatan')
INSERT INTO Category(parent_id, name) VALUES(16, 'Masker')
INSERT INTO Category(parent_id, name) VALUES(18, 'Masker Kesehatan')
INSERT INTO Category(parent_id, name) VALUES(18, 'Pelindung Wajah')
INSERT INTO Category(parent_id, name) VALUES(17, 'Obat Batuk & Pilek')
INSERT INTO Category(parent_id, name) VALUES(17, 'Obat Mata')
INSERT INTO Category(parent_id, name) VALUES(17, 'Obat Herbal')
INSERT INTO Category(parent_id, name) VALUES(null, 'Office & Stationery')
INSERT INTO Category(parent_id, name) VALUES(24, 'Alat Tulis')
INSERT INTO Category(parent_id, name) VALUES(25, 'Penggaris')
INSERT INTO Category(parent_id, name) VALUES(25, 'Penghapus')
INSERT INTO Category(parent_id, name) VALUES(25, 'Pulpen')
INSERT INTO Category(parent_id, name) VALUES(25, 'Pensil')
INSERT INTO Category(parent_id, name) VALUES(24, 'Surat-Menyurat')
INSERT INTO Category(parent_id, name) VALUES(30, 'Amplop')
INSERT INTO Category(parent_id, name) VALUES(30, 'Perangko')
INSERT INTO Category(parent_id, name) VALUES(17, 'Obat Traditional')
INSERT INTO Category(parent_id, name) VALUES(24, 'Kertas')
INSERT INTO Category(parent_id, name) VALUES(34, 'Kertas HVS')
INSERT INTO Category(parent_id, name) VALUES(34, 'Sticky Notes')
INSERT INTO Category(parent_id, name) VALUES(null, 'Fashion')
INSERT INTO Category(parent_id, name) VALUES(37, 'Pakaian Wanita')
INSERT INTO Category(parent_id, name) VALUES(37, 'Pakaian Pria')
INSERT INTO Category(parent_id, name) VALUES(37, 'Pakaian Anak-anak')

--DELETE Category
UPDATE Category SET deleted_at = CURRENT_TIMESTAMP WHERE id = 35
UPDATE Category SET deleted_at = CURRENT_TIMESTAMP WHERE id = 36
UPDATE Category SET deleted_at = CURRENT_TIMESTAMP WHERE id = 34
UPDATE Category SET deleted_at = CURRENT_TIMESTAMP WHERE id = 37
UPDATE Category SET deleted_at = CURRENT_TIMESTAMP WHERE id = 38
UPDATE Category SET deleted_at = CURRENT_TIMESTAMP WHERE id = 39
UPDATE Category SET deleted_at = CURRENT_TIMESTAMP WHERE id = 40





--INSERT Product
INSERT INTO Product(category_id, name, price, stock, image_name) VALUES(3, 'Juhi Panggang', 85000, 500, '1_juhi_panggang.jpg')
INSERT INTO Product(category_id, name, price, stock, image_name) VALUES(3, 'Keripik Emping', 33000, 20, '2_keripik_emping.jpg')
INSERT INTO Product(category_id, name, price, stock, image_name) VALUES(4, 'Roma Malkist Keju Tabur Trio', 36000, 0, '3_roma_malkist_keju_tabur_trio.jpg')
INSERT INTO Product(category_id, name, price, stock, image_name) VALUES(4, 'Tango', 5500, 45, '4_tango.jpg')
INSERT INTO Product(category_id, name, price, stock, image_name) VALUES(5, 'Kacang Almond', 58500, 13, 'null')
INSERT INTO Product(category_id, name, price, stock, image_name) VALUES(7, 'Silver Queen', 7800, 0, 'null')
INSERT INTO Product(category_id, name, price, stock, image_name) VALUES(9, 'Crystalline', 4360, 60, '7_crystalline.jpg')
INSERT INTO Product(category_id, name, price, stock, image_name) VALUES(9, 'Aqua Gelas Dus', 43000, 5, '8_aqua_gelas_dus.jpg')
INSERT INTO Product(category_id, name, price, stock, image_name) VALUES(11, 'Ultra Teh Kotak', 3310, 200, 'null')
INSERT INTO Product(category_id, name, price, stock, image_name) VALUES(11, 'Larutan Kaki Tiga', 6640, 15, '10_larutan_kaki_tiga.jpg')
INSERT INTO Product(category_id, name, price, stock, image_name) VALUES(11, 'Yakult', 8300, 6, '11_yakult.jpg')
INSERT INTO Product(category_id, name, price, stock, image_name) VALUES(14, 'Fiesta Chicken Nugget', 44555, 3, 'null')
INSERT INTO Product(category_id, name, price, stock, image_name) VALUES(35, 'HVS Paper One A4', 177777, 1, '13_hvs_paper_one.jpg')
INSERT INTO Product(category_id, name, price, stock, image_name) VALUES(28, 'Standard AE7', 15990, 21, '14_standard_ae7.jpg')
INSERT INTO Product(category_id, name, price, stock, image_name) VALUES(28, 'Pilot G2', 13700, 5, 'null')
INSERT INTO Product(category_id, name, price, stock, image_name) VALUES(4, 'Oops', 10500, 0, '')
INSERT INTO Product(category_id, name, price, stock, image_name) VALUES(3, 'Juhi Panggang KW Super', 55500, 300, '17_juhi_panggang_kw.jpg')
INSERT INTO Product(category_id, name, price, stock, image_name) VALUES(9, 'Vit Gelas Dus', 36000, 78, '18_vit_gelas_dus.jpg')


--DELETE Product
UPDATE Product SET deleted_at = CURRENT_TIMESTAMP WHERE id = 13
UPDATE Product SET deleted_at = CURRENT_TIMESTAMP WHERE id = 16



--INSERT HeaderTransaction
INSERT INTO HeaderTransaction(customer_id, payment_type_id, [datetime], sub_total, point_used, payment_code) VALUES(2, 1, '2021-10-25 10:23:44', 310000, 23417, 'FBih234kizCD')

INSERT INTO HeaderTransaction(customer_id, payment_type_id, [datetime], sub_total, point_used, payment_code) VALUES(4, 2, '2021-10-26 08:05:21', 115940, 0, 'ovUOW19VcmX6')

--INSERT DetailTransaction
INSERT INTO DetailTransaction(header_transaction_id, product_id, price, quantity) VALUES(1, 1, 84000, 3)
INSERT INTO DetailTransaction(header_transaction_id, product_id, price, quantity) VALUES(1, 5, 58000, 1)

INSERT INTO DetailTransaction(header_transaction_id, product_id, price, quantity) VALUES(2, 8, 43000, 1)
INSERT INTO DetailTransaction(header_transaction_id, product_id, price, quantity) VALUES(2, 9, 3310, 10)
INSERT INTO DetailTransaction(header_transaction_id, product_id, price, quantity) VALUES(2, 10, 6640, 6)


--INSERT PointHistory
INSERT INTO PointHistory(customer_id, header_transaction_id, point_gained, point_deducted, point_before, point_after) VALUES(2, 1, 0, 23417, 23417, 0)
INSERT INTO PointHistory(customer_id, header_transaction_id, point_gained, point_deducted, point_before, point_after) VALUES(4, 2, 23188, 0, 10000, 33188)

--SP_MSFOREACHTABLE 'DROP TABLE ?'