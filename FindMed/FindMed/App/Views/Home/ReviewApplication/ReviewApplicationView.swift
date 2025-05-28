//
// ReviewApplicationView.swift
// FindMed
//
// Created by Mohamed Bilal on 13/04/25
//

import SwiftUI

struct ReviewApplicationView: View {
    var body: some View {
        VStack(spacing: .zero) {
            Text("Review & Verify Applications")
                .font(.semiBold(size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 16)
            
            ReviewApplicationCardView(
                specialization: "Specialization",
                hospitalName: "Hospital",
                candidateName: "User1",
                designationTitle: "Doctor",
                postedAgo: "2d ago"
            ) {
                print("Clicked ReviewApplicationCardView")
            }
            
            ReviewApplicationCardView(
                specialization: "Specialization",
                hospitalName: "Hospital",
                candidateName: "User1",
                designationTitle: "Doctor",
                postedAgo: "2d ago"
            ) {
                print("Clicked ReviewApplicationCardView")
            }
            
            ReviewApplicationCardView(
                specialization: "Specialization",
                hospitalName: "Hospital",
                candidateName: "User1",
                designationTitle: "Doctor",
                postedAgo: "2d ago"
            ) {
                print("Clicked ReviewApplicationCardView")
            }
        }
    }
}

#Preview {
    ReviewApplicationView()
}
