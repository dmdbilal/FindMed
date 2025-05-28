//
// JobView.swift
// FindMed
//
// Created by Mohamed Bilal on 14/04/25
//

import SwiftUI

struct JobView: View {
    let data: Post
    var onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .leading, spacing: .zero) {
                    HStack {
                        Text(data.title)
                            .font(.semiBold(size: 14))
                            .foregroundStyle(.black)
                        
                        Spacer()
                        
                        Text(data.postedOn)
                            .font(.semiBold(size: 10))
                            .foregroundStyle(.coolGray)
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .leading ,spacing: .zero) {
                        Text(data.hospitalName)
                            .font(.semiBold(size: 14))
                            .foregroundStyle(.beetleGreen)
                        
                        Text(data.fullAddress)
                            .font(.regular(size: 12))
                            .foregroundStyle(.coolGray)
                        
                        HStack(spacing: 8) {
//                            Image(systemName: "clock.fill")
//                                .frame(width: 16, height: 16)
                            
                            VStack(alignment: .leading) {
                                Text("From: \(data.shiftTime.from.toCustomFormat("h a, d MMM yyyy"))") // TODO: format
                                    .font(.semiBold(size: 12))
                                
                                Text("To: \(data.shiftTime.to.toCustomFormat("h a, d MMM yyyy"))") // TODO: format
                                    .font(.semiBold(size: 12))
                            }
                        }
                        .foregroundStyle(.beetleGreen)
                        .padding(.top, 24)
                    }
                }
                .padding(16)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.skyTeal, lineWidth: 2)
                }
                
                ZStack {
                    UnevenRoundedRectangle(
                        cornerRadii: .init(
                            topLeading: 8,
                            bottomTrailing: 8
                        )
                    )
                    .frame(width: 100, height: 28)
                    .foregroundStyle(.tealGreen)
                    
                    Text("₹ \(data.formattedWages) p/h")
                        .font(.bold(size: 14))
                        .foregroundStyle(.white)
                }
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(PlainButtonStyle())
        .padding(4)
//        .onTapGesture {
//            onTap()
//        }
    }
}

#Preview {
    JobView(data: Post.mock[0]) {}
}
