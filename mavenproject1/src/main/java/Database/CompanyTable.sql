CREATE TABLE Company(		
							Internal_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
							Com_Id Varchar(20) UNIQUE,
							Com_Name varchar(255) NOT NULL, 		
                            Com_Web varchar(255),
							Com_Location Varchar(255) NOT NULL,		
							Com_EmailId Varchar(255) NOT NULL
				);
               
DELIMITER //
CREATE PROCEDURE Company_Insert(IN P_Com_Name varchar(255), P_Com_Website VARCHAR(255),IN P_Com_Location Varchar(255),IN P_Com_Email_Id Varchar(255) )
BEGIN
INSERT INTO Company (Com_Id, Com_Name,Com_Web,Com_Location, Com_EmailId) VALUES ("NULL", P_Com_Name,P_Com_Website, P_Com_Location, P_Com_Email_Id);
UPDATE Company
SET Com_Id = CONCAT("COM",LAST_INSERT_ID())
WHERE Internal_ID = last_insert_id();
END //
DELIMITER ;


CALL Company_Insert("VIT", "https://www.vit.ac.in/", "Vellore, Tamil Nadu", "vit@vit.ac.in");
SELECT * FROM Company;

