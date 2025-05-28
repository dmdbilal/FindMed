//
// MainView.swift
// FindMed
//
// Created by Mohamed Bilal on 10/05/25
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        if appState.isSignedIn {
            MyTabBar() // Show Home Screen if signed in
        } else {
            SignInView() // Show Sign-In Screen if signed out
        }
    }
}
#Preview {
    MainView()
}
