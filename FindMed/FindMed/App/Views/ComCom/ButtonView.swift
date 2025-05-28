//
// ButtonView.swift
// FindMed
//
// Created by Mohamed Bilal on 14/04/25
//

import SwiftUI

struct ButtonView: View {
    var title: String
    var titleColor: Color
    var fillColor: Color?
    var outlineColor: Color?
    var height: CGFloat = 40
    
    var onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            Text(title)
                .font(.semiBold(size: 16))
                .foregroundStyle(titleColor)
                .frame(maxWidth: .infinity, minHeight: height)
        }
        .background {
            RoundedRectangle(cornerRadius: 24)
                .stroke(outlineColor ?? .clear, lineWidth: 2)
                .fill(fillColor ?? .clear)
        }
    }
}
