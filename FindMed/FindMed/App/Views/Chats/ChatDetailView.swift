//
// ChatDetailView.swift
// FindMed
//
// Created by Mohamed Bilal on 16/05/25
//

import SwiftUI

struct ChatDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var messageInput: String = ""
    @State private var messages: [Message] = [
        Message(
            senderType: .doctor,
            content: "Hello, how can I help you today?",
            timestamp: Date().addingTimeInterval(-3600)
        ),
        Message(
            senderType: .hospital,
            content: "I have a mild fever and cough. Should I be concerned?",
            timestamp: Date().addingTimeInterval(-3500)
        ),
        Message(
            senderType: .doctor,
            content: "It's best to monitor your symptoms. If you develop shortness of breath, please visit the hospital.",
            timestamp: Date().addingTimeInterval(-3400)
        ),
        Message(
            senderType: .hospital,
            content: "Thank you, doctor. I will keep you updated.",
            timestamp: Date().addingTimeInterval(-3300)
        ),
        Message(
            senderType: .doctor,
            content: "You're welcome! Please take care and let me know if anything changes.",
            timestamp: Date().addingTimeInterval(-3200)
        ),
        Message(
            senderType: .hospital,
            content: "Sure, doctor. Also, can I take paracetamol for the fever?",
            timestamp: Date().addingTimeInterval(-3100)
        ),
        Message(
            senderType: .doctor,
            content: "Yes, you can take paracetamol as prescribed on the label.",
            timestamp: Date().addingTimeInterval(-3000)
        ),
        Message(
            senderType: .hospital,
            content: "Thank you for the advice!",
            timestamp: Date().addingTimeInterval(-2900)
        )
    ]
    @State private var keyboardValue: CGFloat = 0
    
    var body: some View {
        VStack(spacing: .zero) {
            navigationBar
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            
            contentView
                .padding(.horizontal, 16)
            
            messageInputField
        }
    }
}

extension View {
    func getKeyboardHeight(from notification: Notification) -> CGFloat {
        let key = UIResponder.keyboardFrameEndUserInfoKey
        if let keyboardFrame = notification.userInfo?[key] as? CGRect {
            return keyboardFrame.height
        }
        return 0
    }
}

private extension ChatDetailView {
    private func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
    
    private func makeCall() {
        if let url = URL(string: "tel://1234567890") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @ViewBuilder
    var navigationBar: some View {
        VStack(spacing: .zero) {
            HStack(spacing: 24) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .fontWeight(.bold)
                        .foregroundStyle(.beetleGreen)
                }
                
                HStack {
                    Image("user_profile")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 44, height: 44)
                        .padding(.trailing, 8)
                    
                    VStack(alignment: .leading, spacing: .zero) {
                        Text("Admin name")
                            .font(.semiBold(size: 16))
                            .foregroundStyle(.black)
                        
                        Text("Admin is typing...")
                            .font(.regular(size: 12))
                            .foregroundStyle(.mediumGray)
                    }
                    
                    Spacer()
                    
                    Button {
                        makeCall()
                    } label: {
                        Image(systemName: "phone")
                            .fontWeight(.black)
                            .foregroundStyle(.beetleGreen)
                    }
                    .padding(9)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.coolGray.opacity(0.2), lineWidth: 1)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    var contentView: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack {
                    ForEach(messages, id: \.self) { message in
                        MessageView(data: message)
                            .id(message.id)
                    }
                }
            }
            .onAppear {
                if let lastMessage = messages.last?.id {
                    proxy.scrollTo(lastMessage, anchor: .bottom)
                }
                
                NotificationCenter.default.addObserver(
                    forName: UIResponder.keyboardWillShowNotification,
                    object: nil,
                    queue: .main
                ) { notification in
                    
                    if let lastMessage = messages.last?.id {
                        proxy.scrollTo(lastMessage, anchor: .bottom)
                    }
                }
            }
            .onChange(of: messages) {
                if let lastMessage = messages.last?.id {
                    withAnimation {
                        proxy.scrollTo(lastMessage, anchor: .bottom)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    var messageInputField: some View {
        HStack {
            Button {
                // TODO: Add documents
            } label: {
                Image(systemName: "plus")
                    .fontWeight(.bold)
                    .foregroundStyle(.beetleGreen)
            }
            
            Spacer()
            
            TextField("Write a message...", text: $messageInput)
                .font(.regular(size: 14))
                .frame(height: 44)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 16)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                }
                .onSubmit {
                    onSendMessage()
                }
            
            Spacer()
            
            Button {
                onSendMessage()
            } label: {
                Image(systemName: "paperplane.fill")
                    .fontWeight(.black)
                    .foregroundStyle(.beetleGreen)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(.skyTeal)
    }
    
    func onSendMessage() {
        if !messageInput.isEmpty {
            messages.append(
                Message(
                    senderType: .doctor,
                    content: messageInput,
                    timestamp: Date()
                )
            )
            messageInput = ""
        }
        //        hideKeyboard()
    }
}

#Preview {
    ChatDetailView()
}
