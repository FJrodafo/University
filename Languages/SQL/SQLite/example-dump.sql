PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Examples (
    id_eg INTEGER PRIMARY KEY,
    text_eg TEXT,
    integer_eg INTEGER,
    decimal_eg REAL,
    date_eg DATE,
    boolean_eg BOOLEAN
);
INSERT INTO Examples VALUES(1,'Hello, World!',42,3.140000000000000124,'2025-03-22',1);
INSERT INTO Examples VALUES(2,'Another text...',100,2.717999999999999972,'2024-12-31',0);
COMMIT;
