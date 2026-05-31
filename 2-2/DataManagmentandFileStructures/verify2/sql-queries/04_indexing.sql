-- Hastane Yönetim Sistemi - Tablo Geliştirmeleri

-- Kayıt tarihi sütunu
ALTER TABLE Patient ADD COLUMN RegistrationDate DATE DEFAULT CURRENT_DATE;

-- Sigorta kapsama yüzdesi
ALTER TABLE Insurance ADD COLUMN CoveragePct INT;

-- Fatura tutarı doğrulama
ALTER TABLE Billing ADD CONSTRAINT chk_amount CHECK (Amount > 0);

-- Doktor ücret doğrulama
ALTER TABLE Doctor ADD CONSTRAINT chk_fee CHECK (
  (SELECT Specialty FROM Doctor) IS NOT NULL AND 
  (SELECT LicenseNumber FROM Doctor) IS NOT NULL
);

-- Randevu durumu doğrulama
ALTER TABLE Appointment ADD CONSTRAINT chk_status CHECK (Status IN ('Scheduled', 'Completed', 'Cancelled'));

-- Risk seviyesi sütun tipi
ALTER TABLE MedicalDevice MODIFY COLUMN RiskLevel ENUM('Low', 'Medium', 'High', 'Critical');

-- Performans indexleri
ALTER TABLE Appointment ADD INDEX idx_appointment_date (AppointmentDate);
ALTER TABLE Appointment ADD INDEX idx_patient_doctor (PatientID, DoctorID);

-- Denetim kaydı sütunu
ALTER TABLE SecurityEvent ADD COLUMN AuditLog VARCHAR(500);

-- Ek indexler
CREATE INDEX idx_user_email ON User(Email);
CREATE INDEX idx_patient_bloodtype ON Patient(BloodType);
CREATE INDEX idx_doctor_license ON Doctor(LicenseNumber);
CREATE INDEX idx_billing_status ON Billing(PaymentStatus);
CREATE INDEX idx_insurance_provider ON Insurance(ProviderName);
CREATE INDEX idx_appointment_status ON Appointment(Status);
