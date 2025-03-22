-- Create table "Examples"
CREATE TABLE Examples (
    id_eg INTEGER PRIMARY KEY,
    text_eg TEXT,
    integer_eg INTEGER,
    decimal_eg REAL,
    date_eg DATE,
    boolean_eg BOOLEAN
);

-- Insert into "Examples"
INSERT INTO Examples (text_eg, integer_eg, decimal_eg, date_eg, boolean_eg) 
VALUES 
('Hello, World!', 42, 3.14, '2025-03-22', 1),
('Another text...', 100, 2.718, '2024-12-31', 0);
