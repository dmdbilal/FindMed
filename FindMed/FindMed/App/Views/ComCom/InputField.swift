//
// InputField.swift
// FindMed
//
// Created by Mohamed Bilal on 14/04/25
//

import SwiftUI

struct InputField: View {
    @Binding var text: String
    let placeHolder: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(text)
                .font(.regular(size: text.isEmpty ? 16 : 14))
                .offset(y: text.isEmpty ? 0 : -25)
                .scaleEffect(text.isEmpty ? 1 : 0.9, anchor: .leading)
            
            TextField("Enter \(placeHolder)", text: $text)
                .font(.medium(size: 16))
        }
        .padding(.top, text.isEmpty ? .zero : 16)
        .animation(.default, value: text)
        .padding(8)
        .background {
            RoundedRectangle(cornerRadius: 4)
                .stroke(.lightGray, lineWidth: 1)
        }
    }
}

struct FloatingLabelTextField: View {
    @Binding var text: String
    let placeHolder: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(placeHolder)
                .font(.regular(size: placeHolder.isEmpty ? 16 : 14))
                .offset(y: placeHolder.isEmpty ? 0 : -25)
                .scaleEffect(placeHolder.isEmpty ? 1 : 0.9, anchor: .leading)
            
            TextField("Enter \(placeHolder)", text: $text/*, axis: .vertical*/)
                .font(.medium(size: 16))
        }
        .padding(.top, placeHolder.isEmpty ? .zero : 16)
        .animation(.default, value: text)
        .padding(8)
        .background {
            RoundedRectangle(cornerRadius: 4)
                .stroke(.lightGray, lineWidth: 1)
        }
    }
}

struct BorderLabelTextField: View {
    @Binding var text: String
    let placeHolder: String
    var isMandatoryField: Bool = false
    var keyboardType: UIKeyboardType = .default
    var isParagraph: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(placeHolder)
                .font(.semiBold(size: 14))
                .foregroundStyle(.beetleGreen)
            
            if isParagraph {
                ZStack(alignment: .leading) {
                    TextEditor(text: $text)
                        .font(.regular(size: 14))
                        .padding(8)
                        .frame(minHeight: 50)
                        .submitLabel(.next)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(text.isEmpty ? .lightGray : .tealGreen, lineWidth: 1)
                        }
                    
                    if text.isEmpty {
                        Text("Enter \(placeHolder)")
                            .font(.regular(size: 14))
                            .foregroundColor(.lightGray)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                    }
                }
            } else {
                TextField("Enter \(placeHolder)", text: $text)
                    .font(.regular(size: 14))
                    .frame(height: 40)
                    .padding(.horizontal, 8)
                    .submitLabel(.next)
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(text.isEmpty ? .lightGray : .tealGreen, lineWidth: 1)
                    }
                    .keyboardType(keyboardType)
            }
        }
        .padding(.horizontal, 2)
    }
}

extension View {
    func focusedField<T>(
        _ focusedField: FocusState<T?>.Binding,
        equals field: T,
        submitLabel: SubmitLabel = .next,
        onSubmit: @escaping () -> Void
    ) -> some View {
        self
        .focused(focusedField, equals: field)
        .submitLabel(submitLabel)
        .onSubmit {
            onSubmit()
        }
    }
}

struct FloatingBorderLabelTextField: View {
    @Binding var text: String
    let placeHolder: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(placeHolder)
                .font(.semiBold(size: text.isEmpty ? 16 : 14))
                .foregroundStyle(text.isEmpty ? .coolGray : .tealGreen)
                .padding(.horizontal, 4)
                .background(.white)
                .offset(x: -4, y: text.isEmpty ? 0 : -30)
                .scaleEffect(text.isEmpty ? 1 : 0.9, anchor: .leading)
            
            TextField("", text: $text)
                .font(.regular(size: 16))
                .frame(height: 40)
        }
        .animation(.default, value: text)
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .stroke(text.isEmpty ? .lightGray : .tealGreen, lineWidth: 1)
        }
        .padding(.horizontal, 2)
    }
}

struct LabelTextField: View {
    @Binding var text: String
    let placeHolder: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(placeHolder)
                .font(.semiBold(size: 14))
                .foregroundStyle(text.isEmpty ? .coolGray : .tealGreen)
                .padding(.horizontal, 4)
                .background(.white)
                .offset(x: -4, y: text.isEmpty ? 0 : -24)
                .scaleEffect(text.isEmpty ? 1 : 0.9, anchor: .leading)
                .padding(.top, text.isEmpty ? 0 : 4)
            
            TextField("", text: $text)
                .font(.regular(size: 14))
                .frame(height: 40)
                .background {
                    Rectangle()
                        .foregroundStyle(.lightGray.opacity(0.5))
                        .frame(height: 1)
                        .offset(y: 15)
                }
        }
        .animation(.default, value: text)
        .padding(.vertical, 8)
    }
}

struct PasswordInputField: View {
    @Binding var text: String
    let placeHolder: String
    @State private var isSecured: Bool = true
    
    var body: some View {
        ZStack(alignment: .trailing) {
            ZStack(alignment: .leading) {
                Text(placeHolder)
                    .font(.semiBold(size: text.isEmpty ? 16 : 14))
                    .foregroundStyle(text.isEmpty ? .coolGray : .tealGreen)
                    .padding(.horizontal, 4)
                    .background(.white)
                    .offset(x: -4, y: text.isEmpty ? 0 : -30)
                    .scaleEffect(text.isEmpty ? 1 : 0.9, anchor: .leading)
                
                if isSecured {
                    SecureField("", text: $text)
                        .frame(height: 40)
                } else {
                    TextField("", text: $text)
                        .font(.regular(size: 16))
                        .frame(height: 40)
                }
            }
            
            Button {
                isSecured.toggle()
            } label: {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            }
        }
        .animation(.default, value: text)
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .stroke(text.isEmpty ? .lightGray : .tealGreen, lineWidth: 1)
        }
        .padding(.horizontal, 2)
    }
}

#Preview {
    VStack(spacing: 16) {
        InputField(text: .constant(""), placeHolder: "Input Field")
        FloatingLabelTextField(text: .constant(""), placeHolder: "FloatingLabelTextField")
        BorderLabelTextField(text: .constant(""), placeHolder: "BorderLabelTextField")
        FloatingBorderLabelTextField(text: .constant("jhgf"), placeHolder: "FloatingBorderLabelTextField")
        LabelTextField(text: .constant("Hello"), placeHolder: "LabelTextField")
        PasswordInputField(text: .constant("pass"), placeHolder: "PasswordInputField")
    }
    .padding(.horizontal, 16)
}
