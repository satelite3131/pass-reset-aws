//
//  AuthScreenView.swift
//  PassResetAws
//
//  Created by Anton Klimenko on 3/21/24.
//

import SwiftUI

struct AuthScreenView: View {
    @ObservedObject var viewModel: AuthScreenViewModel
    
    var body: some View {
        NavigationView {
            VStack (spacing: 16) {
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button("Log In") {
                }
                .disabled(viewModel.email.isEmpty || viewModel.password.isEmpty)
                NavigationLink(
                    destination: ResetPassView(viewModel: viewModel.resetPassViewModel),
                    label: {
                        Text("Forgot Password")
                    }
                )
            }
            .padding()
            .navigationBarTitle("Log In")
        }
    }
}


