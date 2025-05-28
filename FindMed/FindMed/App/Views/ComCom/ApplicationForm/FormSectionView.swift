//
// FormSectionView.swift
// FindMed
//
// Created by Mohamed Bilal on 30/04/25
//

import SwiftUI

struct FormSectionView: View {
    struct FieldConfig {
        var textBinding: Binding<String>
        var placeholder: String
    }
    
    var title: String
    var fields: [FieldConfig]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 8)

            ForEach(0..<fields.count, id: \.self) { index in
                LabelTextField(
                    text: fields[index].textBinding,
                    placeHolder: fields[index].placeholder
                )
            }
        }
        .padding(.bottom, 24)
    }
}

#Preview {
    FormSectionView(
        title: "Personal Information",
        fields: []
    )
}
