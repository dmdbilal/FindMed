//
// MyJobsViewModel.swift
// FindMed
//
// Created by Mohamed Bilal on 11/05/25
//

import SwiftUI

@MainActor
final class MyJobsViewModel: ObservableObject {
    @Published var jobs: [Post]
    @Published var currentJob: Post
    let isAdmin: Bool = true
    
    init(jobs: [Post]) {
        self.jobs = jobs
        self.currentJob = jobs[0]
    }
    
    func createModel(
        role: String,
        hospitalName: String,
        address: String,
        shiftTimingFrom: Date,
        shiftTimingTo: Date,
        wages: String,
        doctorsNeed: String,
        description: String,
        qualifications: String,
        deadline: Date
    ) {
        let post = Post(
            hospitalID: UUID(),
            hospitalName: hospitalName,
            location: Location(
                address: address,
                city: "",
                state: "",
                zipCode: "",
                country: ""
            ),
            title: role,
            description: description,
            qualifications: qualifications,
            shiftTime: ShiftTime(
                from: shiftTimingFrom,
                to: shiftTimingTo
            ),
            wages: Double(wages) ?? 0,
            openings: Int(doctorsNeed) ?? 0,
            applicants: 0,
            postedDate: Date(),
            deadline: deadline,
            isActive: true
        )
        
        do {
            let jsonData = try JSONEncoder().encode(post)
                
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print("Encoded JSON: \(jsonString)")
                dump(post)
            }
        } catch {
            print("Failed to encode object: \(error)")
        }
    }
}
