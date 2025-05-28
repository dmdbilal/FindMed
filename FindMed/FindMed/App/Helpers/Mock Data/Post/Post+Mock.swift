//
// Post+Mock.swift
// FindMed
//
// Created by Mohamed Bilal on 10/05/25
//

import Foundation

extension Post {
    static var mock: [Post] {
        Bundle.main.decode([Post].self, from: "post-default.json")
    }
    
    static func getPost(id: UUID) -> Post? {
        return mock.first { $0.id == id }
    }
}
