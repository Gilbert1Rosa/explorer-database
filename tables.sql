CREATE TABLE Objects
(
	id         INT NOT NULL AUTO_INCREMENT,
    parent     INT,
    objectName VARCHAR(255) NOT NULL,
    objectType INT NOT NULL /* 0 means folder, 1 means file */,
    PRIMARY KEY(id)
);

ALTER TABLE Objects ADD CONSTRAINT UC_FileName UNIQUE(parent, ObjectName);

DELIMITER //

CREATE PROCEDURE AddObject(IN i_parent INT, IN i_objectName VARCHAR(255), IN i_objectType INT)
BEGIN
	INSERT INTO Objects(parent, objectName, objectType)
    VALUES (i_parent, i_objectName, i_objectType);
END//

CREATE PROCEDURE MoveObject(IN objectId INT, IN parentId INT)
BEGIN
	UPDATE Objects
    SET parent = parentId
    WHERE id = objectId;
END//