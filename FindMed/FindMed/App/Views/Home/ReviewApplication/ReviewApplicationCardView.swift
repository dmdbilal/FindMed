//
// ReviewApplicationView.swift
// FindMed
//
// Created by Mohamed Bilal on 13/04/25
//

import SwiftUI

struct ReviewApplicationCardView: View {
    var specialization: String
    var hospitalName: String
    var candidateName: String
    var designationTitle: String
    var postedAgo: String
    var onClick: (() -> Void)
    
    var body: some View {
        HStack(alignment: .top, spacing: .zero) {
            VStack(alignment: .leading, spacing: .zero) {
                Text(specialization)
                    .font(.semiBold(size: 14))
                
                Text(hospitalName)
                    .font(.regular(size: 12))
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: .zero) {
                Text(candidateName)
                    .font(.semiBold(size: 14))
                
                Text(designationTitle)
                    .font(.regular(size: 12))
                
                Text(postedAgo)
                    .font(.semiBold(size: 10))
                    .foregroundStyle(.coolGray)
                    .padding(.top, 8)
            }
        }
        .padding(16)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .stroke(.skyTeal, lineWidth: 2)
        }
        .padding(.bottom, 16)
        .contentShape(Rectangle())
        .onTapGesture {
            onClick()
        }
    }
}


#Preview {
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
