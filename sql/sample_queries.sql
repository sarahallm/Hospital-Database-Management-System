-- Sample queries for the Hospital Database Management System
USE hospital_system;

-- 1. View all patients
SELECT * FROM Patient;

-- 2. View all doctors
SELECT * FROM Doctor;

-- 3. View doctors with their departments
SELECT
    d.did,
    CONCAT(d.fname, ' ', d.minit, ' ', d.lname) AS doctor_name,
    d.specialty,
    dept.name AS department_name
FROM Doctor d
LEFT JOIN Department dept
    ON d.depId = dept.depId;

-- 4. View doctor schedules
SELECT
    d.did,
    CONCAT(d.fname, ' ', d.minit, ' ', d.lname) AS doctor_name,
    ds.day,
    ds.timeAvailable
FROM Doctor d
JOIN DoctorSchedule ds
    ON d.did = ds.did
ORDER BY d.did, ds.day;

-- 5. View appointments with patient and doctor names
SELECT
    a.aid,
    a.Date,
    a.Time,
    a.reason,
    CONCAT(p.fname, ' ', p.minit, ' ', p.lname) AS patient_name,
    CONCAT(d.fname, ' ', d.minit, ' ', d.lname) AS doctor_name
FROM Appointment a
JOIN Patient p
    ON a.pid = p.pid
JOIN Doctor d
    ON a.did = d.did
ORDER BY a.Date, a.Time;

-- 6. Count appointments for each doctor
SELECT
    d.did,
    CONCAT(d.fname, ' ', d.minit, ' ', d.lname) AS doctor_name,
    COUNT(a.aid) AS total_appointments
FROM Doctor d
LEFT JOIN Appointment a
    ON d.did = a.did
GROUP BY d.did, d.fname, d.minit, d.lname
ORDER BY total_appointments DESC;

-- 7. View prescriptions with patient and doctor names
SELECT
    pr.presId,
    pr.medication,
    pr.dosage,
    pr.duration,
    CONCAT(p.fname, ' ', p.minit, ' ', p.lname) AS patient_name,
    CONCAT(d.fname, ' ', d.minit, ' ', d.lname) AS doctor_name
FROM Prescription pr
JOIN Patient p
    ON pr.pid = p.pid
JOIN Doctor d
    ON pr.did = d.did;
