//
// Chat.swift
// FindMed
//
// Created by Mohamed Bilal on 10/05/25
//

import Foundation

struct Chat: Codable, Identifiable, Hashable {
    var id: UUID = UUID()
    let participants: [Participant] // To achieve normalization the details are separated for User, Hospital
    let messages: [Message]
}

struct Participant: Codable, Identifiable, Hashable {
    let id: UUID
    let name: String
}

enum SenderType: String, Codable, Hashable {
    case doctor
    case hospital
}

struct Message: Codable, Identifiable, Hashable {
    var id: UUID = UUID()
    let senderType: SenderType
    let content: String
    let timestamp: Date
    // TODO: can add isRead field
}

extension Chat {
    // last message timestamp
    var lastMessageTimestamp: String {
        guard let date = messages.last?.timestamp else {
            fatalError("Couldn't get the last message")
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "h a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        
        return formatter.string(from: date)
    }
    // admins name (get details of the admin from the id in the participants)
}
