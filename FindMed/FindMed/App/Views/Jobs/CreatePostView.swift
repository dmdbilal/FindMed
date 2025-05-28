//
// CreatePostView.swift
// FindMed
//
// Created by Mohamed Bilal on 02/05/25
//

import SwiftUI

struct CreatePostView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: MyJobsViewModel
    
    @State private var role: String = ""
    @State private var hospitalName: String = ""
    @State private var address: String = ""
    @State private var shiftTimingFrom: Date = Date()
    @State private var shiftTimingTo: Date = Date()
    @State private var wages: String = ""
    @State private var doctorsNeed: String = ""
    @State private var description: String = ""
    @State private var qualifications: String = ""
    @State private var deadline: Date = Date()
    
    @State private var showLocationPicker = false
    @State private var keyboardValue: CGFloat = 0
    
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        VStack {
            navigationBar
            
            ScrollView(showsIndicators: false) {
                inputFields
                    .padding(.bottom, 80)
                
                footerView
                    .padding(.horizontal, 2)
            }
            //            TODO: Location Picker
            //            .locationPicker(isPresented: $showLocationPicker) { coordinates in
            //
            //            }
            .padding(.bottom, keyboardValue - 40)
            .scrollDismissesKeyboard(.interactively)
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
        .padding(.horizontal, 16)
        .onAppear {
            NotificationCenter.default.addObserver(
                forName: UIResponder.keyboardWillShowNotification,
                object: nil,
                queue: .main
            ) { notification in
                withAnimation {
                    self.keyboardValue = getKeyboardHeight(from: notification)
                }
            }
            
            NotificationCenter.default.addObserver(
                forName: UIResponder.keyboardWillHideNotification,
                object: nil,
                queue: .main
            ) { _ in
                withAnimation {
                    self.keyboardValue = 0
                }
            }
        }
        .onDisappear {
            NotificationCenter.default.removeObserver(
                self,
                name: UIResponder.keyboardWillShowNotification,
                object: nil
            )
            NotificationCenter.default.removeObserver(
                self,
                name: UIResponder.keyboardWillHideNotification,
                object: nil
            )
        }
    }
    
    private func getKeyboardHeight(from notification: Notification) -> CGFloat {
        let key = UIResponder.keyboardFrameEndUserInfoKey
        if let keyboardFrame = notification.userInfo?[key] as? CGRect {
            return keyboardFrame.height
        }
        return 0
    }
}

// MARK: Input Fields
private extension CreatePostView {
    enum FocusedField: Hashable {
        case role
        case hospitalName
        case address
        case shiftTime
        case wages
        case doctorsNeed
        case description
        case qualifications
    }
    
    var inputFields: some View {
        VStack(spacing: 16) {
            BorderLabelTextField(
                text: $role,
                placeHolder: "Role",
                isMandatoryField: true
            )
            .focusedField(
                $focusedField,
                equals: .role
            ) {
                focusedField = .hospitalName
            }
            
            BorderLabelTextField(
                text: $hospitalName,
                placeHolder: "Hospital Name",
                isMandatoryField: true
            )
            .focusedField(
                $focusedField,
                equals: .hospitalName
            ) {
                focusedField = .address
            }
            
            BorderLabelTextField(
                text: $address,
                placeHolder: "Address",
                isMandatoryField: true
            )
            .focusedField(
                $focusedField,
                equals: .address
            ) {
                focusedField = .shiftTime
            }
            
            shiftTimeField
                .focused($focusedField, equals: .shiftTime)
            
            BorderLabelTextField(
                text: $wages,
                placeHolder: "Pay scale",
                isMandatoryField: true,
                keyboardType: .decimalPad
            )
            .focusedField(
                $focusedField,
                equals: .wages
            ) {
                focusedField = .doctorsNeed
            }
            
            BorderLabelTextField(
                text: $doctorsNeed,
                placeHolder: "Doctors Needed",
                isMandatoryField: true,
                keyboardType: .numberPad
            )
            .focusedField(
                $focusedField,
                equals: .doctorsNeed
            ) {
                focusedField = .description
            }
            
            BorderLabelTextField(
                text: $description,
                placeHolder: "Job Description",
                isMandatoryField: true,
                isParagraph: true
            )
            .focusedField(
                $focusedField,
                equals: .description
            ) {
                focusedField = .qualifications
            }
            
            BorderLabelTextField(
                text: $qualifications,
                placeHolder: "Qualifications",
                isMandatoryField: true,
                isParagraph: true
            )
            deadlineField
        }
        // TODO: Add next function for number fields
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Next") {
//                    focusedField = .description
                }
            }
        }
    }
}

private extension CreatePostView {
    var navigationBar: some View {
        VStack(spacing: .zero) {
            HStack(spacing: 24) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .fontWeight(.bold)
                }
                
                Text("Create post")
                    .font(.semiBold(size: 20))
                
                Spacer()
            }
            .padding(.top, 8)
            .padding(.bottom, 16)
            .foregroundStyle(.beetleGreen)
        }
    }
    
    var shiftTimeField: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text("Time Shift")
                .font(.semiBold(size: 14))
                .foregroundStyle(.beetleGreen)
            
            DatePicker(
                "From",
                selection: $shiftTimingFrom,
                displayedComponents: [.date, .hourAndMinute]
            )
            .font(.semiBold(size: 14))
            .foregroundStyle(.coolGray)
            .padding(.bottom, 8)
            
            DatePicker(
                "To",
                selection: $shiftTimingTo,
                displayedComponents: [.date, .hourAndMinute]
            )
            .font(.semiBold(size: 14))
            .foregroundStyle(.coolGray)
        }
    }
    
    var deadlineField: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text("Deadline")
                .font(.semiBold(size: 14))
                .foregroundStyle(.beetleGreen)
            
            DatePicker(
                "Select deadline",
                selection: $deadline,
                displayedComponents: [.date, .hourAndMinute]
            )
            .font(.semiBold(size: 14))
            .foregroundStyle(.coolGray)
            .padding(.bottom, 8)
        }
    }
    
    var footerView: some View {
        HStack {
            ButtonView(
                title: "Cancel",
                titleColor: .mediumGray,
                outlineColor: .coolGray
            ) {
                dismiss()
            }
            
            ButtonView(
                title: "Create",
                titleColor: .white,
                fillColor: .beetleGreen
            ) {
                viewModel.createModel(
                    role: role,
                    hospitalName: hospitalName,
                    address: address,
                    shiftTimingFrom: shiftTimingFrom,
                    shiftTimingTo: shiftTimingTo,
                    wages: wages,
                    doctorsNeed: doctorsNeed,
                    description: description,
                    qualifications: qualifications,
                    deadline: deadline
                )
            }
        }
    }
}

#Preview {
    CreatePostView()
}
