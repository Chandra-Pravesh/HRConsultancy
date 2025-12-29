SET SQL_SAFE_UPDATES = 0;
DROP TABLE Job;
CREATE TABLE Job(
				Internal_id INT AUTO_INCREMENT UNIQUE,
				Job_Id VARCHAR(20) PRIMARY KEY ,
				Job_Role Varchar(255) NOT NULL,
				Job_Description varchar(1000),
				Job_Department text,
				Job_No_Of_Recruitments INT,
                Job_Experience INT,
                Job_Recruited INT DEFAULT 0,
                Job_Created_On DATE DEFAULT (CURRENT_DATE),
				Job_Expiry_On Date,
				Job_Status ENUM('ACTIVE', 'INACTIVE') DEFAULT 'ACTIVE',
				Job_Location VARCHAR(255),					
				Hr_Id Varchar(20) NOT NULL,
				FOREIGN KEY (Hr_Id) REFERENCES HR(Hr_Id)
			) ;

DROP PROCEDURE Insert_Job;
DELIMITER // 
CREATE PROCEDURE Insert_Job(													
		IN P_Job_Role Varchar(255) ,					
		IN P_Job_Description varchar(1000),
		IN P_Job_Department text,
		IN P_Job_No_Of_Recruitments INT,
        IN P_Job_Experience INT, 
		IN P_Job_Expiry_On VARCHAR(20),
		IN P_Job_Location VARCHAR(255),				
		IN P_Hr_Id Varchar(20) 									
)
BEGIN
	INSERT INTO Job(Job_Id, Job_Role,Job_Description, Job_Department, Job_No_Of_Recruitments, Job_Experience, Job_Expiry_On,  Job_Location, Hr_Id   ) 
	VALUE("NULL", P_Job_Role, P_Job_Description,P_Job_Department,P_Job_No_Of_Recruitments, P_Job_Experience, STR_TO_DATE(P_Job_Expiry_On, '%d-%m-%Y'), P_Job_Location,P_Hr_Id ) ;     

	UPDATE Job
	SET Job_Id = CONCAT("JOB",LAST_INSERT_ID())
	WHERE Internal_ID = last_insert_id();
END //
DELIMITER ;


CALL Insert_Job("Java Developer",
				"Should have Well Knowledge on JSP,Servlet,Swing and JDBC, For Database MYSQL ",
                "Developer",
                5,
                2,
                "17-02-2004",
                "Hi Tech City, Hyderabad, Telugana", 
                "Hr5"
				);

CALL Insert_Job(
    "Data Scientist",
    "Expertise in Python, R, and Machine Learning algorithms. Experience with SQL and Tableau is required.",
    "Analytics",
    3,
    4,
    "15-05-2025",
    "Whitefield, Bangalore, Karnataka",
    "Hr1"
);

CALL Insert_Job(
    "Teacher",
    "Strong proficiency in React.js, Tailwind CSS, and JavaScript. Knowledge of UI/UX principles preferred.",
    "Education",
    10,
    1,
    "30-11-2025",
    "Cyber City, Gurgaon, Haryana",
    "Hr1"
);

DROP EVENT Job_Deactive;
CREATE EVENT Job_Deactive
ON SCHEDULE EVERY 1 DAY 
DO UPDATE JOB SET Job_Status ='INACTIVE'
WHERE Job_Expire_On<CURDATE()
AND Job_Status ='ACTIVE';


SELECT * FROM Job;
SET SQL_SAFE_UPDATES = 1;