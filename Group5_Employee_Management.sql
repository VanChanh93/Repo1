DROP DATABASE IF EXISTS Group5;
CREATE DATABASE Group5;
USE Group5;

DROP TABLE IF EXISTS Department;
CREATE TABLE IF NOT EXISTS Department (
department_id			INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
department_name 		NVARCHAR(50) NOT NULL ,
total_member			INT	UNSIGNED, 								/*tổng nhân viên*/
create_date    			DATETIME DEFAULT NOW()
);

DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position` (
position_id		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
position_name  	ENUM('DEV','TEST','SCRUMMASTER','PM') NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
employee_id		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
employee_code	VARCHAR (50)NOT NULL UNIQUE KEY,				/* mã nhân viên*/
email        	VARCHAR (50)NOT NULL UNIQUE KEY,
user_name      	VARCHAR (50)NOT NULL UNIQUE KEY,
full_name		NVARCHAR(50) NOT NULL,
birthday		DATETIME NOT NULL,
department_id	INT UNSIGNED,
position_id		INT UNSIGNED,
address			VARCHAR (200) NOT NULL,
phone			INT UNIQUE KEY,
id_card			INT UNIQUE KEY NOT NULL,						/* CMND */
gender			ENUM('MALE','FEMALE') NOT NULL,
contract		VARCHAR (50)NOT NULL,							/* Nhân viên chính thức, thử việc*/
`role`			ENUM('ADMIN','EMPLOYEE','MANAGER','ACCOUNTANT') NOT NULL DEFAULT 'EMPLOYEE',
`password`		VARCHAR (100) NOT NULL,
create_date    	DATETIME DEFAULT NOW(),
FOREIGN KEY(department_id) REFERENCES Department(department_id) ON DELETE SET NULL,
FOREIGN KEY(position_id) REFERENCES `Position` (position_id) ON DELETE SET NULL
);

DROP TABLE IF EXISTS Timesheet;
CREATE TABLE Timesheet (
id							INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
employee_id					INT UNSIGNED NOT NULL,
time_in						DATETIME DEFAULT NOW(),										/* thời gian vào*/
time_out					DATETIME DEFAULT NOW(),										/* thời gian ra*/
working_time				INT NOT NULL,												/* thời gian làm việc*/
overtime					INT NOT NULL,												/* tăng ca*/
`status`        			NVARCHAR(50) NOT NULL, 
FOREIGN KEY(employee_id) REFERENCES Employee(employee_id)
);


DROP TABLE IF EXISTS	Accounting;
CREATE TABLE IF NOT EXISTS	Accounting (
accounting_id			INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
employee_id				INT UNSIGNED NOT NULL UNIQUE KEY,
basic_salary 			INT UNSIGNED NOT NULL,								/*lương cơ bản*/
money_for_meals			INT	UNSIGNED NOT NULL, 								/*tiền ăn*/
responsibility    		INT	UNSIGNED,										/*trách nhiệm*/
seniority				INT	UNSIGNED,										/*thâm niên*/
bonus					INT	UNSIGNED,										/*tiền thưởng*/
total_working_hours 	INT	UNSIGNED,										/*tổng giờ làm*/
total_overtime_hours	INT	UNSIGNED,										/*tổng giờ tăng ca*/
personal_income_tax		INT	UNSIGNED,										/*thuế thu nhập cá nhân*/
advance					INT	UNSIGNED,										/*tạm ứng*/
total_salary			INT	UNSIGNED,										/*tổng tiền lương*/
FOREIGN KEY(employee_id) REFERENCES Employee(employee_id)
);


INSERT INTO Department(	department_id,		department_name, 	total_member, 		create_date) 
VALUES
						(1,					'Marketing',	 		1, 				'2021-03-05'),
						(2,					'Sale', 				2, 				'2021-03-05'),
						(3,					'Security',		 		3, 				'2021-03-07'),
						(4,					'HR',		 			3, 				'2021-03-08'),
						(5,					'Design',		 		0, 				'2021-03-10'),
						(6,					'Finance',	 			2, 				'2021-09-21'),
						(7,					'CEO', 					2,				'2021-03-10'),
						(8,					'Manager',		 		1, 				'2021-04-07'),
						(9,					'Finance',		 		3,				'2021-07-12'),
						(10,				'Accountant',		 	1, 				'2021-04-09');
                        
INSERT INTO `Position` 	(position_id, position_name)
VALUES               	(1,             'DEV'			),
						(2,             'TEST'			),
						(3,             'SCRUMMASTER'	),
						(4,             'PM'			);

insert into Employee 	(employee_id, employee_code,	email, 							user_name, 			full_name, 			 birthday, 	 department_id, 	position_id, 	address, 					 phone, 		id_card, 		gender, 	    contract, 		`role`, 				`password`, 														create_date) 
values 					(1, 		'VTI001',			'gpostan0@businessweek.com',	 'gpostan0', 	'Giavani Postan', 		'2021/05/04', 		1,				1, 		'7 Lillian Junction', 			'0383254685', 	'580150875', 	'Male', 		'official', 	'EMPLOYEE', 			'$2y$10$jc.RCTU4CGVNofX8NaeJxe6zU00ANdBXrk2Xz4TDUa3iTKkPlSSU2', 	'2021/05/04'),
						(2, 		'VTI002',			'vohrtmann1@hibu.com', 			'vohrtmann1', 	'Viva Ohrtmann', 		'2021/05/04', 		2, 				2, 		'3813 Norway Maple Crossing', 	'0383255425', 	'104574670', 	'Female', 		'official', 	'EMPLOYEE', 			'$2y$10$jc.RCTU4CGVNofX8NaeJxe6zU00ANdBXrk2Xz4TDUa3iTKkPlSSU2', 	'2021/05/04'),
						(3, 		'VTI003',			'vbyforth2@reddit.com', 		'vbyforth2', 	'Vito Byforth', 		'2021/05/04', 		2, 				4, 		'6736 Westend Court', 			'0381256425', 	'279162406', 	'Male', 		'official', 	'EMPLOYEE', 			'$2y$10$jc.RCTU4CGVNofX8NaeJxe6zU00ANdBXrk2Xz4TDUa3iTKkPlSSU2', 	'2021/05/04'),
						(4, 		'VTI004',			'pmackett3@mashable.com', 		'pmackett3', 	'Patrizio Mackett', 	'2021/05/04', 		3, 				2, 		'89 Hooker Junction', 			'0383254426', 	'552348761', 	'Male', 		'official', 	'EMPLOYEE', 			'$2y$10$jc.RCTU4CGVNofX8NaeJxe6zU00ANdBXrk2Xz4TDUa3iTKkPlSSU2', 	'2021/05/04'),
						(5, 		'VTI005',			'bmeggison4@tinyurl.com', 		'bmeggison4', 	'Barnabas Meggison',	'2021/05/04', 		6, 				3, 		'7086 Milwaukee Court', 		'0383254427', 	'487878572', 	'Male', 		'official', 	'EMPLOYEE', 			'$2y$10$jc.RCTU4CGVNofX8NaeJxe6zU00ANdBXrk2Xz4TDUa3iTKkPlSSU2', 	'2021/05/04'),
						(6, 		'VTI006',			'jroyl5@wikispaces.com', 		'jroyl5', 		'Jo Royl', 				'2021/05/04', 		9, 			    2, 		'45608 Messerschmidt Point', 	'0383254825', 	'707556582', 	'Female', 		'contract', 	'EMPLOYEE', 			'$2y$10$jc.RCTU4CGVNofX8NaeJxe6zU00ANdBXrk2Xz4TDUa3iTKkPlSSU2', 	'2021/05/04'),
						(7, 		'VTI007',			'jtildesley6@naver.com', 		'jtildesley6', 	'Johnette Tildesley',	'2021/05/04', 		4, 				1, 		'637 Cascade Crossing', 		'0383254475', 	'689579772', 	'Female', 		'contract', 	'EMPLOYEE', 			'$2y$10$jc.RCTU4CGVNofX8NaeJxe6zU00ANdBXrk2Xz4TDUa3iTKkPlSSU2', 	'2021/05/04'),	-- EMPLOYEE pass: 123456789
						(8, 		'VTI008',			'gpolglase7@tripadvisor.com', 	'gpolglase7', 	'Glenn Polglase', 		'2021/05/04', 		6,				4, 		'4462 Schmedeman Hill', 		'0383259425', 	'126011762', 	'Male', 		'contract', 	'EMPLOYEE', 			'$2y$10$jc.RCTU4CGVNofX8NaeJxe6zU00ANdBXrk2Xz4TDUa3iTKkPlSSU2', 	'2021/05/04'),
						(9, 		'VTI009',			'mwestmerland8@ask.com', 		'mwestmerland8', 'Mahalia Westmerland', '2021/05/04', 		7, 				1, 	    '7 Prairieview Avenue', 		'0383254975', 	'106853528', 	'Female', 		'contract', 	'ADMIN', 				'$2y$10$/t05P9k3vaWibOeyRNTlSenLj9YjCMLShJ1Q/OxUPvPKn68FbbNMm', 	'2021/05/04'),  	-- ADMIN pass:admin
						(10, 		'VTI010',			'cpechard9@twitter.com', 		'cpechard9', 	'Cirilo Pechard', 		'2021/05/04', 		10, 			2, 		'20170 Buena Vista Point', 		'0383254423',	'680334671', 	'Male', 		'intern', 		'ACCOUNTANT', 			'$2y$10$jAWG7C5aOytaXOCRqHrkBerSzcUdsyc5skjh9A.BeNSSFOfro4ugm', 	'2021/05/04'),	-- ACCOUNTANT pass: 987654321
						(11, 		'VTI011',			'psedgemana@ameblo.jp', 		'psedgemana', 	'Petronia Sedgeman', 	'2021/05/04', 		7, 				1, 	    '5642 Cody Trail', 				'0383254935', 	'524751950', 	'Male', 		'intern', 		'MANAGER', 				'$2y$10$DGe8SzsnfFypPXcIv9gOu.PPPRWpT18Ufb7F322Xzljty7lSZxLNS', 	'2021/05/04'),	
						(12, 		'VTI012',			'ldeb@accuweather.com', 		'ldeb', 		'Lisette de Banke', 	'2021/05/04', 		3, 				4, 		'014 Burrows Alley', 			'0383251428', 	'805667678', 	'Female', 		'have left', 	'EMPLOYEE', 			'$2y$10$jc.RCTU4CGVNofX8NaeJxe6zU00ANdBXrk2Xz4TDUa3iTKkPlSSU2', 	'2021/05/04'),
						(13, 		'VTI013',			'kcarilloc@ucoz.ru', 			'kcarilloc', 	'Keelia Carillo', 		'2021/05/04', 		9, 			    3, 		'26 Burning Wood Junction', 	'0386259425', 	'169052443', 	'Female', 		'official', 	'EMPLOYEE', 			'$2y$10$jc.RCTU4CGVNofX8NaeJxe6zU00ANdBXrk2Xz4TDUa3iTKkPlSSU2', 	'2021/05/04'),
						(14, 		'VTI014',			'acostardd@economist.com', 		'acostardd', 	'Arlee Costard', 		'2021/05/04', 		3, 				2, 		'4 Buhler Drive', 				'0393258425', 	'514363031', 	'Female', 		'official', 	'EMPLOYEE', 			'$2y$10$jc.RCTU4CGVNofX8NaeJxe6zU00ANdBXrk2Xz4TDUa3iTKkPlSSU2', 	'2021/05/04'),
						(15, 		'VTI015',			'psimonoue@discuz.net', 		'psimonoue', 	'Peirce Simonou', 		'2021/05/04', 		8, 				1, 		'2585 Forest Terrace', 			'0383257425', 	'455464360', 	'Male', 		'contract', 	'MANAGER',				'$2y$10$DGe8SzsnfFypPXcIv9gOu.PPPRWpT18Ufb7F322Xzljty7lSZxLNS', 	'2021/05/04'),
						(16, 		'VTI016',			'cfulhamf@about.com', 			'cfulhamf', 	'Catriona Fulham', 		'2021/05/04', 		9, 				1, 		'685 Lerdahl Plaza', 			'0283256425', 	'179734993', 	'Female', 		'contract', 	'EMPLOYEE', 			'$2y$10$jc.RCTU4CGVNofX8NaeJxe6zU00ANdBXrk2Xz4TDUa3iTKkPlSSU2', 	'2021/05/04'),
						(17, 		'VTI017',			'rbyardg@reuters.com', 			'rbyardg', 		'Revkah Byard', 		'2021/05/04', 		4, 				2, 		'89 Barby Crossing', 			'0983255425', 	'603446237', 	'Female', 		'contract', 	'MANAGER', 				'$2y$10$DGe8SzsnfFypPXcIv9gOu.PPPRWpT18Ufb7F322Xzljty7lSZxLNS', 	'2021/05/04'),
						(18, 		'VTI018',			'gullyotth@tumblr.com', 		'gullyotth', 	'Giovanna Ullyott', 	'2021/05/04', 		9, 			    4, 		'44 Debs Hill', 				'0323252425', 	'704932774', 	'Female', 		'contract', 	'EMPLOYEE', 			'$2y$10$jc.RCTU4CGVNofX8NaeJxe6zU00ANdBXrk2Xz4TDUa3iTKkPlSSU2', 	'2021/05/04'),
						(19, 		'VTI019',			'hatlingi@ihg.com', 			'hatlingi', 	'Herman Atling', 		'2021/05/04', 		4, 				2, 		'90351 Sullivan Street', 		'0383254665', 	'455295711', 	'Male', 		'have left', 	'EMPLOYEE', 			'$2y$10$jc.RCTU4CGVNofX8NaeJxe6zU00ANdBXrk2Xz4TDUa3iTKkPlSSU2', 	'2021/05/04'),
						(20, 		'VTI020',			'osachj@toplist.cz', 			'osachj', 		'Orville Sach', 		'2021/05/04', 		9, 				3, 		'6526 Golf View Trail', 		'0388251425', 	'382771631', 	'Male', 		'have left', 	'MANAGER', 				'$2y$10$DGe8SzsnfFypPXcIv9gOu.PPPRWpT18Ufb7F322Xzljty7lSZxLNS', 	'2021/05/04');  	-- MANAGER pass: 88886666
                        
                        

INSERT INTO Timesheet 	(	employee_id,			time_in,					time_out,		working_time,		overtime, 	`status`)
VALUES					(	1, 				'2022-05-27 08:00',			'2022-05-27 20:00',			8,					2,		'Đi Làm'),
						(	2, 				'2022-05-27 07:58',			'2022-05-27 19:01',			8,					1,		'Đi Làm'),
                        (	3, 				'2022-05-27 0',			    '2022-05-27 0',				0,					0,		'Nghỉ'	),
                        (	4, 				'2022-05-27 07:56',			'2022-05-27 18:00',			8,					3,		'Đi Làm'),
                        (	5, 				'2022-05-27 08:10',			'2022-05-27 20:10',			8,					2,		'Late'),
                        (	6, 				'2022-05-27 0',			     '2022-05-27 0',			0,					0,		'Nghỉ'	),
                        (	7, 				'2022-05-27 08:00',			'2022-05-27 18:00',			8,					0,		'Đi Làm'),
                        (	8, 				'2022-05-27 08:12',			'2022-05-27 21:12',			8,					3,		'Late'),
                        (	9, 				'2022-05-27 08:00',			'2022-05-27 18:00',			8,					2,		'Đi Làm'),
                        (	10, 			'2022-05-27 07:57',			'2022-05-27 20:03',			8,					2,		'Đi Làm'),
                        (	11, 			'2022-05-27 08:05',			'2022-05-27 21:05',			8,					3,		'Late'),
                        (	12, 			'2022-05-27 08:00',			'2022-05-27 19:00',			8,					1,		'Đi Làm'),
                        (	13, 			'2022-05-27 0',				'2022-05-27 0',			    0,					0,		'Nghỉ'	),
                        (	14, 			'2022-05-27 08:00',			'2022-05-27 20:00',			8,					2,		'Đi Làm'),
                        (	15, 			'2022-05-27 0',				'2022-05-27 0',			    0,					0,		'Nghỉ'	),
                        (	16, 			'2022-05-27 08:00',			'2022-05-27 21:00',			8,					3,		'Đi Làm'),
                        (	17, 			'2022-05-27 08:00',			'2022-05-27 20:00',			8,					2,		'Đi Làm'),
                        (	18, 			'2022-05-27 08:00',			'2022-05-27 19:00',			8,					1,		'Đi Làm'),
                        (	19, 			'2022-05-27 08:00',			'2022-05-27 20:00',			8,					2,		'Đi Làm'),
                        (	20, 			'2022-05-27 0',				'2022-05-27 0',			    0,					0,		'Nghỉ'	),
                        (	1,			    '2022-05-27 08:00',			'2022-05-27 20:00',			8,					2,		'Đi Làm'),
                        (	2,			    '2022-05-27 08:20',			'2022-05-27 20:20',			8,					2,		'Late'),
                        (	3,				'2022-05-27 0',				'2022-05-27 0',			    0,					0,		'Nghỉ'	),
                        (	4,			    '2022-05-27 08:00',			'2022-05-27 20:00',			8,					2,		'Đi Làm');

INSERT INTO Accounting (accounting_id, employee_id, basic_salary, money_for_meals, responsibility, seniority,		 bonus, 	total_working_hours, 	total_overtime_hours, personal_income_tax, 	advance, 	total_salary) 
VALUES 					(1,				1,			26949465, 		688678, 		1327561, 		3137098, 		3668353, 			233, 				17, 				6980681, 			4602686, 	11885582	),
						(2, 			2, 			44035971, 		698210, 		1808708, 		2160887, 		3553853, 			41, 				17, 				4279293, 			4296927, 	51735119	),
						(3, 			3, 			56795409, 		719133, 		1080462, 		1557321, 		9404364, 			203, 				3, 					7937001, 			2779413, 	37213848	),
						(4, 			4, 			73327477, 		975270, 		1477611, 		4530865, 		4847060, 			82, 				8, 					1196706, 			3108244, 	35737562	),
						(5, 			5, 			41203026, 		786510, 		886427, 		3295007, 		4176365, 			38,					3, 					1606761, 			7740875, 	66258256	),
						(6, 			6, 			75425226, 		547620, 		479433, 		4565426, 		4847021, 			78, 				23, 				6252188, 			2158156, 	26803871	),
						(7, 			7, 			65131097, 		712171, 		1470372, 		3636704, 		2696538, 			202, 				33, 				9063308, 			351931, 	46650666	),
						(8, 			8, 			10617471, 		679212, 		1764428, 		1085797, 		3659778, 			62, 				14, 				3436918, 			6144588, 	38080242	),
						(9, 			9, 			68482686, 		840086, 		1339112, 		4067215, 		9504162, 			188, 				13, 				7794092, 			7680177, 	43844880	),
						(10, 			10, 		19688774, 		884830, 		828314, 		3061626, 		4165441, 			22, 				44, 				6908495, 			8219798, 	10518527	),
						(11,		 	11, 		17315317, 		965251, 		353211, 		156592, 		6821081, 			130, 				20, 				4666657, 			3307197, 	72181593	),
						(12, 			12,			 6648939,		944618, 		1003721, 		4549445, 		7271538, 			163, 				30, 				7994527, 			5081364, 	78099353	),
						(13, 			13, 		94623265, 		706629, 		5535, 			1398289, 		6658333, 			128, 				15, 				3610676, 			7160412, 	43251364	),
						(14, 			14, 		45286336, 		959549, 		952439, 		1817294, 		3823380, 			189, 				14, 				1318616, 			3409277, 	12039158	),
						(15, 			15, 		10741248,		551869, 		1394264, 		852458, 		67599640, 			188, 				26, 				4335604, 			3903376, 	65708472	),
						(16, 			16, 		81772477, 		558496, 		794512, 		2064616, 		8930018, 			72, 				44, 				4815596, 			5430576, 	36490103	),
						(17, 			17, 		89059208, 		937264, 		1647863, 		4571461, 		7862167, 			230, 				18, 				9482545, 			293827, 	16362195	),
						(18, 			18, 		39738741, 		546029, 		1496691, 		609236, 		549056, 			183, 				22, 				6444737, 			5730176, 	95213784	),
						(19, 			19, 		12950679, 		741002, 		1542319, 		2229473, 		1907082,			 22, 				33, 				4065333, 			6508638, 	27381954	),
						(20, 			20, 		46631351, 		547762, 		617124,			4194674, 		6846546, 			130, 				13, 				9672712, 			7263216, 	84672414	);


