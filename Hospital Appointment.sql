CREATE DATABASE Hospital;
USE Hospital;


CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(50),
    specialization VARCHAR(50)
);

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(50),
    phone VARCHAR(15)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    doctor_id INT,
    patient_id INT,
    appointment_date DATE,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);
INSERT INTO Doctors (doctor_id, doctor_name, specialization) VALUES
(1, 'Dr. Arjun Mehta', 'Cardiology'),
(2, 'Dr. Priya Sharma', 'Neurology'),
(3, 'Dr. Sameer Gupta', 'Orthopedics'),
(4, 'Dr. Rina Kapoor', 'Pediatrics'),
(5, 'Dr. Karan Singh', 'Cardiology');
INSERT INTO Patients (patient_id, patient_name, phone) VALUES
(1, 'Amit Verma', '9876543210'),
(2, 'Sneha Patel', '9988776655'),
(3, 'Rahul Singh', '9123456789'),
(4, 'Priyanka Joshi', '9911223344'),
(5, 'Ravi Kumar', '9000012345');

INSERT INTO Appointments (appointment_id, doctor_id, patient_id, appointment_date) VALUES
(1, 1, 1, '2024-10-15'),
(2, 5, 2, '2024-10-16'),
(3, 3, 3, '2024-10-17'),
(4, 2, 4, '2024-10-18'),
(5, 1, 5, '2024-10-19');
SELECT Patients.patient_name, Doctors.doctor_name 
FROM Appointments 
INNER JOIN Patients ON Appointments.patient_id = Patients.patient_id
INNER JOIN Doctors ON Appointments.doctor_id = Doctors.doctor_id;

SELECT Doctors.doctor_name, Appointments.appointment_date, Patients.patient_name 
FROM Doctors 
LEFT JOIN Appointments ON Doctors.doctor_id = Appointments.doctor_id
LEFT JOIN Patients ON Appointments.patient_id = Patients.patient_id;


SELECT Patients.patient_name, Doctors.doctor_name, Appointments.appointment_date 
FROM Appointments 
INNER JOIN Doctors ON Appointments.doctor_id = Doctors.doctor_id
INNER JOIN Patients ON Appointments.patient_id = Patients.patient_id
WHERE Doctors.specialization = 'Cardiology';
