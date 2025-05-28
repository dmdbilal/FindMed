//
// MyTabBar.swift
// FindMed
//
// Created by Mohamed Bilal on 13/04/25
//

import SwiftUI

enum MyTabBarItem: String, CaseIterable {
    case jobs, history, home, chat, profile
    
    var iconName: String {
        switch self {
        case .jobs: return "ic_jobs"
        case .history: return "ic_history"
        case .home: return "ic_home"
        case .chat: return "ic_chat"
        case .profile: return "ic_profile"
        }
    }
    
    var title: String {
        switch self {
        case .jobs: return "Jobs"
        case .history: return "History"
        case .home: return "Home"
        case .chat: return "Chat"
        case .profile: return "Profile"
        }
    }
}

struct MyTabBar: View {
    @State private var selectedTab: MyTabBarItem = .home
    @EnvironmentObject var appState: AppState
    
    @StateObject private var viewModel = MyJobsViewModel(jobs: Post.mock)
    
    @ViewBuilder
    var tabContent: some View {
        switch selectedTab {
        case .jobs:
            MyJobsView()
                .environmentObject(viewModel)
        case .history: MyHistoryView()
        case .home:
            let _ = print(appState.isSignedIn)
            MyHomeView()
        case .chat:
            MyChatsView()
        default:
            ButtonView(title: "Sign out", titleColor: .white, fillColor: .beetleGreen) {
                appState.isSignedIn = false
                let _ = print(appState.isSignedIn)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: .zero) {
                Spacer()
                tabContent
                
                HStack {
                    ForEach(MyTabBarItem.allCases, id: \.self) { item in
                        let isSelected = (selectedTab == item)
                        let itemImageSize: CGFloat = isSelected ? 28 : 24
                        let itemColor: Color = isSelected ? .beetleGreen : .coolGray
                        
                        Button {
                            withAnimation(.spring()) { /// For screen transitions
                                selectedTab = item
                            }
                        } label: {
                            VStack(spacing: 4) {
                                Image(item.iconName)
                                    .resizable()
                                    .frame(width: itemImageSize, height: itemImageSize)
                                
                                Text(item.title)
                                    .font(isSelected ? .bold(size: 10) : .regular(size: 10))
                            }
                            .foregroundColor(itemColor)
                            .padding(.top, 8)
                            .frame(maxWidth: .infinity)
                            .scaleEffect(isSelected ? 1.1 : 1.0)
                            .animation(.easeInOut(duration: 0.1), value: selectedTab) /// To speed-up the scale effect
                        }
                    }
                }
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}
