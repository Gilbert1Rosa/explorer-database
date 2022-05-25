USE filedb;
USE filedb;
CREATE TABLE Objects
(
	id         INT NOT NULL AUTO_INCREMENT,
    parent     INT,
    objectname VARCHAR(255) NOT NULL,
    objecttype INT NOT NULL, /* 0 means folder, 1 means file */
    hashname   VARCHAR(255),
    PRIMARY KEY(id)
);

ALTER TABLE Objects ADD CONSTRAINT UC_FileName UNIQUE(parent, ObjectName);

DELIMITER //

CREATE PROCEDURE AddObject(IN i_parent INT, IN i_objectName VARCHAR(255), IN i_objectType INT, IN i_hashname VARCHAR(255))
BEGIN
	IF i_objectType = 1 THEN
		INSERT INTO Objects(parent, objectname, objecttype, hashname)
		VALUES (i_parent, i_objectName, i_objectType, i_hashname);
	else
        INSERT INTO Objects(parent, objectname, objecttype)
		VALUES (i_parent, i_objectName, i_objectType);
    END IF;
END//

CREATE PROCEDURE MoveObject(IN objectId INT, IN parentId INT)
BEGIN
	UPDATE Objects
    SET parent = parentId
    WHERE id = objectId;
END//