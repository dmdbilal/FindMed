//
// AuthService.swift
// FindMed
//
// Created by Mohamed Bilal on 10/05/25
//

import Foundation

final class AuthService {
    static let shared = AuthService()
        
    func signIn(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        // Simulate API Call
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            if email == "Test" && password == "123" {
                completion(.success("Sign-in Successful!"))
            } else {
                completion(.failure(NSError(domain: "AuthService", code: 401, userInfo: [NSLocalizedDescriptionKey: "Invalid credentials"])))
            }
        }
    }
}
