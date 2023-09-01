//
//  FireBaseAuthApp.swift
//  FireBaseAuth
//
//  Created by Mukund vaghasiya  on 30/08/23.
//

import SwiftUI
import FirebaseCore

@main
struct FireBaseAuthApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            SinupView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
