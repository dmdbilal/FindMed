//
// DialogView.swift
// FindMed
//
// Created by Mohamed Bilal on 19/04/25
//

import SwiftUI

struct DialogView: View {
    let title: String
    let note: String
    let buttonTitle1: String
    var buttonAction1: () -> Void
    let buttonTitle2: String
    var buttonAction2: () -> Void
    var onDismiss: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.semiBold(size: 16))
                
                Spacer()
                
                Button {
                    onDismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.mediumGray)
                        .fontWeight(.bold)
                }
            }
            .padding(.bottom, 8)
            
            Text(note)
                .font(.regular(size: 14))
                .foregroundStyle(.coolGray)
            
            Spacer()
            
            HStack {
                ButtonView(
                    title: buttonTitle1,
                    titleColor: .mediumGray,
                    outlineColor: .coolGray
                ) {
                    buttonAction1()
                }
                
                ButtonView(
                    title: buttonTitle2,
                    titleColor: .white,
                    fillColor: .beetleGreen
                ) {
                    // TODO: Add condition for completed profiles to access quick apply
                    buttonAction2()
                }
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 24)
                .fill(.white)
                .shadow(radius: 3)
        }
        .frame(height: 200)
        .padding(.horizontal, 24)
    }
}

#Preview {
    DialogView(
        title: "Apply with single click",
        note: "If you want to continue with your current profile without any updates, click the Quick Apply else, click Apply.",
        buttonTitle1: "Apply",
        buttonAction1: {},
        buttonTitle2: "Quick Apply",
        buttonAction2: {}
    ) {
       
    }
}
