//
//  TrackizerApp.swift
//  Trackizer
//
//  Created by Aditya's MacBook Pro on 01/02/23.
//

import SwiftUI
import IQKeyboardManagerSwift
import Firebase
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
    
    
    
    // MARK: - App lifecycle
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        FirebaseApp.configure()
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if error != nil || user == nil {
                // Show the app's signed-out state.
            } else {
                // Show the app's signed-in state.
            }
        }
        return true
    }
    
}

@main
struct TrackizerApp: App {
    
    
    @State var bool = false
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State var index : Int?
    var body: some Scene {
        WindowGroup {
            LaunchScreens()
                .onAppear {
                    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                        // Check if `user` exists; otherwise, do something with `error`
                    }
                }
        }
        
    }
}
