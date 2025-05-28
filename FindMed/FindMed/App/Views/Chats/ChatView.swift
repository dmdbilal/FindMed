//
// ChatView.swift
// FindMed
//
// Created by Mohamed Bilal on 11/05/25
//

import SwiftUI

struct ChatView: View {
    let data: Chat
    let onTap: () -> Void

    var body: some View {
        HStack {
            Image("user_profile")
                .resizable()
                .clipShape(Circle())
                .frame(width: 44, height: 44)
            
            VStack(alignment: .leading, spacing: .zero) {
                HStack {
                    Text(data.participants[1].name)
                        .font(.semiBold(size: 16))
                        .foregroundStyle(.black)
                    
                    Spacer()
                    
                    Text(lastTimestamp)
                        .font(.regular(size: 12))
                        .foregroundStyle(.coolGray)
                }
                .padding(.bottom, 4)
                
                Text(data.messages.last?.content ?? "")
                    .font(.regular(size: 14))
                    .foregroundStyle(.coolGray)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            
            Spacer()
        }
        .contentShape(Rectangle())
        .buttonStyle(PlainButtonStyle())
        .onTapGesture {
            onTap()
        }
    }
}

extension ChatView {
    var lastTimestamp: String {
        guard let givenDate = data.messages.last?.timestamp else {
            return ""
        }
        let currentDate = Date()
        
        let givenDateSeconds = givenDate.timeIntervalSince1970
        let currentDateSeconds = currentDate.timeIntervalSince1970
        
        let diff = currentDateSeconds - givenDateSeconds
        
        if diff <= 86400 {
            return data.lastMessageTimestamp
        } else if diff > 86400 && diff <= 172800 {
            return "Yesterday"
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "d/M/yy"
            return formatter.string(from: givenDate)
        }
    }
}

#Preview {
    ChatView(data: Chat.mock[0]) {}
}
