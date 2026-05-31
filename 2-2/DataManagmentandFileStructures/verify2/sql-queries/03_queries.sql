-- Hastane Yönetim Sistemi - SQL Sorguları

-- Sorgu 1: 5'ten fazla randevusu olan doktorlar
SELECT d.DoctorID, u.FirstName, u.LastName, COUNT(a.AppointmentID) as appointment_count
FROM Doctor d
JOIN User u ON d.UserID = u.UserID
JOIN Appointment a ON d.DoctorID = a.DoctorID
GROUP BY d.DoctorID, u.FirstName, u.LastName
HAVING COUNT(a.AppointmentID) > 5
ORDER BY appointment_count DESC;

-- Sorgu 2: Randevusu olmayan hastalar
SELECT p.PatientID, u.FirstName, u.LastName
FROM Patient p
JOIN User u ON p.UserID = u.UserID
LEFT JOIN Appointment a ON p.PatientID = a.PatientID
WHERE a.AppointmentID IS NULL;

-- Sorgu 3: Bölüme göre en yaygın teşhisler
SELECT d.DepartmentName, a.DiagnosisSummary, COUNT(*) as frequency
FROM Appointment a
JOIN Doctor dr ON a.DoctorID = dr.DoctorID
JOIN Department d ON dr.DepartmentID = d.DepartmentID
WHERE a.DiagnosisSummary IS NOT NULL
GROUP BY d.DepartmentName, a.DiagnosisSummary
ORDER BY d.DepartmentName, frequency DESC;

-- Sorgu 4: Ödenmemiş faturaları olan hastalar
SELECT p.PatientID, u.FirstName, u.LastName, b.Amount, b.PaymentStatus
FROM Patient p
JOIN User u ON p.UserID = u.UserID
JOIN Billing b ON p.PatientID = b.PatientID
WHERE b.PaymentStatus != 'Paid'
ORDER BY b.BillingDate DESC;

-- Sorgu 5: İlaç ve laboratuvar sonucu bulunan randevular
SELECT a.AppointmentID, p.PatientID, u.FirstName, 
       COUNT(DISTINCT pr.PrescriptionNo) as prescription_count,
       COUNT(DISTINCT lr.ResultID) as lab_result_count
FROM Appointment a
JOIN Patient p ON a.PatientID = p.PatientID
JOIN User u ON p.UserID = u.UserID
LEFT JOIN Prescription pr ON a.AppointmentID = pr.AppointmentID
LEFT JOIN LabResult lr ON a.AppointmentID = lr.AppointmentID
GROUP BY a.AppointmentID, p.PatientID, u.FirstName
HAVING COUNT(DISTINCT pr.PrescriptionNo) > 0 
   AND COUNT(DISTINCT lr.ResultID) > 0;

-- Sorgu 6: Bölüme göre doktor başı ortalama randevu
SELECT d.DepartmentName, AVG(doctor_appointments) as avg_appointments
FROM Department d
JOIN (
    SELECT dr.DepartmentID, dr.DoctorID, COUNT(a.AppointmentID) as doctor_appointments
    FROM Doctor dr
    LEFT JOIN Appointment a ON dr.DoctorID = a.DoctorID
    GROUP BY dr.DepartmentID, dr.DoctorID
) subquery ON d.DepartmentID = subquery.DepartmentID
GROUP BY d.DepartmentName;

-- Sorgu 7: Güvenlik olayları (önem sırasına göre)
SELECT u.FirstName, u.LastName, se.Severity, COUNT(se.EventID) as event_count
FROM SecurityEvent se
JOIN User u ON se.UserID = u.UserID
WHERE se.EventTimestamp >= DATE_SUB(NOW(), INTERVAL 30 DAY)
GROUP BY u.UserID, u.FirstName, u.LastName, se.Severity
HAVING COUNT(se.EventID) > 2
ORDER BY se.Severity DESC, event_count DESC;

-- Sorgu 8: Hastalar ve sigorta bilgileri
SELECT p.PatientID, u.FirstName, u.LastName, 
       i.ProviderName, i.CoverageType,
       COUNT(a.AppointmentID) as appointment_count
FROM Patient p
JOIN User u ON p.UserID = u.UserID
JOIN Insurance i ON p.InsuranceID = i.InsuranceID
LEFT JOIN Appointment a ON p.PatientID = a.PatientID
GROUP BY p.PatientID, u.FirstName, u.LastName, 
         i.ProviderName, i.CoverageType;

-- Sorgu 9: Yüksek risk tıbbi cihazlar
SELECT h.HospitalName, md.DeviceType, md.FirmwareVersion, md.RiskLevel
FROM MedicalDevice md
JOIN Hospital h ON md.HospitalID = h.HospitalID
WHERE md.RiskLevel IN ('High', 'Critical')
ORDER BY h.HospitalName, md.RiskLevel DESC;

-- Sorgu 10: İlaç analizi
SELECT 
    pr.MedicineName, 
    COUNT(pr.PrescriptionNo) as prescription_count,
    AVG(pr.DurationDays) as avg_duration,
    MAX(a.AppointmentDate) as last_prescribed
FROM Prescription pr
JOIN Appointment a ON pr.AppointmentID = a.AppointmentID
GROUP BY pr.MedicineName
ORDER BY prescription_count DESC;
