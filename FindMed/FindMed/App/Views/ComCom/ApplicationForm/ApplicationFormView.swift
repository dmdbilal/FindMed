//
// ApplicationFormView.swift
// FindMed
//
// Created by Mohamed Bilal on 27/04/25
//

import SwiftUI

struct ApplicationFormView: View {
    @Environment(\.dismiss) var dismiss
        
    /** Personal Information Texts **/
    @State private var fullName: String = ""
    @State private var gender: String = "Male"
    private let genders = ["Male", "Female", "Other"]
    @State private var showGenderOptions: Bool = false
    @State private var dateOfBirth: Date = Date()
    @State private var phoneNumber: String = ""
    @State private var emailAddress: String = ""
    @State private var residentialAddress: String = ""
    @State private var languagesSpoken: String = ""
    
    /** Educational Background Texts **/
    @State private var degree: String = ""
    @State private var collegeName: String = ""
    @State private var graduationYear: Date = Date()
    @State private var academicAchievements: String = ""
    @State private var certifications: String = ""
    @State private var internshipResidencyInfo: String = ""
    @State private var licenseInfo: String = ""
    
    /** Professional Background Texts **/
    @State private var currentJobTitle: String = ""
    @State private var hospitalName: String = ""
    @State private var currentRole: String = ""
    @State private var workExperienceTimeline: String = ""
    @State private var specializations: String = ""
    @State private var skills: String = ""
    @State private var professionalAffiliations: String = ""
    
    /** Documents **/
    @State private var medicalLicenseURL: URL?
    @State private var medicalLicenseIsShowing: Bool = false

    @State private var degreeCertificateURL: URL?
    @State private var degreeCertificateIsShowing: Bool = false

    @State private var residencyCompletionCertificateURL: URL?
    @State private var residencyCertificateIsShowing: Bool = false

    @State private var medicalSchoolTranscriptsURL: URL?
    @State private var medicalSchoolTranscriptsIsShowing: Bool = false

    @State private var boardCertificationURL: URL?
    @State private var boardCertificationIsShowing: Bool = false

    @State private var otherRelevantCertificationsURL: URL?
    @State private var otherRelevantCertificationsIsShowing: Bool = false

    @State private var identityProofURL: URL?
    @State private var identityProofIsShowing: Bool = false

    @State private var proofOfAddressURL: URL?
    @State private var proofOfAddressIsShowing: Bool = false

    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            navigationBar
            
