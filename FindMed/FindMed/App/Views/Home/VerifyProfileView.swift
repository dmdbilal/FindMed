//
// VerifyProfileCardView.swift
// FindMed
//
// Created by Mohamed Bilal on 13/04/25
//

import SwiftUI

struct VerifyProfileView: View {
    var body: some View {
        VStack(spacing: .zero) {
            Text("Review & Verify Profiles")
                .font(.semiBold(size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 16)
            
            VerifyProfileItemView()
            VerifyProfileItemView()
            VerifyProfileItemView()
        }
    }
}

struct VerifyProfileItemView: View {
    var body: some View {
        HStack(spacing: .zero) {
            VStack(alignment: .leading) {
                Text("Name")
                    .font(.semiBold(size: 14))
                
                Text("Doctor / Freshgrad")
                    .font(.regular(size: 12))
                
                Text("Hospital name / College Name")
                    .font(.regular(size: 12))
            }
            
            Spacer()
            
            Button {
                // CTA
            } label: {
                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 8, height: 14)
                    .fontWeight(.bold)
                    .foregroundStyle(.coolGray)
            }
        }
        .padding(.bottom, 16)
        
        Rectangle()
            .fill(.lightGray)
            .frame(height: 2)
            .padding(.bottom, 16)
    }
}

#Preview {
    VerifyProfileView()
}
