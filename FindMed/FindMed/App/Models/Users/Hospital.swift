//
// Hospital.swift
// FindMed
//
// Created by Mohamed Bilal on 10/05/25
//

import Foundation

struct Hospital: Codable, Identifiable {
    var id: UUID = UUID()
    let credential: Credential
    let name: String
    let location: Location
    let phoneNumber: String
    let emailAddress: String
    let websiteURL: String?
}

struct Location: Codable, Hashable, Equatable {
    let address: String
    let city: String
    let state: String
    let zipCode: String
    let country: String
}
