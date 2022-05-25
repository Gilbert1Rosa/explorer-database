USE filedb;
CALL AddObject(NULL, "root", 0, "");
CALL AddObject(1, "A", 0, "");
CALL AddObject(1, "B", 0, "");
CALL AddObject(1, "C", 0, "");
CALL AddObject(1, "file", 1, "5d33f886eb964f45a6ac9e3a15cef61b");

CALL MoveObject(4, 3);

SELECT * FROM Objects;

SELECT * FROM Objects WHERE objectName = "root" AND parent IS NULL;
SELECT * FROM Objects WHERE parent = 3;



