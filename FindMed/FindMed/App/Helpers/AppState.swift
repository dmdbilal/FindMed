//
// AppState.swift
// FindMed
//
// Created by Mohamed Bilal on 10/05/25
//

import SwiftUI

class AppState: ObservableObject {
    @Published var isSignedIn: Bool {
        didSet {
            // Save the sign-in state to UserDefaults whenever it changes
            UserDefaults.standard.set(isSignedIn, forKey: "isSignedIn")
        }
    }
    
    init() {
        // Load the sign-in state from UserDefaults when the app starts
        self.isSignedIn = UserDefaults.standard.bool(forKey: "isSignedIn")
    }
}
