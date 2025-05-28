//
// Doctor+Mock.swift
// FindMed
//
// Created by Mohamed Bilal on 10/05/25
//

import Foundation

extension Doctor {
    static var mock: Doctor {
        Bundle.main.decode(Doctor.self, from: "doctor-default.json")
    }
}

extension Hospital {
    static var mock: Hospital {
        Bundle.main.decode(Hospital.self, from: "hospital-default.json")
    }
}
