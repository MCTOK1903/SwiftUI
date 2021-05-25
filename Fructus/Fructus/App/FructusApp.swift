//
//  FructusApp.swift
//  Fructus
//
//  Created by Celal Tok on 20.05.2021.
//

import SwiftUI

@main
struct FructusApp: App {
    
    @AppStorage("isOnBoarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}