            ScrollView {
                VStack(spacing: .zero) {
                    personalInfoFields
                    educationalBackgroundFields
                    professionalBackgroundFields
                    documents
                    
                    HStack {
                        ButtonView(
                            title: "Cancel",
                            titleColor: .mediumGray,
                            outlineColor: .coolGray
                        ) {
                            dismiss()
                        }
                        
                        ButtonView(
                            title: "Apply",
                            titleColor: .white,
                            fillColor: .beetleGreen
                        ) {}
                    }
                    .padding(.vertical, 24)
                }
                .padding(.horizontal, 2)
            }
            
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

private extension ApplicationFormView {
    var navigationBar: some View {
        VStack(spacing: .zero) {
            HStack(spacing: 24) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .fontWeight(.bold)
                }
                
                Text("Application Form")
                    .font(.semiBold(size: 20))
                
                Spacer()
            }
            .padding(EdgeInsets(top: 8, leading: .zero, bottom: 16, trailing: .zero))
            .foregroundStyle(.beetleGreen)
        }
    }
    
    @ViewBuilder
    var genderField: some View {
        HStack {
            Text("Gender")
                .font(.semiBold(size: 14))
                .foregroundStyle(.coolGray)
            
            Spacer()
            
            Picker("Gender", selection: $gender) {
                ForEach(genders, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            .frame(width: 200)
        }
        
        Rectangle()
            .foregroundStyle(.lightGray.opacity(0.5))
            .frame(height: 1)
    }
    
    @ViewBuilder
    var personalInfoFields: some View {
        Text("Personal Information")
            .font(.semiBold(size: 16))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 8)
        
        LabelTextField(
            text: $fullName,
            placeHolder: "Full Name"
        )
        
        dropDownField($gender)
            .padding(.vertical, 8)
        
        dobField
        
        LabelTextField(
            text: $phoneNumber,
            placeHolder: "Phone Number"
        )
        
        LabelTextField(
            text: $emailAddress,
            placeHolder: "Email Address"
        )
        
        LabelTextField(
            text: $residentialAddress,
            placeHolder: "Residential Address"
        )
        
        LabelTextField(
            text: $languagesSpoken,
            placeHolder: "Languages Spoken"
        )
        .padding(.bottom, 24)
    }
    
    @ViewBuilder
    var educationalBackgroundFields: some View {
        Text("Educational Background")
            .font(.semiBold(size: 16))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 8)
        
        LabelTextField(
            text: $degree,
            placeHolder: "Degree/Qualification"
        )
        
        LabelTextField(
            text: $collegeName,
            placeHolder: "University/College Name"
        )
        
        DatePicker(
            "Graduation Year",
            selection: $graduationYear,
            displayedComponents: .date
        )
        .font(.semiBold(size: 14))
        .foregroundStyle(.coolGray)
        
        Divider()
        
        LabelTextField(
            text: $academicAchievements,
            placeHolder: "Academic Achievements"
        )
        
        LabelTextField(
            text: $certifications,
            placeHolder: "Certifications"
        )
        .padding(.bottom, 24)
    }
    
    @ViewBuilder
    var professionalBackgroundFields: some View {
        Text("Professional Background")
            .font(.semiBold(size: 16))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 8)
        
        LabelTextField(
            text: $currentJobTitle,
            placeHolder: "Current Job Title"
        )
        
        LabelTextField(
            text: $hospitalName,
            placeHolder: "Hospital"
        )
        
        LabelTextField(
            text: $currentRole,
            placeHolder: "Role"
        )
        
        LabelTextField(
            text: $specializations,
            placeHolder: "Specializations"
        )
        
        LabelTextField(
            text: $skills,
            placeHolder: "Skills"
        )
        
        LabelTextField(
            text: $professionalAffiliations,
            placeHolder: "Professional Affiliations"
        )
        .padding(.bottom, 24)
    }
    
    @ViewBuilder
    var documents: some View {
        Text("Documents")
            .font(.semiBold(size: 16))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 8)
        
        documentUploadField(
            label: "Degree Certificate",
            url: $degreeCertificateURL,
            isShowing: $degreeCertificateIsShowing
        )

        documentUploadField(
            label: "Residency Completion Certificate",
            url: $residencyCompletionCertificateURL,
            isShowing: $residencyCertificateIsShowing
        )

        documentUploadField(
            label: "Medical School Transcripts",
            url: $medicalSchoolTranscriptsURL,
            isShowing: $medicalSchoolTranscriptsIsShowing
        )

        documentUploadField(
            label: "Board Certification",
            url: $boardCertificationURL,
            isShowing: $boardCertificationIsShowing
        )

        documentUploadField(
            label: "Other Relevant Certifications",
            url: $otherRelevantCertificationsURL,
            isShowing: $otherRelevantCertificationsIsShowing
        )

        documentUploadField(
            label: "Identity Proof",
            url: $identityProofURL,
            isShowing: $identityProofIsShowing
        )

        documentUploadField(
            label: "Proof of Address",
            url: $proofOfAddressURL,
            isShowing: $proofOfAddressIsShowing
        )
    }
    
    @ViewBuilder
    func dropDownField(_ textBinding: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: .zero) {
            HStack {
                Text(gender)
                    .font(.semiBold(size: 14))
                
                Spacer()
                
                Image(systemName: "chevron.down")
                    .rotationEffect(.degrees(showGenderOptions ? 180 : 0))
                    .animation(.easeInOut, value: showGenderOptions)
                    .foregroundStyle(.coolGray)
            }
            .contentShape(.rect)
            .onTapGesture {
                withAnimation(.snappy) {
                    showGenderOptions.toggle()
                }
            }
            
            if showGenderOptions {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(genders, id: \.self) { gender in
                        Text(gender)
                            .font(.semiBold(size: 14))
                            .foregroundStyle(.coolGray)
                            .padding(.vertical, 5)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.25)) {
                                    self.gender = gender
                                    showGenderOptions.toggle()
                                }
                            }
                        
                        Divider()
                    }
                }
                .padding(.horizontal, 8)
                .padding(.top, 8)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.coolGray, lineWidth: 1)
                }
                .padding(.top, 16)
            }
            
            Divider()
                .padding(.top, 8)
        }
    }
    
    @ViewBuilder
    var dobField: some View {
        DatePicker(
            "Date of Birth",
            selection: $dateOfBirth,
            displayedComponents: [.date]
        )
        .font(.semiBold(size: 14))
        .foregroundStyle(.coolGray)
        
        Divider()
    }
    
    func documentUploadField(label: String, url: Binding<URL?>, isShowing: Binding<Bool>) -> some View {
        HStack {
            Text(label)
                .font(.semiBold(size: 14))
                .foregroundStyle(.coolGray)
            
            Spacer()
            
            Button {
                isShowing.wrappedValue.toggle()
            } label: {
                Text(url.wrappedValue?.lastPathComponent ?? "Upload")
                    .font(.semiBold(size: 12))
                    .foregroundStyle(.beetleGreen)
            }
            .fileImporter(
                isPresented: isShowing,
                allowedContentTypes: [.item],
                allowsMultipleSelection: false
            ) { result in
                switch result {
                case .success(let Fileurl):
                    url.wrappedValue = Fileurl.last
                case .failure(let error):
                    print(error)
                }
            }
            .padding(.horizontal, 16)
            .frame(height: 40)
            .background {
                RoundedRectangle(cornerRadius: 24)
                    .fill(.skyTeal)
            }
        }
        .padding(.bottom, 16)
    }
}

#Preview {
    NavigationStack {
        ApplicationFormView()
    }
}
