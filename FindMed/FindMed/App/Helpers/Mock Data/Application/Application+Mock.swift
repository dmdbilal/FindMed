//
// Application+Mock.swift
// FindMed
//
// Created by Mohamed Bilal on 10/05/25
//

import Foundation

extension Application {
    static var mock: [Application] {
        Bundle.main.decode([Application].self, from: "application-default.json")
    }
}
