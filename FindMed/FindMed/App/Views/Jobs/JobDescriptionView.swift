//
// JobDescriptionView.swift
// FindMed
//
// Created by Mohamed Bilal on 14/04/25
//

import SwiftUI
import MapKit

struct JobDescriptionView: View {
    let data: Post
    
    @Environment(\.dismiss) private var dismiss
    @State private var showApplyDialog = false
//    @State private var mapPosition = MapCameraPosition.region(
//        MKCoordinateRegion(
//            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
//            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
//        )
//    )
    @State private var showApplicationForm: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            navigationBar
            contentView
        }
        .padding(.horizontal, 16)
        .customAlert(isPresented: $showApplyDialog) { onDismiss in
            DialogView(
                title: "Apply with single click",
                note: "If you want to continue with your current profile without any updates, click the Quick Apply else, click Apply.",
                buttonTitle1: "Apply",
                buttonAction1: {
                    showApplicationForm.toggle()
                    onDismiss()
                },
                buttonTitle2: "Quick Apply",
                buttonAction2: {}
            ) {
                onDismiss()
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbarVisibility(.hidden)
        .navigationDestination(isPresented: $showApplicationForm) {
            ApplicationFormView()
                .presentationCompactAdaptation(.fullScreenCover)
                .navigationBarBackButtonHidden()
        }
    }
}

// MARK: Content & Views
extension JobDescriptionView {
    var navigationBar: some View {
        VStack(spacing: .zero) {
            HStack(spacing: 24) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .fontWeight(.bold)
                }
                
                Text("Job Description")
                    .font(.semiBold(size: 20))
                
                Spacer()
            }
            .padding(EdgeInsets(top: 8, leading: .zero, bottom: 16, trailing: .zero))
            .foregroundStyle(.beetleGreen)
        }
    }
    
    @ViewBuilder
    var contentView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                topView
                
                createDescriptionView(title: "Job Description", description: data.description)
                
                createDescriptionView(title: "Qualifications", description: data.qualifications)
                
                adminContactView
//                locationPreview
                
            }
        }
        .scrollIndicators(.hidden)
        Spacer()
        footerButtonsView
    }
    
    var topView: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text(data.title)
                .font(.semiBold(size: 18))
                .padding(.vertical, 16)
            
            Text(data.hospitalName)
                .font(.semiBold(size: 14))
                .foregroundStyle(.beetleGreen)
            
            Text(data.fullAddress)
                .font(.regular(size: 14))
                .foregroundStyle(.coolGray)
            
            HStack(spacing: 8) {
                Image(systemName: "clock.fill")
                    .frame(width: 16, height: 16)
                
                VStack(alignment: .leading) {
                    Text("From: \(data.shiftTime.from.toCustomFormat("h a, d MMM yyyy"))")
                        .font(.semiBold(size: 14))
                    
                    Text("To: \(data.shiftTime.to.toCustomFormat("h a, d MMM yyyy"))")
                        .font(.semiBold(size: 14))
                }
            }
            .foregroundStyle(.beetleGreen)
            .padding(.top, 24)
            
            HStack(spacing: 8) {
                Image(systemName: "indianrupeesign.circle.fill")
                    .frame(width: 16, height: 16)
                
                Text("\(data.formattedWages) per hour")
                    .font(.semiBold(size: 14))
            }
            .foregroundStyle(.beetleGreen)
            .padding(.top, 16)
            
            VStack(alignment: .center) {
                HStack(spacing: 24) {
                    Text("Posted: ") + Text("\(data.postedOn)").bold()
                    Text("Openings: ") + Text("\(data.openings)").bold()
                    Text("Applicants: ") + Text("\(data.applicants)").bold()
                }
                .font(.regular(size: 14))
                .foregroundStyle(.coolGray)
                .padding(.top, 24)
            }
            .frame(maxWidth: .infinity)
            
            Divider()
                .frame(height: 2)
                .overlay(.lightGray)
                .padding(.top, 16)
        }
    }
    
    func createDescriptionView(title: String, description: String) -> some View {
        return VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.semiBold(size: 16))
            
            Text(description)
                .font(.regular(size: 14))
        }
    }
    
    var adminContactView: some View {
        HStack(spacing: 16) {
            Image("user_profile")
                .resizable()
                .clipShape(Circle())
                .frame(width: 44, height: 44)
            
            VStack(alignment: .leading, spacing: .zero) {
                Text("Admin name")
                    .font(.semiBold(size: 16))
                
                Text("Hospital")
                    .font(.medium(size: 12))
                    .foregroundStyle(.coolGray)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "message.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.tealGreen)
            }
        }
    }
    
//    var locationPreview: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            Text("Hospital Location")
//                .font(.semiBold(size: 16))
//            
//            Map(initialPosition: mapPosition)
//                .frame(height: 160)
//                .cornerRadius(8)
//        }
//    }
    
    var footerButtonsView: some View {
        HStack(spacing: 16) {
            ButtonView(
                title: "Cancel",
                titleColor: .coolGray,
                outlineColor: .coolGray
            ) {
                dismiss()
            }
            
            ButtonView(
                title: "Apply",
                titleColor: .white,
                fillColor: .beetleGreen
            ) {
                showApplyDialog.toggle()
            }
        }
        .padding(.horizontal, 4)
    }
}

#Preview {
    JobDescriptionView(
        data: Post.mock[0]
    )
}
