//
// HistoryCard.swift
// FindMed
//
// Created by Mohamed Bilal on 20/04/25
//

import SwiftUI

struct HistoryCard: View {
    let data: Application
    var onTap: () -> Void
    
    var post: Post? {
        Post.getPost(id: data.postID)
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading, spacing: .zero) {
                HStack {
                    Text(post?.title ?? "")
                        .font(.semiBold(size: 14))
                        .foregroundStyle(.black)
                    
                    Spacer()
                    
                    Text("\(data.applicationDate.daysAgo)d ago")
                        .font(.semiBold(size: 10))
                        .foregroundStyle(.coolGray)
                }
                .padding(.bottom, 8)
                
                VStack(alignment: .leading ,spacing: .zero) {
                    Text(post?.hospitalName ?? "")
                        .font(.semiBold(size: 14))
                        .foregroundStyle(.beetleGreen)
                    
                    Text(post?.fullAddress ?? "")
                        .font(.regular(size: 12))
                        .foregroundStyle(.coolGray)
                    
                    VStack(alignment: .leading) {
                        Text("From: \(post?.shiftTime.from.toCustomFormat("h a, d MMM yyyy") ?? "")") // TODO: format
                            .font(.semiBold(size: 12))
                        
                        Text("To: \(post?.shiftTime.to.toCustomFormat("h a, d MMM yyyy") ?? "")") // TODO: format
                            .font(.semiBold(size: 12))
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
                .frame(width: 120, height: 28)
                .foregroundStyle(data.status.color)
                
                Text(data.status.statusText)
                    .font(.bold(size: 14))
                    .foregroundStyle(.white)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            
        }
    }
}

#Preview {
    HistoryCard(data: .mock[0]) {}
}
