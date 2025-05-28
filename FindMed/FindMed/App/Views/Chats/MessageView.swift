//
// MessageView.swift
// FindMed
//
// Created by Mohamed Bilal on 16/05/25
//

import SwiftUI

struct MessageView: View {
    let data: Message
    
    var body: some View {
        HStack{
            if isSender {
                Spacer()
            }
            
            VStack(alignment: contentAlignment) {
                Text(data.content)
                    .font(.regular(size: 14))
                    .foregroundStyle(messageTextColor)
                    .padding()
                    .background {
                        UnevenRoundedRectangle(
                            cornerRadii: cornerRadii
                        )
                        .fill(isSender ? .beetleGreen : .skyTeal)
                    }
                
                Text(timestamp)
                    .font(.regular(size: 12))
                    .foregroundStyle(.mediumGray)
            }
            
            if !isSender {
                Spacer()
            }
        }
    }
}

private extension MessageView {
    var isSender: Bool {
        data.senderType == .doctor ? true : false
    }
    
    var timestamp: String {
        data.timestamp.toCustomFormat("h:mm a")
    }
    
    var contentAlignment: HorizontalAlignment {
        isSender ? .trailing : .leading
    }
    
    var messageTextColor: Color {
        isSender ? .white : .black
    }
    
    var cornerRadii: RectangleCornerRadii {
        .init(
            topLeading: 15,
            bottomLeading: isSender ? 15 : 0,
            bottomTrailing: isSender ? 0 : 15,
            topTrailing: 15
        )
    }
}

#Preview {
    ScrollView {
        Group {
            MessageView(
                data: Message(
                    senderType: .doctor,
                    content: "Hello, how can I help you today?",
                    timestamp: Date().addingTimeInterval(-3600)
                )
            )
            MessageView(
                data: Message(
                    senderType: .hospital,
                    content: "I have a mild fever and cough. Should I be concerned?",
                    timestamp: Date().addingTimeInterval(-3500)
                )
            )
            MessageView(
                data: Message(
                    senderType: .doctor,
                    content: "It's best to monitor your symptoms. If you develop shortness of breath, please visit the hospital.",
                    timestamp: Date().addingTimeInterval(-3400)
                )
            )
            MessageView(
                data: Message(
                    senderType: .hospital,
                    content: "Thank you, doctor. I will keep you updated.",
                    timestamp: Date().addingTimeInterval(-3300)
                )
            )
        }
    }
    .padding(.horizontal, 16)
}
