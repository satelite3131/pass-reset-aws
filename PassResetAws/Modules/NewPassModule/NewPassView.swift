//
//  NewPassView.swift
//  PassResetAws
//
//  Created by Anton Klimenko on 3/21/24.
//

import SwiftUI
import Amplify

struct NewPassView: View {
    @ObservedObject var viewModel: NewPassViewModel

    var body: some View {
        VStack (spacing: 16) {
            TextField("Code", text: $viewModel.code)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("New Password", text: $viewModel.newPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            if !viewModel.errorText.isEmpty {
                Text(viewModel.errorText)
                    .foregroundColor(.red)
                    .padding()
            }
            Button("Confirm") {
                viewModel.confirmPasswordReset()
            }
            .disabled(viewModel.code.isEmpty || viewModel.newPassword.isEmpty)
        }
        .padding()
        .navigationBarTitle("New Password")
        .background(
            NavigationLink(destination: SuccessView(), isActive: $viewModel.navigateToSuccessView) {
                EmptyView()
            }
            .hidden()
        )
    }
}
