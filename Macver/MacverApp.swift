//
//  MacverApp.swift
//  Macver
//
//  Created by paige on 12/15/24.
//

import SwiftUI

@main
struct MacverApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .fixedSize()
        }
        .windowResizability(.contentSize)
        .windowStyle(.hiddenTitleBar)
    }
}
