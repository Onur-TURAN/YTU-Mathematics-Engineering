-- Hastane Yönetim Sistemi - Tablo Yapısı

CREATE TABLE Hospital (
    HospitalID INT PRIMARY KEY AUTO_INCREMENT,
    HospitalName VARCHAR(100) NOT NULL,
    Address VARCHAR(150),
    City VARCHAR(50),
    PhoneNumber VARCHAR(15)
);

CREATE TABLE User (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    City VARCHAR(50),
    Street VARCHAR(100),
    PostalCode VARCHAR(10),
    Role ENUM('Patient', 'Doctor', 'Admin', 'SecurityAnalyst')
);

CREATE TABLE UserPhone (
    UserID INT NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    PRIMARY KEY (UserID, PhoneNumber),
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE
);

CREATE TABLE Insurance (
    InsuranceID INT PRIMARY KEY AUTO_INCREMENT,
    ProviderName VARCHAR(100) NOT NULL,
    PolicyNumber VARCHAR(50) UNIQUE,
    CoverageType VARCHAR(50)
);

CREATE TABLE Patient (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL UNIQUE,
    BloodType VARCHAR(5),
    BirthDate DATE,
    EmergencyContact VARCHAR(100),
    InsuranceID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE,
    FOREIGN KEY (InsuranceID) REFERENCES Insurance(InsuranceID)
);

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    HospitalID INT NOT NULL,
    DepartmentName VARCHAR(100) NOT NULL,
    FloorNumber INT,
    FOREIGN KEY (HospitalID) REFERENCES Hospital(HospitalID) ON DELETE CASCADE
);

CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL UNIQUE,
    DepartmentID INT NOT NULL,
    Specialty VARCHAR(100),
    LicenseNumber VARCHAR(50) UNIQUE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate TIMESTAMP,
    Status VARCHAR(50),
    DiagnosisSummary TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID) ON DELETE CASCADE,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    INDEX idx_patient (PatientID),
    INDEX idx_doctor (DoctorID),
    INDEX idx_date (AppointmentDate)
);

CREATE TABLE Prescription (
    PrescriptionNo INT NOT NULL,
    AppointmentID INT NOT NULL,
    MedicineName VARCHAR(100),
    Dosage VARCHAR(50),
    DurationDays INT,
    PRIMARY KEY (PrescriptionNo, AppointmentID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID) ON DELETE CASCADE
);

CREATE TABLE LabResult (
    ResultID INT PRIMARY KEY AUTO_INCREMENT,
    AppointmentID INT NOT NULL,
    TestName VARCHAR(100),
    ResultValue VARCHAR(100),
    ResultDate DATE,
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID) ON DELETE CASCADE
);

CREATE TABLE Billing (
    BillID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT NOT NULL,
    Amount DECIMAL(10, 2),
    PaymentStatus VARCHAR(50),
    BillingDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID) ON DELETE CASCADE
);

CREATE TABLE MedicalDevice (
    DeviceID INT PRIMARY KEY AUTO_INCREMENT,
    HospitalID INT NOT NULL,
    DeviceType VARCHAR(100),
    FirmwareVersion VARCHAR(50),
    RiskLevel VARCHAR(20),
    FOREIGN KEY (HospitalID) REFERENCES Hospital(HospitalID) ON DELETE CASCADE
);

CREATE TABLE SecurityEvent (
    EventID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    DeviceID INT,
    EventType VARCHAR(100),
    Severity VARCHAR(50),
    SourceIP VARCHAR(15),
    EventTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE,
    FOREIGN KEY (DeviceID) REFERENCES MedicalDevice(DeviceID) ON DELETE SET NULL,
    INDEX idx_user (UserID),
    INDEX idx_timestamp (EventTimestamp)
);
