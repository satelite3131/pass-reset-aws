//
//  AuthScreenViewModel.swift
//  PassResetAws
//
//  Created by Anton Klimenko on 3/21/24.
//

import Foundation

class AuthScreenViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var navigateToResetPass = false
    
    let resetPassViewModel: ResetPassViewModel
    
    init() {
        self.resetPassViewModel = ResetPassViewModel()
    }
    
    func forgotPassword() {
        navigateToResetPass = true
    }
}

