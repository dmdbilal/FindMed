//
// Post.swift
// FindMed
//
// Created by Mohamed Bilal on 10/05/25
//

import Foundation

struct ShiftTime: Codable, Hashable, Equatable {
    let from: Date
    let to: Date
}

// TODO: Get image url for the PoC
struct Post: Codable, Identifiable, Hashable, Equatable {
    var id: UUID = UUID()
    let hospitalID: UUID // for PoC
    let hospitalName: String
    let location: Location
    let title: String
    let description: String
    let qualifications: String
    let shiftTime: ShiftTime
    let wages: Double
    let openings: Int
    var applicants: Int // TODO: should be increased after every successful application submission
    let postedDate: Date
    let deadline: Date
    let isActive: Bool
}

extension Post {
    var fullAddress: String {
        "\(location.address), \(location.city), \(location.state) - \(location.zipCode)"
    }
    
    var formattedWages: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        
        if let formattedNumber = numberFormatter.string(from: NSNumber(value: wages)) {
            return formattedNumber
        }
        
        fatalError("Couldn't format the wages value")
    }
    
    var postedOn: String {
        let daysAgo = postedDate.daysAgo

        switch daysAgo {
        case "0":
            return "Few hours ago"
        default:
            return "\(daysAgo)d ago"
        }
    }
}
