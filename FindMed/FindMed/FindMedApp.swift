//
//  FindMedApp.swift
//  FindMed
//
//  Created by Mohamed Bilal on 12/04/25.
//

import SwiftUI

@main
struct FindMedApp: App {
    @StateObject private var appState = AppState()
    
//    var defaultTabBar: some View {
//        TabView {
//            VStack {
//                MyJobsView()
//            }
//            .tabItem {
//                Image("ic_jobs")
//                Text("Jobs")
//                    .font(.regular(size: 10))
//            }
//            
//            VStack {
//                Text("Jobs History")
//            }
//            .tabItem {
//                Image("ic_history")
//                Text("History")
//                    .font(.regular(size: 10))
//            }
//            
//            MyHomeView()
//            .tabItem {
//                Image("ic_home")
//                Text("Home")
//                    .font(.regular(size: 10))
//            }
//            
//            VStack {
//                Text("Chats")
//            }
//            .tabItem {
//                Image("ic_chat")
//                Text("Chats")
//                    .font(.regular(size: 10))
//            }
//            
//            VStack {
//                Text("Profile")
//            }
//            .tabItem {
//                Image("ic_profile")
//                Text("Profile")
//                    .font(.regular(size: 10))
//            }
//        }
//        .tint(.beetleGreen)
//    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(appState)
    //            defaultTabBar
        }
    }
}
