//
//  PassResetAwsApp.swift
//  PassResetAws
//
//  Created by Anton Klimenko on 3/21/24.
//

import SwiftUI
import Amplify
import AWSCognitoAuthPlugin

@main
struct PassResetAwsApp: App {
    init() {
        configureAmplify()
    }
    
    var body: some Scene {
        WindowGroup {
            AuthScreenView(viewModel: AuthScreenViewModel())
        }
    }
    
    private func configureAmplify() {
        do {
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.configure()
            print("Amplify configured successfully")
        } catch {
            print("An error occurred while configuring Amplify: \(error)")
        }
    }
}
