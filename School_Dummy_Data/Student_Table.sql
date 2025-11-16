CREATE TABLE Students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20),
    email VARCHAR(30) UNIQUE,
    registration_date DATE DEFAULT (CURRENT_DATE)
);
ALTER TABLE Students AUTO_INCREMENT = 1001;

INSERT INTO Students (first_name, last_name, email, registration_date) VALUES
('Afsar', 'Tanvir', 'afsar.tanvir@example.com', '2025-10-28'),
('Sadia', 'Rahman', 'sadia.rahman@example.com', '2025-10-27'),
('Rakib', 'Hasan', 'rakib.hasan@example.com', '2025-10-25'),
('Jannat', 'Akter', 'jannat.akter@example.com', DEFAULT),
('Mehedi', 'Hasan', 'mehedi.hasan@example.com', DEFAULT);

INSERT INTO Students (first_name, last_name, email, registration_date) VALUES
('Rajon', '', 'rajon@example.com', '2025-11-02'),
('Numin', 'Khan', 'numin@example.com', '2025-11-02'),
('Ringku', 'kumar', 'ringku@example.com', default);

SELECT * FROM Students;
