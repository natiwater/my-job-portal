-- Create the employers table (if not already created)
CREATE TABLE IF NOT EXISTS employers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
    -- Other employer-related fields
);

-- Create the job listings table with a foreign key constraint and index
CREATE TABLE IF NOT EXISTS job_listings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employer_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2),
    job_type ENUM('Full-time', 'Part-time', 'Contract', 'Freelance', 'Internship', 'Temporary') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (employer_id) REFERENCES employers(id),
    INDEX idx_employer_id (employer_id) -- Index on employer_id column
);
-- Insert data into the employers table
INSERT INTO employers (name)
VALUES
    ('Company A'),
    ('Company B'),
    ('Company C'),
    ('Company D'),
    ('Company E');

-- Create a table for job listings
CREATE TABLE IF NOT EXISTS job_listings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employer_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2),
    job_type ENUM('Full-time', 'Part-time', 'Contract', 'Freelance', 'Internship', 'Temporary') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (employer_id) REFERENCES employers(id),
    INDEX idx_employer_id (employer_id)
);

-- Insert data into the job_listings table
INSERT INTO job_listings (employer_id, title, description, location, salary, job_type)
VALUES
    (1, 'Software Engineer', 'Looking for experienced software engineers.', 'City X', 80000.00, 'Full-time'),
    (2, 'Marketing Manager', 'Seeking a marketing manager to lead our campaigns.', 'City Y', 60000.00, 'Full-time'),
    (3, 'Graphic Designer', 'Creative graphic designer wanted for design projects.', 'City Z', 50000.00, 'Part-time'),
    (4, 'Project Manager', 'Experienced project manager to lead new initiatives.', 'City X', 75000.00, 'Full-time'),
    (5, 'Data Analyst', 'Data analyst position for data-driven decision-making.', 'City Y', 65000.00, 'Contract');
