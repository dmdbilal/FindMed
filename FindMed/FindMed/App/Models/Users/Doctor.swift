//
// Doctor.swift
// FindMed
//
// Created by Mohamed Bilal on 10/05/25
//

import Foundation

enum Gender: Codable {
    case male
    case female
    case others
}

struct Credential: Codable {
    let email: String
    let password: String
}

// TODO: Change the variables to `var` for modifications.
struct Doctor: Codable, Identifiable {
    var id: UUID = UUID()
    var isVerified: Bool
    let credential: Credential
    let associatedHospitalID: String
    let personalInformation: PersonalInformation
    let educationalBackground: EducationalBackground
    let professionalBackground: ProfessionalBackground
    let documents: Documents
}

struct PersonalInformation: Codable {
    let profileImage: String // Image URL
    let fullName: String
    let gender: Gender
    let dateOfBirth: Date
    let phoneNumber: String
    let emailAddress: String
    let residentialAddress: String
    let languagesSpoken: String
}

struct EducationalBackground: Codable {
    let qualification: String
    let schoolName: String
    let graduationYear: Int
    let academicAchievements: String?
    let certifications: String?
    let residencyInformation: String
    let licenseInformation: String
}

struct ProfessionalBackground: Codable {
    let jobTitle: String
    let hospitalName: String
    let workExperiences: String
    let specialization: String
    let skills: String
    let affiliations: String?
}

struct Documents: Codable {
    let medicalLicense: String
    let degreeCertificates: String
    let residencyCompletionCertificate: String
    let medicalSchoolTranscript: String
    let boardCertification: String?
    let otherCertificates: String?
    let identityProof: String
    let proofOfAddress: String
}
