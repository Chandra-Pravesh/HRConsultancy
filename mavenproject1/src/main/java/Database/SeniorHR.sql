CREATE TABLE Senior_Hr(
					Internal_Id INT AUTO_INCREMENT unique,
					Shr_Id Varchar(20) PRIMARY KEY,
					Shr_Name varchar(255),
					Shr_PhoneNo VARCHAR(15),
					Shr_EmailID varchar(255),
					Profile_Status ENUM('ACTIVE', 'INACTIVE') DEFAULT 'ACTIVE',
                    Com_Id varchar(20), 
                    FOREIGN KEY (Com_Id) REFERENCES Company(Com_Id)
				);
drop table Senior_Hr;

DELIMITER //
CREATE PROCEDURE InsertSHr(IN PSHr_Name varchar(255), IN PSHr_PhoneNo VARCHAR(15), IN PSHr_EmailId varchar(255), IN PCom_Id varchar(20))
BEGIN
	INSERT INTO Senior_Hr(Shr_Id, Shr_Name, Shr_PhoneNo, Shr_EmailID, Com_Id )
    VALUES ('NULL',PSHr_Name, PSHr_PhoneNo, PSHr_EmailId, PCom_Id);
    
	UPDATE Senior_Hr
	SET Shr_Id = CONCAT("shr",LAST_INSERT_ID())
	WHERE Internal_ID = last_insert_id();
END //
DELIMITER ;

call InsertSHr("Jadadeesh B", "+91 7671890335", "Jagadeesh@gmail.com", 'COM1');
call InsertSHr("Ayush", "+91 9849597853", "ayush@gmail.com", 'COM1');

SELECT * FROM Senior_Hr;