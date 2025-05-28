//
// MyHomeView.swift
// FindMed
//
// Created by Mohamed Bilal on 13/04/25
//

import SwiftUI

struct MyHomeView: View {
    var greetingTime: String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        switch hour {
        case 5..<12:
            return "Morning"
        case 12..<17:
            return "Afternoon"
        case 17..<21:
            return "Evening"
        default:
            return "Night"
        }
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: .zero) {
                Text("Good \(greetingTime), Bilal 👋")
                    .font(.bold(size: 24))
                    .foregroundStyle(.beetleGreen)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(
                        EdgeInsets(
                            top: 16,
                            leading: .zero,
                            bottom: 24,
                            trailing: .zero
                        )
                    )
                
                ReviewApplicationView()
                    .padding(.bottom, 24)
                
                Text("Review & Verify Profiles")
                    .font(.semiBold(size: 16))
                    .padding(.bottom, 16)
                
                VerifyProfileItemView()
                VerifyProfileItemView()
                VerifyProfileItemView()
                
                Spacer()
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    MyHomeView()
}
