-- Hastane Yönetim Sistemi - Örnek Veriler

-- Hastaneler
INSERT INTO Hospital VALUES 
(1, 'Central City Hospital', '123 Main St', 'Istanbul', '2125551234'),
(2, 'Metropolitan Medical Center', '456 Oak Ave', 'Ankara', '3125556789'),
(3, 'Aegean Health Campus', '789 Coastal Rd', 'Izmir', '2325553456');

-- Kullanıcılar
INSERT INTO User VALUES 
(1, 'Ahmet', 'Yilmaz', 'ahmet.yilmaz@mail.com', 'Istanbul', 'Main St', '34000', 'Doctor'),
(2, 'Fatima', 'Kaya', 'fatima.kaya@mail.com', 'Istanbul', 'Oak Ave', '34001', 'Patient'),
(3, 'Mehmet', 'Demir', 'mehmet.demir@mail.com', 'Ankara', 'Central Ave', '06100', 'Admin'),
(4, 'Leyla', 'Gunes', 'leyla.gunes@mail.com', 'Istanbul', 'Park St', '34002', 'Doctor'),
(5, 'Ali', 'Ozturk', 'ali.ozturk@mail.com', 'Ankara', 'Peace Rd', '06101', 'Patient'),
(6, 'Ayse', 'Kaya', 'ayse.kaya@mail.com', 'Izmir', 'Beach Ave', '35000', 'Patient'),
(7, 'Kemal', 'Sezer', 'kemal.sezer@mail.com', 'Istanbul', 'Hill St', '34003', 'Doctor'),
(8, 'Nur', 'Acar', 'nur.acar@mail.com', 'Ankara', 'Green Rd', '06102', 'Doctor'),
(9, 'Zeynep', 'Koc', 'zeynep.koc@mail.com', 'Izmir', 'Port Rd', '35001', 'Patient'),
(10, 'Can', 'Arslan', 'can.arslan@mail.com', 'Istanbul', 'Valley Way', '34004', 'Patient'),
(11, 'Elif', 'Sahin', 'elif.sahin@mail.com', 'Ankara', 'Forest St', '06103', 'Patient'),
(12, 'Burak', 'Demir', 'burak.demir@mail.com', 'Izmir', 'Mountain Rd', '35002', 'Patient'),
(13, 'Admin', 'Manager', 'admin@hospital.com', 'Istanbul', 'Admin St', '34005', 'Admin'),
(14, 'Security', 'Officer', 'security@hospital.com', 'Istanbul', 'Security Rd', '34006', 'SecurityAnalyst'),
(15, 'Onur', 'Bal', 'onur.bal@mail.com', 'Ankara', 'Center Rd', '06104', 'Doctor');

-- Telefon numaraları
INSERT INTO UserPhone VALUES 
(1, '5551234567'), (1, '2165551000'),
(2, '5552223344'), (2, '2165552000'),
(4, '5553334455'),
(6, '5554445566'), (6, '2325553000'),
(7, '5555556789'),
(8, '5556667890');

-- Sigorta şirketleri
INSERT INTO Insurance VALUES 
(1, 'Blue Cross', 'BC2024001', 'Comprehensive'),
(2, 'Acibadem Health', 'AH2024002', 'Premium'),
(3, 'SGK (Government)', 'SGK2024001', 'Standard'),
(4, 'Allianz Turkey', 'ALZ2024001', 'Premium'),
(5, 'AXA Insurance', 'AXA2024001', 'Standard'),
(6, 'Zurich Health', 'ZUR2024001', 'Comprehensive'),
(7, 'Bupa Health', 'BUPA2024001', 'Premium'),
(8, 'DKT Insurance', 'DKT2024001', 'Standard'),
(9, 'Ray Sigorta', 'RAY2024001', 'Standard'),
(10, 'Groupama', 'GRP2024001', 'Comprehensive');

-- Hastalar
INSERT INTO Patient VALUES 
(2, 2, 'O+', '1985-03-15', 'Ayse Kaya', 1),
(5, 5, 'A+', '1990-07-22', 'Mehmet Yilmaz', 3),
(6, 6, 'B-', '1988-11-30', 'Zeynep Demir', 2),
(9, 9, 'AB+', '1995-05-14', 'Fatih Kaya', 5),
(10, 10, 'O-', '1992-09-27', 'Selen Ozturk', 4),
(11, 11, 'A-', '2000-01-10', 'Emre Sahin', 6),
(12, 12, 'B+', '1987-04-18', 'Deniz Arslan', 7);

-- Bölümler
INSERT INTO Department VALUES 
(1, 1, 'Cardiology', 3),
(2, 1, 'Dermatology', 2),
(3, 1, 'Neurology', 4),
(4, 2, 'Cardiology', 1),
(5, 2, 'Orthopedics', 2),
(6, 2, 'Pediatrics', 3),
(7, 3, 'Internal Medicine', 1),
(8, 3, 'Dermatology', 2);

-- Doktorlar
INSERT INTO Doctor VALUES 
(1, 1, 1, 'Cardiology', 'LIC001234', '2024-01-10 09:00:00'),
(4, 4, 2, 'Dermatology', 'LIC001235', '2024-02-15 10:00:00'),
(7, 7, 3, 'Neurology', 'LIC001236', '2024-01-20 08:30:00'),
(8, 8, 4, 'Cardiology', 'LIC001237', '2024-03-01 14:00:00'),
(15, 15, 5, 'Orthopedics', 'LIC001238', '2024-02-10 11:00:00');

