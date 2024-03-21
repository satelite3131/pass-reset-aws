//
//  NewPassViewModel.swift
//  PassResetAws
//
//  Created by Anton Klimenko on 3/21/24.
//

import SwiftUI
import Amplify

class NewPassViewModel: ObservableObject {
    @Published var code: String = ""
    @Published var newPassword: String = ""
    @Published var errorText: String = ""
    @Published var navigateToSuccessView = false
    
    var email: String
    
    init(email: String) {
        self.email = email
    }

    func confirmPasswordReset() {
        Task {
            do {
                guard !code.isEmpty, !newPassword.isEmpty else {
                    errorText = "Code and new password cannot be empty"
                    return
                }
                
                try await Amplify.Auth.confirmResetPassword(
                    for: email,
                    with: newPassword,
                    confirmationCode: code
                )
                
                DispatchQueue.main.async {
                    self.navigateToSuccessView = true
                }
            } catch {
                let errorMessage = "Error confirming password reset: \(error.localizedDescription)"
                DispatchQueue.main.async {
                    self.errorText = errorMessage
                }
            }
        }
    }
}
