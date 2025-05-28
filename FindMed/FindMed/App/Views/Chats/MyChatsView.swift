//
// MyChatsView.swift
// FindMed
//
// Created by Mohamed Bilal on 11/05/25
//

import SwiftUI

struct MyChatsView: View {
    @State private var searchText = ""
    @State private var showChatDetail = false
    @State private var chats: [Chat]
    @State private var allChats: [Chat]
    
    @State private var showDeleteAlert = false
    @State private var chatToDelete: Chat? = nil
    
    init(chats: [Chat] = []) {
        let mockChats = Chat.mock
        self._chats = State(initialValue: mockChats)
        self.allChats = mockChats
        print(mockChats)
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Chats")
                    .font(.semiBold(size: 20))
                
                ScrollView(showsIndicators: false) {
                    SearchBar($searchText)
                        .padding(.bottom, 16)
                    
                    VStack(spacing: 24) {
                        ForEach(chats, id: \.id) { chat in
                            ChatView(data: chat) {
                                searchText = ""
                                showChatDetail = true
                            }
                            .onLongPressGesture {
                                chatToDelete = chat
                                showDeleteAlert = true
                                print("Long press")
                            }
                            .alert(isPresented: $showDeleteAlert) {
                                alertView
                            }
                        }
                    }
                    .navigationDestination(isPresented: $showChatDetail) {
                        ChatDetailView()
                            .navigationBarBackButtonHidden()
                    }
                }
            }
            .onChange(of: searchText) {
                withAnimation(.snappy(duration: 0.25)) {
                    if searchText.isEmpty {
                        chats = allChats
                    } else {
                        chats = allChats.filter { chat in
                            chat.participants.contains { $0.name.localizedCaseInsensitiveContains(searchText) }
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

private extension MyChatsView {
    var alertView: Alert {
        Alert(
            title: Text("Delete Chat"),
            message: Text("Are you sure you want to delete this chat?"),
            primaryButton: .destructive(Text("Delete")) {
                if let chat = chatToDelete,
                   let index = chats.firstIndex(where: { $0.id == chat.id }) {
                    chats.remove(at: index)
                }
                chatToDelete = nil
            },
            secondaryButton: .cancel() {
                chatToDelete = nil
            }
        )
    }
}

#Preview {
    MyChatsView()
}
