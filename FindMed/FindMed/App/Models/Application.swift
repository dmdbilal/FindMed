//
// Application.swift
// FindMed
//
// Created by Mohamed Bilal on 10/05/25
//

import SwiftUI

struct Application: Codable, Identifiable, Hashable {
    var id: UUID = UUID()
    let doctorID: UUID
    let postID: UUID
    let applicationDate: Date
    let status: ApplicationStatus
    
    enum ApplicationStatus: String, Codable {
        case review
        case approved
        case rejected
        case completed
        
        var color: Color {
            switch self {
            case .review:
                Color.warmPeach
            case .approved:
                Color.tealGreen
            case .rejected:
                Color.rosePink
            case .completed:
                Color.beetleGreen
            }
        }
        
        var statusText: String {
            switch self {
            case .review:
                "Under Review"
            case .approved:
                "Approved"
            case .rejected:
                "Rejected"
            case .completed:
                "Completed"
            }
        }
    }
}