-- Randevular
INSERT INTO Appointment VALUES 
(1, 2, 1, '2024-05-20 10:30:00', 'Completed', 'Patient shows symptoms of hypertension'),
(2, 2, 1, '2024-06-01 14:00:00', 'Scheduled', 'Follow-up appointment'),
(3, 5, 4, '2024-05-15 09:00:00', 'Completed', 'Cardiac evaluation'),
(4, 6, 4, '2024-05-22 15:30:00', 'Completed', 'Heart checkup'),
(5, 9, 7, '2024-06-05 11:00:00', 'Scheduled', 'Neurological assessment'),
(6, 10, 1, '2024-05-28 13:15:00', 'Completed', 'Blood pressure monitoring'),
(7, 11, 4, '2024-06-10 10:45:00', 'Scheduled', 'Post-MI follow-up'),
(8, 12, 15, '2024-06-12 08:00:00', 'Completed', 'Orthopedic consultation'),
(9, 2, 4, '2024-06-15 16:00:00', 'Scheduled', 'Dermatology visit'),
(10, 5, 1, '2024-06-18 09:30:00', 'Completed', 'Routine cardiac exam'),
(11, 6, 7, '2024-06-20 14:20:00', 'Scheduled', 'Neurology follow-up'),
(12, 9, 15, '2024-06-25 11:00:00', 'Completed', 'Orthopedic assessment'),
(13, 10, 4, '2024-07-01 10:00:00', 'Scheduled', 'Cardiology review'),
(14, 11, 1, '2024-07-05 15:45:00', 'Completed', 'Heart rate study'),
(15, 12, 8, '2024-07-10 09:15:00', 'Scheduled', 'Second opinion cardiology');

-- İlaç reçeteleri
INSERT INTO Prescription VALUES 
(1, 1, 'Lisinopril', '10mg daily', 30),
(2, 1, 'Metoprolol', '25mg twice daily', 30),
(1, 2, 'Atorvastatin', '20mg daily', 60),
(1, 3, 'Aspirin', '100mg daily', 90),
(2, 3, 'Amlodipine', '5mg daily', 30),
(1, 4, 'Furosemide', '40mg daily', 30),
(1, 5, 'Digoxin', '0.25mg daily', 30),
(2, 5, 'Warfarin', '5mg daily', 30),
(1, 6, 'Clopidogrel', '75mg daily', 30),
(2, 6, 'Nitroglycerin', 'as needed', 10),
(1, 7, 'Carvedilol', '3.125mg twice daily', 30),
(1, 8, 'Losartan', '50mg daily', 30),
(2, 8, 'Hydrochlorothiazide', '12.5mg daily', 30),
(1, 9, 'Ibuprofen', '400mg thrice daily', 14),
(1, 10, 'Tramadol', '50mg as needed', 30);

-- Laboratuvar sonuçları
INSERT INTO LabResult VALUES 
(1, 1, 'Blood Pressure', '140/90 mmHg', '2024-05-20'),
(2, 1, 'Cholesterol', '240 mg/dL', '2024-05-20'),
(3, 3, 'ECG', 'Normal sinus rhythm', '2024-05-15'),
(4, 4, 'Troponin', '0.02 ng/mL', '2024-05-22'),
(5, 5, 'MRI Brain', 'No abnormalities', '2024-06-05'),
(6, 6, 'Hemoglobin', '13.5 g/dL', '2024-05-28'),
(7, 7, 'BNP', '45 pg/mL', '2024-06-10'),
(8, 8, 'X-Ray', 'Normal', '2024-06-12'),
(9, 10, 'Blood Glucose', '120 mg/dL', '2024-06-18'),
(10, 12, 'CT Scan', 'Findings noted', '2024-06-25'),
(11, 14, 'Electrocardiogram', 'Abnormal - T wave', '2024-07-05');

-- Faturalar
INSERT INTO Billing VALUES 
(1, 2, 800.00, 'Paid', '2024-05-20'),
(2, 5, 750.00, 'Pending', '2024-05-15'),
(3, 6, 900.00, 'Paid', '2024-05-22'),
(4, 9, 650.00, 'Unpaid', '2024-06-05'),
(5, 10, 800.00, 'Paid', '2024-05-28'),
(6, 11, 750.00, 'Pending', '2024-06-10'),
(7, 12, 700.00, 'Paid', '2024-06-12'),
(8, 2, 800.00, 'Unpaid', '2024-06-15'),
(9, 5, 900.00, 'Paid', '2024-06-18'),
(10, 6, 750.00, 'Pending', '2024-06-20');

-- Tıbbi cihazlar
INSERT INTO MedicalDevice VALUES 
(1, 1, 'Cardiac Monitor', '4.2.1', 'High'),
(2, 1, 'ECG Machine', '3.1.0', 'Medium'),
(3, 1, 'Defibrillator', '5.0.0', 'Critical'),
(4, 2, 'MRI Scanner', '2.5.1', 'Critical'),
(5, 2, 'CT Scanner', '3.8.0', 'High'),
(6, 3, 'Ultrasound', '2.1.0', 'Medium');

-- Güvenlik olayları
INSERT INTO SecurityEvent VALUES 
(1, 1, 1, 'Device Access', 'INFO', '192.168.1.100', '2024-05-20 10:00:00'),
(2, 2, 2, 'Data Query', 'INFO', '192.168.1.101', '2024-05-20 11:30:00'),
(3, 3, 1, 'Configuration Change', 'WARNING', '192.168.1.102', '2024-05-20 14:45:00'),
(4, 1, 3, 'Firmware Update Pending', 'CRITICAL', '192.168.1.100', '2024-05-21 09:00:00'),
(5, 4, 4, 'Unauthorized Access Attempt', 'CRITICAL', '203.0.113.50', '2024-05-21 15:30:00');
