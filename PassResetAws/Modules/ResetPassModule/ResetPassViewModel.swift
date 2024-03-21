//
//  ResetPassViewModel.swift
//  PassResetAws
//
//  Created by Anton Klimenko on 3/21/24.
//

import Amplify
import SwiftUI
import Combine

class ResetPassViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var errorText: String = ""
    @Published var isPasswordResetSuccessful = false
    
    private var cancellables = Set<AnyCancellable>()
    
    func resetPassword() async {
        guard !email.isEmpty else {
            errorText = "Email is empty"
            return
        }
        
        do {
            let result = try await Amplify.Auth.resetPassword(for: email)
            print("Password reset request sent successfully, the result is \(result)")
            DispatchQueue.main.async {
                self.isPasswordResetSuccessful = true
            }
        } catch {
            print("Error resetting password: \(error)")
            if let authError = error as? AuthError {
                DispatchQueue.main.async {
                    switch authError {
                    case .notAuthorized:
                        // Handle case when user is not authorized to make such actions
                        self.errorText = "Not Authorized to do that action (user might be blocked)"
                    case .unknown:
                        // Handle other unknown errors
                        self.errorText = "Unknown error"
                    default:
                        // Handle other AuthError cases as needed
                        self.errorText = "Error resetting password: \(authError)"
                    }
                }
            } else {
                DispatchQueue.main.async {
                    // Handle non-AuthError errors
                    self.errorText = "Non-AuthError: \(error)"
                }
            }
        }
    }
}
