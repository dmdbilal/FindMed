//
// SignInView.swift
// FindMed
//
// Created by Mohamed Bilal on 10/05/25
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var appState: AppState

    @State var emailAddress: String = ""
    @State var password: String = ""
    @State private var isSecured: Bool = true
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("Sign In")
                    .font(.bold(size: 24))
                
                FloatingBorderLabelTextField(text: $emailAddress,placeHolder: "Email")
                
                PasswordInputField(text: $password, placeHolder: "Password")
                
                ButtonView(
                    title: "Sign In",
                    titleColor: .white,
                    fillColor: .beetleGreen,
                    height: 50
                ) {
                    AuthService.shared.signIn(
                        email: emailAddress,
                        password: password
                    ) { result in
                        switch result {
                        case .success(let message):
                            print(message)
                            DispatchQueue.main.async {
                                appState.isSignedIn = true
                            }
                        case .failure(let error):
                            print("Error: \(error.localizedDescription)")
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    SignInView()
}
