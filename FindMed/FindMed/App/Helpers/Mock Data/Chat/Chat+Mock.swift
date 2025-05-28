//
// Chat+Mock.swift
// FindMed
//
// Created by Mohamed Bilal on 10/05/25
//

import Foundation

extension Chat {
    static var mock: [Chat] {
        Bundle.main.decode([Chat].self, from: "chat-default.json")
    }
}
