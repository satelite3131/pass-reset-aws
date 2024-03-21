//
//  ResetPassView.swift
//  PassResetAws
//
//  Created by Anton Klimenko on 3/21/24.
//

import SwiftUI

struct ResetPassView: View {
    @ObservedObject var viewModel: ResetPassViewModel
    
    var body: some View {
        VStack (spacing: 16) {
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Reset Password") {
                Task {
                    await viewModel.resetPassword()
                }
            }
            
            if !viewModel.errorText.isEmpty {
                Text(viewModel.errorText)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
        .navigationBarTitle("Reset Password")
        .background(
            NavigationLink(
                destination: NewPassView(viewModel: NewPassViewModel(email: viewModel.email)),
                isActive: $viewModel.isPasswordResetSuccessful,
                label: { EmptyView() }
            )
        )
    }
}

