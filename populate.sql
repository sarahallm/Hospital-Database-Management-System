USE hospital_system;
INSERT INTO Patient (pid, fname, minit, lname, bdate, gender, phone, address, medicalHistory)
VALUES 
(1, 'Ahlam', 'M.', 'Ahmed', '1990-05-12', 'Female', '966 53 123 4567', 'Riyadh, Saudi Arabia', 'Diabetes'),
(2, 'Fatima', 'K.', 'Mohammed', '1985-08-25', 'Female', '966 54 234 5678', 'Jeddah, Saudi Arabia', 'Hypertension'),
(3, 'Nawal', 'H.', 'Osman', '1998-03-17', 'Female', '966 55 345 6789', 'Dammam, Saudi Arabia', 'Asthma'),
(4, 'Randa', 'A.', 'Hassan', '1992-11-30', 'Female', '966 56 456 7890', 'Mecca, Saudi Arabia', 'No known history');



INSERT INTO Doctor (did, fname, minit, lname, specialty, address, phone)
VALUES 
(1, 'Sara', 'B.', 'Hussein', 'Cardiology', 'Riyadh, Saudi Arabia', '966 57 567 8901'),
(2, 'Hind', 'Y.', 'Abdallah', 'Dermatology', 'Jeddah, Saudi Arabia', '966 58 678 9012'),
(3, 'Samira', 'L.', 'Khalid', 'Pediatrics', 'Dammam, Saudi Arabia', '966 59 789 0123'),
(4, 'Maha', 'F.', 'Saeed', 'Neurology', 'Mecca, Saudi Arabia', '966 50 890 1234');


INSERT INTO Department (name, HeadDoctorID)
VALUES 
('Cardiology', 1),
('Dermatology', 2),
('Pediatrics', 3),
('Neurology', 4);

UPDATE Doctor SET depId = 1 WHERE did = 1;
UPDATE Doctor SET depId = 2 WHERE did = 2;
UPDATE Doctor SET depId = 3 WHERE did = 3;
UPDATE Doctor SET depId = 4 WHERE did = 4;




INSERT INTO DoctorSchedule (did, day, timeAvailable)
VALUES 
(1, 'Monday', '09:00-12:00'),
(2, 'Wednesday', '10:00-14:00'),
(3, 'Thursday', '13:00-17:00'),
(4, 'Saturday', '08:00-11:00');


INSERT INTO Appointment (Date, Time, reason, pid, did)
VALUES 
('2024-04-10', '10:30:00', 'Checkup', 1, 1),
('2024-04-12', '11:00:00', 'Skin Rash', 2, 2),
('2024-04-15', '15:00:00', 'Flu Symptoms', 3, 3),
('2024-04-20', '09:30:00', 'Headache', 4, 4);



INSERT INTO Prescription (medication, dosage, duration, pid, did)
VALUES 
('Metformin', '500mg', '2 weeks', 1, 1),
('Antihistamine', '10mg', '1 week', 2, 2),
('Salbutamol', '100mcg', 'As needed', 3, 3),
('Paracetamol', '500mg', '5 days', 4, 4);