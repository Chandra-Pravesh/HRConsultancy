CREATE database Production_Database;
USE Production_Database;

-- Create
CREATE TABLE Hr (
    Hr_Id VARCHAR(20) PRIMARY KEY, -- Physical Primary Key
    Internal_Id INT NOT NULL AUTO_INCREMENT UNIQUE, -- Still tracks the number
    Hr_Name VARCHAR(255),
    Hr_Domain VARCHAR(255),
    Hr_PhoneNo VARCHAR(15),
    Hr_Email Varchar(255),
    Profile_Status ENUM('ACTIVE', 'INACTIVE') DEFAULT 'ACTIVE',
	Senior_Hr ENUM('ACTIVE', 'INACTIVE') DEFAULT 'INACTIVE'
);
-- Procedure
DELIMITER //
CREATE PROCEDURE Hr_Insert(IN P_Hr_Name varchar(255),
							IN  P_Hr_Domain varchar(255),
							IN  P_Hr_PhoneNo varchar(15),
                            IN P_Hr_Email varchar(255))
BEGIN 

	INSERT INTO Hr(Hr_Id, Hr_Name, Hr_Domain, Hr_PhoneNo, Hr_Email) VALUES(
			"NULL",
            P_Hr_Name, 
            P_Hr_Domain,
            P_Hr_PhoneNo,
            P_Hr_Email
            );
	UPDATE Hr 
    SET Hr_Id = CONCAT('HR', LAST_INSERT_ID())
    WHERE Internal_ID = last_insert_id();
END //
DELIMITER ;

DROP procedure Hr_Insert;
select * from Hr;
CALL Hr_Insert("Chandra Pravesh", "Production", "+91 7671890335", "chandrapravesh.official@gmail.com");
CALL Hr_Insert("Rishu Kumar Gupta", "Developer", "+91 9849597853", "Rishukumar.official@gmail.com");










