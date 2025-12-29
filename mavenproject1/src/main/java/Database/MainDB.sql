
							Com_CIN Varchar(255), 		
							Com_Location Varchar(255) NOT NULL,		
							Com_Email_Id Varchar(255) NOT NULL
				);
			
CREATE TABLE Job(
				Internal_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
				Job_Id VARCHAR(20) GENERATED ALWAYS AS (CONCAT('JOB', Internal_id)) STORED UNIQUE ,
				Job_Name Varchar(255) NOT NULL,
				Job_Role Varchar(255) NOT NULL,
				Job_Description varchar(1000),
				Job_Department text,
				Job_No_Of_Recruitments INT,
				Job_Expiry_Date Date,
				Job_Status ENUM('ACTIVE', 'INACTIVE') DEFAULT 'ACTIVE',
				Job_Location VARCHAR(255),					
				Hr_Id Varchar(20) NOT NULL,
				FOREIGN KEY (Hr_Id) REFERENCES HR(Hr_Id)
			) ;


				
CREATE TABLE Senior_Hr(
					Internal_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
					Shr_Id Varchar(20) GENERATED ALWAYS AS (CONCAT('SHR', Internal_id)) STORED UNIQUE,
					Shr_Name varchar(255),
					Shr_PhoneNo VARCHAR(15),
					Shr_EmailID varchar(255),
					Profile_Status ENUM('ACTIVE', 'INACTIVE') DEFAULT 'ACTIVE'
					
				);


CREATE  TABLE Support(
				Internal_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
				Sup_Id Varchar(20) GENERATED ALWAYS AS (CONCAT('SUP', Internal_id)) STORED UNIQUE,
				Sup_Name Varchar(255) not null, 
				Sup_Email Varchar(255), 
				Sup_PhoneNo VARCHAR(15),
				Profile_Status ENUM('ACTIVE', 'INACTIVE') DEFAULT 'ACTIVE'
				);
-----------------------------------------------------------------------------------------------				
CREATE TABLE Ticket_List(
				Internal_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
				Ticket_Id Varchar(20) GENERATED ALWAYS AS (CONCAT('TIC', Internal_id)) STORED UNIQUE,
				Ticket_UserId Varchar(20), 
				Ticket_Subject VARCHAR(255),
				Ticket_Message Varchar(255),
				Ticket_Status ENUM('ACTIVE','INACTIVE' )
				);		
				
Create TABLE Institution_Name_List(
			Internal_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
			Ins_Id Varchar(20) GENERATED ALWAYS AS (CONCAT('INS', Internal_id)) STORED UNIQUE,
			Ins_Name Varchar(255),
			Ins_Location Varchar(255)

			);
				
CREATE TABLE Board_University_List(
			Internal_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
			BU_Id Varchar(20) GENERATED ALWAYS AS (CONCAT('BU', Internal_id)) STORED UNIQUE,
			BU_Name Varchar(255),
			BU_Location Varchar(255)
			);				
----------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------	
CREATE TABLE Applicant(
			Internal_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
			App_Id Varchar(20) GENERATED ALWAYS AS (CONCAT('APP', Internal_id)) STORED UNIQUE,
			App_Name Varchar(255) NOT NULL,
			App_Dob DATE,
			App_EmailId Varchar(255),
			App_Skill_One VARCHAR(50) NOT NULL,
			App_Skill_Two VARCHAR(50),
			App_Gender Varchar(50) NOT NULL,
			Profile_Status ENUM('ACTIVE', 'INACTIVE') DEFAULT 'ACTIVE'
	
);
CREATE TABLE Applicant_Language(
			App_Id Varchar(20),
			Lan_Name VARCHAR(50),
			Reading ENUM('True', 'False'),
			Writing ENUM('True', 'False'), 
			Speaking ENUM('True', 'False')
		);


CREATE TABLE Applicant_Education(
			Internal_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
			Edu_Id Varchar(20) GENERATED ALWAYS AS (CONCAT('AEDU', Internal_id)) STORED UNIQUE,
			App_Id varchar(20), 
			Edu_Level ENUM('SSC', 'HSC', 'Diploma', 'Graduation', 'Post Graduation', 'Doctorate', 'Post Doctorate'),
			App_DegreeName Varchar(255),
			App_Domain Varchar(255),
			Institution_Name Varchar(255), 
			Board_University Varchar(255),
			CGPA DECIMAL(4,2),
			Location Varchar(255)
);

CREATE TABLE Applicant_Experience(
			Internal_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
			Ex_Id Varchar(20) GENERATED ALWAYS AS (CONCAT('AEX', Internal_id)) STORED UNIQUE,
			App_Id Varchar(20), 
			Ex_Type ENUM('Internship', 'Full Time', 'Part Time','Freelancing' ),
			Ex_Role Varchar(255),
			Com_Id Varchar(20),
			Start_Date DATE, 
			End_Date DATE,
			Ready_To_Join DATE
);

CREATE TABLE Applicant_Project(
			Internal_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
			Pro_Id Varchar(20) GENERATED ALWAYS AS (CONCAT('APRO', Internal_id)) STORED UNIQUE,
			App_Id Varchar(20) NOT NULL, 
			Pro_Name Varchar(255) NOT NULL, 
			Pro_Des TEXT, 
			Pro_Link Varchar(255),
			Pro_Skill_1 Varchar(255) NOT NULL,
			Pro_Skill_2 Varchar(255),
			Pro_Skill_Other Varchar(200)
		);


---------------------------------------------------------------------------------------------
CREATE TABLE Shr_Hr_Relation(
			Shr_Id Varchar(20) NOT NULL,
			Hr_Id Varchar(20) NOT NULL,
			PRIMARY KEY (Shr_Id, Hr_Id)
		);
		
CREATE TABLE Com_Hr_Relation(
			Com_Id VARCHAR(20) NOT NULL,
			Hr_Id Varchar(20) NOT NULL,
			PRIMARY KEY (Com_Id, Hr_Id)
		);
CREATE TABLE Com_Shr_Relation(
			Com_Id Varchar(20) NOT NULL,
			Shr_Id Varchar(20) NOT NULL,
			PRIMARY KEY (Com_Id, Shr_Id)
		);
CREATE TABLE Hr_Job_Relation(
			Job_Id Varchar(20) NOT NULL,
			Hr_Id Varchar(20) NOT NULL,
			PRIMARY KEY (Job_Id, Hr_Id)
		);
-----------------------------------------------------------------------------------------------
CREATE TABLE Application_Track(
				Internal_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
				AT_Id Varchar(20) GENERATED ALWAYS AS (CONCAT('AT', Internal_id)) STORED UNIQUE,
				Job_Id Varchar(20),
				App_Id Varchar(20),
				Hr_Id Varchar(20),
				Status ENUM('Applied','Rejected', 'Assignment','Interview', "Technical Interview", "Selected" ),
				RejectedReason TEXT,
				Updated_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
				FOREIGN KEY (Job_Id) REFERENCES Job(Job_Id),
				FOREIGN KEY (App_Id) REFERENCES Applicant(App_Id),
				FOREIGN KEY (Hr_Id) REFERENCES HR(Hr_Id)
			);


CREATE TABLE User_Authentication(	
		Entry_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		UserName Varchar(255) UNIQUE,
		Password Varchar(255),
		User_Id Varchar(20),
		Role_Type Varchar(20)
		);
		
		
